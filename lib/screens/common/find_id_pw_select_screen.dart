import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'find_id_screen.dart';
import 'find_pw_screen.dart';

class FindIdPwSelectScreen extends StatefulWidget {

  const FindIdPwSelectScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindIdPwSelectScreenState();

}

class FindIdPwSelectScreenState extends State<FindIdPwSelectScreen> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text("ID 찾기"),
            FilledButton(onPressed: () {
              Get.to(const FindIdScreen());
            }, child: const Text("이동"))
          ],
        ),
        Column(
          children: [
            const Text("PW 찾기"),
            FilledButton(onPressed: () {
              Get.to(const FindPwScreen());
            }, child: const Text("이동"))
          ]
        )
      ],
    );
  }

}