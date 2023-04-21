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
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Title(
                      color: Colors.blueAccent,
                      child: const Text("참여 중인 조합", style: TextStyle(fontSize: 20.0))),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder<List<Fund>>(
                        future: funds,
                        builder:
                            (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                          print("snapshot.hasData: ${snapshot.hasData}");
                          print("snapshot.hasError:${snapshot.hasError}");
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                            print(snapshot.stackTrace);
                            return WidgetUtils.errorPadding;
                          } else if (snapshot.hasData == false) {
                            snapshot.error.printError();
                            return const CircularProgressIndicator();
                          } else {
                            print(snapshot.data.toString());
                            var children = <FundCard>[];
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
            )),
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
