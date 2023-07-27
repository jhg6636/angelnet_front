import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/fund/fund.dart';
import '../../models/lp/limited_partner.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/lp/fund_form.dart';
import '../screen_frame.dart';

class FundDetailAdminScreen extends StatefulWidget {

  final Fund fund;

  const FundDetailAdminScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundDetailAdminScreenState();

}

class FundDetailAdminScreenState extends State<FundDetailAdminScreen> {

  late bool isFunding = widget.fund.isFunding;

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.fund.name, style: WidgetUtils.titleStyle),
              Wrap(
                children: [
                  const Text("조합원 모집 상태"),
                  Switch(value: isFunding, onChanged: (value) async {
                    await changeIsFunding(widget.fund, value);
                    setState(() {
                      isFunding = value;
                    });
                  })
                ],
              ),
              const Text("기본 정보", style: WidgetUtils.h1),
              widget.fund.toBasicTable(),
              FilledButton(
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context) {
                    return FundForm(isMaking: false, fund: widget.fund);
                  });
                  setState(() {});
                },
                child: const Text("정보 수정하기")
              ),
              const Text("조합 참여자", style: WidgetUtils.h1),
              FutureBuilder(
                future: fetchLpInFund(widget.fund.id),
                builder: (BuildContext context, AsyncSnapshot<List<LimitedPartner>> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    int index = snapshot.data?.length ?? 0;
                    return WidgetUtils().wrapAsDualScrollWidget(
                        DataTable(
                            columns: const [
                              DataColumn(label: Text("번호")),
                              DataColumn(label: Text("아이디")),
                              DataColumn(label: Text("이름")),
                              DataColumn(label: Text("연락처")),
                              DataColumn(label: Text("참여 금액")),
                              DataColumn(label: Text("참여 좌수")),
                              DataColumn(label: Text("출자증서")),
                              DataColumn(label: Text("소득공제")),
                              DataColumn(label: Text("입금일자")),
                              DataColumn(label: Text("삭제"))
                            ],
                            rows: (snapshot.data ?? List.empty()).map<DataRow>((lp) => lp.toDataRow(index--)).toList()
                        )
                    );
                  }
                }
              )
            ],
          ),
        ),
        isAdmin: true
    );
  }

}