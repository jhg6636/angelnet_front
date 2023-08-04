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
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("아이디/비밀번호 찾기"),
              const SizedBox(height: 120.0,),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const FindIdScreen());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 480,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: const Text("아이디 찾기")
                    )
                  ),
                  const SizedBox(
                    width: 50
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const FindPwScreen());
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 480,
                        height: 240,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: const Text("비밀번호 찾기")
                    )
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }

}