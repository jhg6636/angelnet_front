import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/lp/fund_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/lp/fund.dart';
import '../screen_frame.dart';

/* todo 조합 형태 관련 부분 추가
 *
 */

class ManageFundScreen extends StatefulWidget {
  const ManageFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageFundScreenState();
}

class ManageFundScreenState extends State<ManageFundScreen> {
  final _nameSearchController = TextEditingController();
  final _startupNameSearchController = TextEditingController();

  final List<String> _fundStatusFilterOptions = [
    "READY",
    "FUNDING",
    "COMPLETE"
  ];

  final List<String> _selectedFundStatuses = [];

  Future<List<Fund>> funds = fetchAllFunds();

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 36.0),
          const Text(
            "조합 관리",
            style: WidgetUtils.titleStyle,
          ),
          const SizedBox(height: 36.0),
          Wrap(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _nameSearchController,
                      decoration: const InputDecoration(
                        labelText: "조합명",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _startupNameSearchController,
                      decoration: const InputDecoration(
                        labelText: "투자종목",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )),
              const Padding(
                  padding: EdgeInsets.all(10.0), child: Text("상태 (복수 선택 가능)")),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: _fundStatusFilterOptions.map((option) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: FilterChip(
                            label: Text(option),
                            selected: _selectedFundStatuses.contains(option),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _selectedFundStatuses.add(option);
                                } else {
                                  _selectedFundStatuses.remove(option);
                                }
                              });
                            }));
                  }).toList()),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    funds = fetchAllFunds();
                  });
                },
                icon: const Icon(Icons.search),
                label: const Text("검색"),
              ),
              FilledButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const FundForm(isMaking: true, fund: null);
                      });
                  setState(() {
                    funds = fetchAllFunds();
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("조합 생성"),
              ),
            ],
          ),
          FutureBuilder<List<Fund>>(
            future: funds,
            builder:
                (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                  ScrollController vertical = ScrollController();
                  ScrollController horizontal = ScrollController();
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    return Scrollbar(
                      controller: vertical,
                      child: SingleChildScrollView(
                        controller: vertical,
                        child: Scrollbar(
                          controller: horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: horizontal,
                            child: adminFundTable(snapshot.data ?? List.empty()),
                          ),
                        ),
                      )
                    );
                  }
            },
          ),
        ],
      ),
      isAdmin: true,
    );
  }
}

DataTable adminFundTable(List<Fund> funds) {
  return DataTable(columns: const [
    DataColumn(label: Text("번호")),
    DataColumn(label: Text("조합명")),
    DataColumn(label: Text("투자종목")),
    DataColumn(label: Text("총 결성금액")),
    DataColumn(label: Text("현재 참여금액")),
    DataColumn(label: Text("잔여 금액")),
    DataColumn(label: Text("현재 참여 인원")),
    DataColumn(label: Text("조합결성일")),
    DataColumn(label: Text("상태"))
  ], rows: funds.map<DataRow>((fund) => fund.toAdminDataRow()).toList());
}