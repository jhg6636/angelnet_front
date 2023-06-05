import 'package:backoffice_front/models/lp/fund.dart';
import 'package:backoffice_front/models/lp/limited_partner.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class FundDetailAdminScreen extends StatefulWidget {

  final Fund fund;

  const FundDetailAdminScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundDetailAdminScreenState();

}

class FundDetailAdminScreenState extends State<FundDetailAdminScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("기본 정보"),
              widget.fund.toBasicTable(),
              const Text("조합 참여자"),
              FutureBuilder(
                future: fetchLps(widget.fund.id), 
                builder: (BuildContext context, AsyncSnapshot<List<LimitedPartner>> snapshot) {
                  if (snapshot.hasError) {
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    int index = snapshot.data?.length ?? 0;
                    return DataTable(
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