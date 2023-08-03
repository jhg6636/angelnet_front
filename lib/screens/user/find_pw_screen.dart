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
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  var _buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("이름"),
                SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _nameController,
                    )
                ),
              ],
            ),
            Column(
              children: [
                const Text("이메일"),
                SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: _emailController,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _buttonClicked = true;
                      });
                    },
                    child: const Text("인증하기")
                )
              ],
            ),
            if (_buttonClicked) Column(
              children: [
                const Text("인증번호"),
                SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: _codeController,
                  ),
                ),
              ],
            ),
            if (_buttonClicked) FilledButton(
                onPressed: () {
                  Get.to(const ResetPwScreen());
                },
                child: const Text("인증하기")
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("취소하기")
            )
          ],
        )
    );
  }

}