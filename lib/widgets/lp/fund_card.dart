import 'package:backoffice_front/screens/lp/fund_detail_lp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/lp/fund.dart';

class FundCard extends StatelessWidget {
  final Fund fund;

  const FundCard({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(FundDetailLpScreen(fund: fund));
          // Widget nextPage = FutureBuilder<Startup>(
          //   future: fetchStartup(fund.startupName),
          //   builder: (BuildContext context, AsyncSnapshot<Startup> snapshot) {
          //     if (snapshot.hasError) {
          //       print(snapshot.error);
          //       print(snapshot.stackTrace);
          //       return WidgetUtils.errorPadding;
          //     } else if (snapshot.hasData == false) {
          //       return const NotDevelopedScreen(isAdmin: false);
          //     } else {
          //       return StartupScreen(startup: snapshot.data!!);
          //     }
          //   }
          // );
          // Get.to(nextPage);
        },
        child: Flexible(
          child: Container(
              width: 400.0,
              height: 240.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.blueAccent),
                color: Colors.white54,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "No. ${fund.id}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.blueGrey),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "조합명",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                            Text(fund.name)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "투자기업",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                            Text(fund.startupName)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "결성일",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                            Text(
                                DateFormat('yyyy-MM-dd').format(fund.startAt))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "투자액",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                            Text(fund.cost.toString())
                          ]),
                    ]),
              )),
        ));
  }
}
