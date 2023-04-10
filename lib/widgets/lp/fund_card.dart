import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/fund.dart';

class FundCard extends StatelessWidget {

  final Fund fund;

  const FundCard({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(const HomeScreen());
        },
        child: SizedBox(
            child: Column(
                children: [
                  Text("No. ${fund.id}"),
                  Row(
                      children: [
                        const Text("조합명"),
                        Text(fund.name)
                      ]
                  ),
                  Row(
                      children: [
                        const Text("투자기업"),
                        Text(fund.startupName)
                      ]
                  ),
                  Row(
                      children: [
                        const Text("결성일"),
                        Text(DateFormat('yyyy-MM-dd').format(fund.createdAt))
                      ]
                  ),
                  Row(
                      children: [
                        const Text("투자액"),
                        Text(fund.cost.toString())
                      ]
                  ),
                ]
            ))

    );
  }

}