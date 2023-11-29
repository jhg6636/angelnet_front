import 'package:angelnet/models/admin/group.dart';
import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';

class GroupFundWidget extends StatefulWidget {

  final Group group;

  const GroupFundWidget({super.key, required this.group});

  @override
  State<StatefulWidget> createState() => GroupFundWidgetState();

}

class GroupFundWidgetState extends State<GroupFundWidget> {

  final searchOptions = ['전체', '조합명', '투자종목'];
  var selectedSearchOption = '전체';
  var isAdding = false;
  final searchTextController = TextEditingController();
  static const statusTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.45,
      color: Colors.white
  );
  var selectedMap = {};
  var selectedFundIds = <int>[];

  @override
  void initState() {
    super.initState();
    fetchFunds().then((funds) {
      setState(() {
        selectedFundIds = funds.map((fund) => fund.id).toList();
      });
    });
  }

  Future<List<Fund>> fetchFunds() async {
    return await fetchFundsInGroup(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("조합 목록", style: WidgetUtils.h1Style,),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
          color: const Color(0xfff7faff),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 120,
                  height: 42,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                        value: selectedSearchOption,
                        items: searchOptions
                            .map<DropdownMenuItem<String>>((value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          selectedSearchOption = value ?? "전체";
                        }),
                      )
                  )
              ),
              Container(
                  width: 320,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 29,
                          child: TextField(
                            controller: searchTextController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
                                hintText: "검색어를 입력하세요",
                                hintStyle: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575),
                                    letterSpacing: -0.16)),
                          )),
                      Flexible(
                          flex: 3,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 9.69, 0),
                              width: 20.31,
                              height: 20.31,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/search_icon.png'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
        ),
        if (!isAdding) Container(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xffcccccc)),
                  ),
                  padding: const EdgeInsets.fromLTRB(14, 10, 11, 10),
                  fixedSize: const Size(120, 36)
              ),
              onPressed: () {
                setState(() {
                  isAdding = true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: const Icon(
                      Remix.file_add_line,
                      size: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const Text(
                    "조합 편집",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.14,
                        color: Color(0xff333333)),
                  )
                ],
              )),
        ),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 31),
          child: FutureBuilder(
              future: (isAdding)? searchFunds() : fetchFundsInGroup(widget.group.id),
              builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                if (snapshot.hasError || !snapshot.hasData) {
                  StringUtils().printError(snapshot);
                  return const Center(
                    child: Text("조합이 없습니다.", style: WidgetUtils.dataTableDataStyle),
                  );
                } else {
                  return groupFundDataTable(snapshot.data!.indexed.map((e) => toGroupFundDataRow(e.$1 + 1, e.$2)).toList());
                }
              }
          ),
        ),
        if (isAdding) Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: WidgetUtils().buttonBar(
              "취소",
              "저장",
              () {
                setState(() {
                  isAdding = false;
                });
              },
              () async {
                var currentFundIds = (await fetchFunds()).map((fund) => fund.id).toList();
                var addingFunds = <int>[];
                for (var fundId in selectedFundIds) {
                  if (!currentFundIds.contains(fundId)) {
                    addingFunds.add(fundId);
                  }
                }
                var removingFunds = <int>[];
                for (var fundId in currentFundIds) {
                  if (!selectedFundIds.contains(fundId)) {
                    removingFunds.add(fundId);
                  }
                }

                var response1 = await postFundsInGroup(widget.group.id, addingFunds);
                var response2 = await deleteFundsFromGroup(widget.group.id, removingFunds);

                print('--responses--');
                print(response1.body);
                print(response2.body);

                setState(() {
                  print("-----addingFunds-----");
                  print(addingFunds);
                  print("-----removingFunds-----");
                  print(removingFunds);
                  isAdding = false;
                });
              }
          ),
        )
      ],
    );
  }

  DataRow toGroupFundDataRow(int index, Fund fund) {
    return DataRow(
        color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return Colors.white;
        }),
        selected: selectedFundIds.contains(fund.id),
        onSelectChanged: (selected) {
          setState(() {
            if (selected == true) {
              if (!selectedFundIds.contains(fund.id)) {
                selectedFundIds.add(fund.id);
              }
            } else {
              selectedFundIds.remove(fund.id);
            }
          });
        },
        cells: [
          DataCell(Text(index.toString())),
          DataCell(Text(fund.name)),
          DataCell(Text(fund.startupName)),
          DataCell(Text(fund.managerName)),
          DataCell(Text(fund.currentMemberCount.toString())),
          DataCell(fund.status.toSmallWidget()),
        ]
    );
  }

  DataTable groupFundDataTable(List<DataRow> rows) {
    return DataTable(
        showCheckboxColumn: isAdding,
        border: const TableBorder(
            top: BorderSide(color: Color(0xff333333), width: 2),
            horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
            bottom: BorderSide(color: Color(0xffe6e6e6))
        ),
        headingTextStyle: WidgetUtils.dataTableHeadStyle,
        dataTextStyle: WidgetUtils.dataTableDataStyle,
        dataRowMaxHeight: 62,
        dataRowMinHeight: 62,
        columns: const [
          DataColumn(label: Text("번호")),
          DataColumn(label: Text("조합명")),
          DataColumn(label: Text("투자종목")),
          DataColumn(label: Text("담당자")),
          DataColumn(label: Text("참여인원")),
          DataColumn(label: Text("진행상태")),
        ],
        rows: rows
    );
  }

}