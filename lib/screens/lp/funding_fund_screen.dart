import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/lp/fund.dart';

class FundingFundScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FundingFundScreenState();
}

class FundingFundScreenState extends State<FundingFundScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<Fund>> funds = searchFunds("FUNDING");

    return ScreenFrame(
        main: Scaffold(
          body: FutureBuilder<List<Fund>>(
            future: funds,
            builder:
                (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
              if (snapshot.hasError) {
                return WidgetUtils.errorPadding;
              } else if (snapshot.hasData == false) {
                return const CircularProgressIndicator();
              } else {
                return DataTable(
                    columns: const [
                      DataColumn(label: Text("No.")),
                      DataColumn(label: Text("조합명")),
                      DataColumn(label: Text("투자종목")),
                      DataColumn(label: Text("조합결성일")),
                      DataColumn(label: Text("투자액")),
                      DataColumn(label: Text("조합 참여하기")),
                    ],
                    rows: snapshot.data
                            ?.map<DataRow>((fund) => fund.toDataRowWithButton())
                            .toList()
                        ?? List.empty()
                );
              }
            },
          ),
        ),
        isAdmin: false
    );
  }
}
