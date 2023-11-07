import 'package:angelnet/screens/user/find_pw_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdInformScreen extends StatelessWidget {

  final String name;
  final String id;

  const IdInformScreen({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("아이디 찾기"),
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
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("이름"),
                            ),
                            SizedBox(
                              width: 240,
                              child: Text(name),
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
                              child: Text(id),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton(
                              onPressed: () {
                                Get.to(const HomeScreen());
                              },
                              child: const Text("로그인"),
                            ),
                            SizedBox(width: 50,),
                            FilledButton(
                              onPressed: () {
                                Get.to(const FindPwScreen());
                              },
                              child: const Text("비밀번호 찾기"),
                            ),
                          ]
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