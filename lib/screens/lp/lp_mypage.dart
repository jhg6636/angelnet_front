import 'package:angelnet/models/lp/limited_partner.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/lp/fund_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/fund/fund.dart';
import '../../widgets/lp/lp_my_page_state.dart';
import 'funding_fund_screen.dart';

class LpMyPage extends StatefulWidget {

  const LpMyPage({super.key});

  @override
  State<StatefulWidget> createState() => LpMyPageState();
}

class LpMyPageState extends State<LpMyPage> {
  Future<List<Fund>> funds = fetchMyFunds();

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: Scaffold(
            body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            Get.to(const FundingFundScreen());
                          },
                          child: const Text("모집 중인 조합 보러가기")
                      ),
                      const Text(
                        "참여 중인 조합",
                        style: WidgetUtils.titleStyle,
                      ),
                      const SizedBox(height: 5.0,),
                      const Text(
                        "* 각 조합 클릭 시 해당 조합의 상세 페이지로 이동합니다.",
                        style: TextStyle(fontSize: 14.0, color: Colors.black38),
                      ),
                      const SizedBox(height: 10.0,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: FutureBuilder<List<Fund>>(
                            future: funds,
                            builder:
                                (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                print(snapshot.stackTrace);
                                return WidgetUtils.errorPadding;
                              } else if (snapshot.hasData == false) {
                                return const CircularProgressIndicator();
                              } else {
                                if (snapshot.data?.isEmpty ?? true) {
                                  return const Text("참여 중인 조합이 없습니다.");
                                }
                                return Wrap(
                                  children: (snapshot.data ?? List.empty()).map<FundCard>((fund) => FundCard(fund: fund,)).toList(),
                                );
                              }
                            }),
                        // todo 알림 관련 보이는 파트
                      )
                    ],
                  ),
                )
            )
        ),
        isAdmin: false
    );
  }

  List<FundCard> fundCardsFromFunds(List<Fund> funds) {
    List<FundCard> result = List.empty(growable: true);
    for (var fund in funds) {
      result.add(FundCard(fund: fund));
    }

    return result;
  }
}

DataRow toMyPageRow(int index, Fund fund, LimitedPartner lp) {
  return DataRow(cells: [
    DataCell(Text(index.toString())),
    DataCell(Text(fund.name)),
    DataCell(Text(fund.startupName)),
    DataCell(Text(fund.cost.toString())),
    DataCell(Text(fund.startAt.toString())),
    DataCell(Text(fund.dissolvedAt.toString() ?? "")),
    DataCell(Text(fund.margin.toString() ?? "")),
    DataCell(Text(""))
  ]);
}