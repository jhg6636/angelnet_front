import 'package:backoffice_front/screens/common/signup_screen.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => TermsOfUseScreenState();
}

class TermsOfUseScreenState extends State<TermsOfUseScreen> {
  bool _isChecked = false;
  Future<String> text1 =
      StringUtils().loadText("lib/assets/texts/terms_of_use_1.txt");
  Future<String> text2 =
      StringUtils().loadText("lib/assets/texts/terms_of_use_2.txt");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("약관 1"),
            FutureBuilder<String>(
              future: text1,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SingleChildScrollView(
                        child: SizedBox(
                      child: Text(snapshot.data.toString()),
                    )),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const Text("약관 2"),
            FutureBuilder<String>(
              future: text2,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: SingleChildScrollView(
                        child: SizedBox(
                      child: Text(snapshot.data.toString()),
                    )),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) => {
                    setState(() {
                      _isChecked = value ?? false;
                    })
                  }
                ),
                const Text("위 약관에 동의합니다."),
              ],
            ),
            ButtonBar(
              children: [
                TextButton(
                    onPressed: () => {Get.back()}, child: const Text("돌아가기")),
                FilledButton(
                    onPressed: () => {Get.to(const SignUpScreen())},
                    child: const Text("회원가입"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
