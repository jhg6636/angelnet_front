import 'package:backoffice_front/screens/admin/make_fund_popup.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

import '../../models/lp/fund.dart';
import '../screen_frame.dart';

class ManageFundScreen extends StatefulWidget {
  const ManageFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageFundScreenState();

}

class ManageFundScreenState extends State<ManageFundScreen> {
  Future<List<Fund>> funds = fetchAllFunds();

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: Column(
        children: [
          FutureBuilder<List<Fund>>(
            future: funds,
            builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                print(snapshot.stackTrace);
                return WidgetUtils.errorPadding;
              } else if (snapshot.hasData == false) {
                return const CircularProgressIndicator();
              } else {
                return adminFundTable(snapshot.data ?? List.empty());
              }
            },
          ),
          ButtonBar(
            children: [
              OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MakeFundPopup().build(context);
                      }
                  );
                },
                child: const Text("조합 생성"),
              )
            ],
          )
        ],
      ),
      isAdmin: true,
    );
  }
}

DataTable adminFundTable(List<Fund> funds) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("번호")),
        DataColumn(label: Text("조합명")),
        DataColumn(label: Text("투자종목")),
        DataColumn(label: Text("조합결성일")),
        DataColumn(label: Text("금액"))
      ],
      rows: funds.map<DataRow>((fund) => fund.toDataRow()).toList()
  );
}