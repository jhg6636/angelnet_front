import 'package:backoffice_front/models/startup/startup.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/screens/startup/startup_screen.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/lp/fund.dart';

import 'package:http/http.dart' as http;
class FundCard extends StatelessWidget {
  final Fund fund;

  const FundCard({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Widget nextPage = FutureBuilder<Startup>(
            future: fetchStartup(fund.startupName),
            builder: (BuildContext context, AsyncSnapshot<Startup> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                print(snapshot.stackTrace);
                return WidgetUtils.errorPadding;
              } else if (snapshot.hasData == false) {
                return const NotDevelopedScreen(isAdmin: false);
              } else {
                return StartupScreen(startup: snapshot.data!!);
              }
            }
          );
          Get.to(nextPage);
        },
        child: SizedBox(
            child: Column(
                children: [
                  Text("No. ${fund.id}"),
                  Row(children: [const Text("조합명"), Text(fund.name)]),
                  Row(children: [const Text("투자기업"), Text(fund.startupName)]),
                  Row(children: [
                    const Text("결성일"),
                    Text(DateFormat('yyyy-MM-dd').format(fund.createdAt))
                  ]),
                  Row(children: [const Text("투자액"), Text(fund.cost.toString())]),
                ]
            )
        )
    );
  }
}
