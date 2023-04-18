import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftSideDrawer extends StatelessWidget {
  const LeftSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(child: Text('Drawer Header')),
        TextButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          child: Text("마이페이지"),
        ),
        TextButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Text("모집 중인 조합 보기")),
        TextButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Text("공지사항")),
        TextButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            child: Text("포트폴리오 전체 보기")),
      ],
    ));
  }
}
