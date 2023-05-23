import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/core/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/lp/funding_fund_screen.dart';

class LeftSideDrawer extends StatelessWidget {
  const LeftSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: WidgetUtils.drawerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomDrawerHeader(),
          TextButton(
            onPressed: () {
              Get.to(const LpMyPage());
            },
            child: const Text(
              "마이페이지",
              style: WidgetUtils.drawerButtonStyle,
            ),
          ),
          TextButton(
              onPressed: () {
                Get.to(FundingFundScreen());
              },
              child: const Text(
                  "모집 중인 조합 보기",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          TextButton(
              onPressed: () {
                Get.to(const NotDevelopedScreen(isAdmin: false));
              },
              child: const Text(
                  "공지사항",
                style: WidgetUtils.drawerButtonStyle,
              ),
          ),
          TextButton(
              onPressed: () {
                Get.to(const NotDevelopedScreen(isAdmin: false));
              },
              child: const Text(
                  "포트폴리오 전체 보기",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          const SizedBox(height: 20.0,)
        ],
      )
    );
  }
}