import 'package:angelnet/screens/common/signup_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
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
      appBar: WidgetUtils().appBar,
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32.0),
                const Text(
                  "약관 1", style: WidgetUtils.h1, textAlign: TextAlign.start,),
                FutureBuilder<String>(
                  future: text1,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Flexible(
                        child: Padding(
                            padding: WidgetUtils.smallPadding,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all()
                                ),
                                child: SingleChildScrollView(
                                  child: Text(snapshot.data.toString()),
                                )
                            )
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const Text(
                  "약관 2", style: WidgetUtils.h1, textAlign: TextAlign.start,),
                FutureBuilder<String>(
                  future: text2,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: Padding(
                              padding: WidgetUtils.smallPadding,
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all()
                                  ),
                                  child: SingleChildScrollView(
                                    child: Text(snapshot.data.toString()),
                                  )
                              )
                          )
                      );
                    } else {
                    return const CircularProgressIndicator();
                    }
                  },
                ),
                Padding(
                  padding: WidgetUtils.smallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                          value: _isChecked,
                          onChanged: (value) =>
                          {
                            setState(() {
                              _isChecked = value ?? false;
                            })
                          }),
                      const Text("위 약관에 동의합니다."),
                    ],
                  ),
                ),
                Padding(
                  padding: WidgetUtils.smallPadding,
                  child: ButtonBar(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("돌아가기")),
                      FilledButton(
                        onPressed: () {
                          if (_isChecked) {
                            Get.to(const SignUpScreen());
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: const Text("약관에 동의해 주세요."),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("확인"))
                                      ]);
                                });
                          }
                        },
                        child: const Text("회원가입"),
                      )
                    ],
                  )
                )
              ]
          )
      ),
    );
  }
}
