import 'package:angelnet/screens/user/id_inform_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindIdScreenState();
}

class FindIdScreenState extends State<FindIdScreen> {
  final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

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
                              child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 50,),
                            const SizedBox(
                              width: 80,
                              child: Text("연락처"),
                            ),
                            SizedBox(
                              width: 240,
                              child: TextField(
                                controller: _phoneController,
                                decoration: const InputDecoration(),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FilledButton(
                            onPressed: () {
                              Get.to(IdInformScreen(name: _nameController.text, id: 'IDIDIDIDID'));
                            },
                            child: const Text("아이디 찾기"),
                          ),
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
