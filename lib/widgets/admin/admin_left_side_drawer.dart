import 'package:backoffice_front/screens/admin/manage_user_screen.dart';
import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/core/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/admin/manage_fund_screen.dart';

class AdminLeftSideDrawer extends StatelessWidget {
  const AdminLeftSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomDrawerHeader(),
          TextButton(
              onPressed: () {
                Get.to(const ManageUserScreen());
              },
              child: const Text(
                  "회원 관리",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          TextButton(
              onPressed: () {
                Get.to(const ManageFundScreen());
              },
              child: const Text(
                  "조합 관리",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          TextButton(
              onPressed: () {
                Get.to(const NotDevelopedScreen(isAdmin: true));
              },
              child: const Text(
                "그룹 관리",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          TextButton(
              onPressed: () {
                Get.to(const NotDevelopedScreen(isAdmin: true));
              },
              child: const Text(
                  "공지사항 관리",
                style: WidgetUtils.drawerButtonStyle,
              )
          ),
          const SizedBox(height: 50.0)
        ],
      )
    );
  }

}