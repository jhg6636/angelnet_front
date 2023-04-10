import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/widgets/lp/fund_card.dart';
import 'package:backoffice_front/widgets/startup/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/fund.dart';

class LpMyPageState extends State<LpMyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Title(
                  color: Colors.blueAccent,
                  child: const Text("참여 중인 조합", style: TextStyle(fontSize: 20.0))
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: fundCardsFromFunds(widget.funds),
                  )
              )
            ],
          ),
        )

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