import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/fund/fund.dart';

class FundingFundScreen extends StatefulWidget {
  const FundingFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => FundingFundScreenState();
}

class FundingFundScreenState extends State<FundingFundScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<Fund>> funds = searchFunds("FUNDING");

    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            children: [
              fundStatusFlow(),
              FutureBuilder<List<Fund>>(
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
                          DataColumn(label: Text("조합명")),
                          DataColumn(label: Text("투자종목")),
                          DataColumn(label: Text("주요제품")),
                          DataColumn(label: Text("결성금액")),
                          DataColumn(label: Text("참여 좌수")),
                          DataColumn(label: Text("남은 좌수")),
                          DataColumn(label: Text("참여 가능 인원")),
                          DataColumn(label: Text("자세히 보기")),
                        ],
                        rows: snapshot.data
                            ?.map<DataRow>((fund) => fund.toFundingFundDataRow())
                            .toList()
                            ?? List.empty()
                    );
                  }
                },
              ),
            ],
          )
        ),
        isAdmin: false
    );
  }
}

Widget fundStatusFlow() {
  return Wrap(children: const [
    Text("1. 조합검토기간"),
    Icon(Icons.arrow_right),
    Text("2. 참여신청"),
    Icon(Icons.arrow_right),
    Text("3. 서류접수 및 입금확인"),
    Icon(Icons.arrow_right),
    Text("4. 중소벤처기업부 등록승인"),
    Icon(Icons.arrow_right),
    Text("5. 주금납입"),
    Icon(Icons.arrow_right),
    Text("6. 완료 (출자증서 발급)"),
  ],);
}