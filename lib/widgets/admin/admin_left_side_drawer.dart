import 'package:backoffice_front/screens/admin/manage_user_screen.dart';
import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/admin/manage_fund_screen.dart';

class AdminLeftSideDrawer extends StatelessWidget {
  const AdminLeftSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Drawer Header')),
          TextButton(
              onPressed: () {
                Get.to(const ManageUserScreen());
              },
              child: const Text("회원 관리")
          ),
          TextButton(
              onPressed: () {
                Get.to(const ManageFundScreen());
              },
              child: const Text("조합 관리")
          ),
          TextButton(
              onPressed: () {
                Get.to(const NotDevelopedScreen(isAdmin: true));
              },
              child: const Text("공지사항 관리")
          )
        ],
      )
    );
  }

}