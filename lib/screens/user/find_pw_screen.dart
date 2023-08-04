import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/screens/user/reset_pw_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPwScreen extends StatefulWidget {
  const FindPwScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindPwScreenState();

}

class FindPwScreenState extends State<FindPwScreen> {

  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  var _buttonClicked = false;

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
                  const Text("비밀번호 찾기"),
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
                        const Row(
                          children: [
                            SizedBox(width: 50,),
                            Text("가입 당시 입력한 이름 / ID / 이메일을 입력하시면, 이메일을 통하여 인증 완료 후, 비밀번호를 재설정 하실 수 있습니다.")
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("이름"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _nameController,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("ID"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _idController,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("이메일"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _emailController,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            (_buttonClicked)
                                ? FilledButton(onPressed: () {}, child: const Text("재전송"))
                                : FilledButton(
                                    onPressed: () {
                                      setState(() {
                                        _buttonClicked = true;
                                      });
                                    },
                                    child: const Text("인증번호 전송")
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("인증번호"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _codeController,
                                enabled: _buttonClicked,
                              ),
                            ),
                          ]
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () {
                                Get.to(ResetPwScreen(username: _nameController.text));
                              },
                              child: const Text("확인")
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