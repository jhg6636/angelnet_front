import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/lp/fund_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/lp/fund.dart';

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
                    const Text(
                      "참여 중인 조합",
                      style: WidgetUtils.titleStyle,
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "*각 조합 클릭 시 해당 조합의 상세 페이지로 이동합니다.",
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
                              var children = <FundCard>[];
                              if (snapshot.data?.isEmpty ?? true) {
                                return const Text("참여 중인 조합이 없습니다.");
                              }
                              for (var fund in snapshot.data ?? List.empty()) {
                                children.add(FundCard(fund: fund));
                              }
                              return Row(
                                children: children,
                              );
                            }
                          }),
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
