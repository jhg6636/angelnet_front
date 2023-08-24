import 'package:angelnet/models/lp/limited_partner.dart';
import 'package:angelnet/screens/not_developed_screen.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/lp/fund_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/fund/fund.dart';
import '../../widgets/lp/lp_my_page_state.dart';
import '../screen_frame_v2.dart';
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
    var topBox = Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(4.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("username", style: WidgetUtils.h1,),
              Text("  님"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("서류제출")
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("회원정보")
              ),
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                    label: Text(33.toString()),
                    child: const Icon(Icons.notifications),
                  )
              )
            ],
          )
        ],
      )
    );

    return ScreenFrameV2(
        main: Scaffold(
            body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    padding: const EdgeInsets.symmetric(horizontal: 320),
                    child: Column(
                      children: [
                        const Text("마이페이지",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringUtils.pretendard,
                            color: Color(0xff111111)
                          )
                        )
                      ],
                    ),
                  ),
                )
            )
        ),
        isAdmin: false, crumbs: const ["마이페이지"],
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