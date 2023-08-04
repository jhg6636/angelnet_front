import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class ResetPwScreen extends StatefulWidget {

  final String username;

  const ResetPwScreen({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => ResetPwScreenState();

}

class ResetPwScreenState extends State<ResetPwScreen> {
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("비밀번호 재설정"),
                  const SizedBox(height: 120.0,),
                  Container(
                    width: 900,
                    height: 450,
                    decoration: BoxDecoration(
                        border: Border.all()
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${widget.username} 님, 재설정하실 비밀번호를 입력해주세요."),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 120,
                              child: Text("* 비밀번호"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _passwordController,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 120,
                              child: Text("* 비밀번호 재확인"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _passwordCheckController,
                              ),
                            )
                          ],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                                onPressed: () {
                                  Get.to(const HomeScreen());
                                },
                                child: const Text("비밀번호 재설정")
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Get.to(const HomeScreen());
                                },
                                child: const Text("취소")
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

}