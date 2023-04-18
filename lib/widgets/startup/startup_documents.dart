import 'package:backoffice_front/widgets/startup/portfolio_details.dart';
import 'package:flutter/cupertino.dart';

class StartupDocuments extends StatelessWidget {
  final List<PortfolioDocument> documents;

  const StartupDocuments({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    List<Row> rows = List.empty(growable: true);
    rows.add(getFirstRow(documents.first.runtimeType) as Row);

    for (var document in documents) {
      rows.add(document.toWidget() as Row);
    }

    return Column(children: rows);
  }

  Widget getFirstRow(Type type) {
    switch (type) {
      case CorporationRegistration:
      case ShareholderList:
        return Row(children: const [
          Text("등록 일시"),
          Text("다운로드"),
          Text("업로드"),
        ]);
      case NewsLetter:
        return Row(
          children: const [
            Text("제목"),
            Text("등록 일시"),
            Text("자세히 보기"),
          ],
        );
      default:
        return Row();
    }
  }
}
