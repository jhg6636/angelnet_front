import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/user/sign_up_process_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWelcomeScreen extends StatelessWidget {

  String userName;

  SignUpWelcomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("회원가입", style: WidgetUtils.titleStyle,),
            signUpProcessWidget(3),
            SizedBox(
              width: 640,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("안녕하세요 $userName 회원님"),
                  const Text("엔젤넷 회원가입이 완료되었습니다."),
                  const Text("엔젤넷의 회원이 되신 걸 환영합니다.")
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                Get.to(const HomeScreen());
                Get.deleteAll();
              },
              child: const Text("로그인"),
            )
          ],
        ),
      ),
    );
  }

}