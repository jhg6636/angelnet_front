import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'models/fund.dart';

void main() {
  runApp(const BackofficeApp());
}

class BackofficeApp extends StatelessWidget {
  const BackofficeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RE:OFFICE',
      home: ScreenFrame(
        main: LpMyPage(funds: [
          Fund(
            id: 1,
            name: "1호 펀드",
            startupName: "스타트업1",
            createdAt: DateTime.now(),
            cost: 10000000,
          ),
          Fund(
            id: 2,
            name: "2호 펀드",
            startupName: "스타트업2",
            createdAt: DateTime.now(),
            cost: 20000000,
          ),
          Fund(
            id: 3,
            name: "3호 펀드",
            startupName: "스타트업1",
            createdAt: DateTime.now(),
            cost: 30000000,
          )]
        )
      ),
    );
  }
}
