import 'package:backoffice_front/models/lp/fund.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class AllPortfolioScreen extends StatelessWidget {
  const AllPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<Fund>>(
          future: fetchAllFunds(),
          builder: ((BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              print(snapshot.stackTrace);
              return WidgetUtils.errorPadding;
            } else if (snapshot.hasData == false) {
              return const CircularProgressIndicator();
            } else {
              var funds = snapshot.data?.where((fund) => fund.status == "READY").toList() ?? List.empty();
              return getDataTable(funds);
            }
          }),
        )
      ),
    );
  }

}

DataTable getDataTable(List<Fund> funds) {
  return DataTable(
    columns: const [
      DataColumn(label: Text("조합명")),
      DataColumn(label: Text("투자종목")),
      DataColumn(label: Text("업무집행조합원")),
      DataColumn(label: Text("조합결성일")),
      DataColumn(label: Text("투자형태")),
      DataColumn(label: Text("해산일")),
      DataColumn(label: Text("조합원 수익률")),
    ],
    rows: funds.map<DataRow>((fund) => fund.toAllPortfolioRow()).toList(),
  );
}