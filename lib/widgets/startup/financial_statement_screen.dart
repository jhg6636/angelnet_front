import 'package:backoffice_front/models/startup/financial_statement.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinancialStatementScreen extends StatefulWidget {

  final String title;
  final int startupId;

  const FinancialStatementScreen({
    super.key,
    required this.title,
    required this.startupId,
  });

  @override
  State<StatefulWidget> createState() => FinancialStatementScreenState();

}

class FinancialStatementScreenState extends State<FinancialStatementScreen> {

  @override
  Widget build(BuildContext context) {
    var financialStatements = fetchFinancialStatements(widget.startupId);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.title, style: WidgetUtils.h1),
        FutureBuilder(
          future: financialStatements,
          builder: (BuildContext context, AsyncSnapshot<List<FinancialStatement>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              print(snapshot.stackTrace);
              return WidgetUtils.errorPadding;
            } else if (snapshot.hasData == false) {
              return const CircularProgressIndicator();
            } else {
              return financialStatementTable(snapshot.data ?? List.empty());
            }
          }
        ),
      ],
    );
  }

}

DataTable financialStatementTable(List<FinancialStatement> financialStatements) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("year")),
        DataColumn(label: Text("sales")),
        DataColumn(label: Text("businessProfits"))
      ],
      rows: financialStatements.map<DataRow>((financialStatement) => financialStatement.toDataRow()).toList()
  );
}