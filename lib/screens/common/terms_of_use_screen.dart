import 'package:angelnet/screens/common/signup_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/user/sign_up_process_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => TermsOfUseScreenState();
}

class TermsOfUseScreenState extends State<TermsOfUseScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  Future<String> text1 = StringUtils().loadText("lib/assets/texts/terms_of_use_1.txt");
  Future<String> text2 = StringUtils().loadText("lib/assets/texts/terms_of_use_2.txt");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().appBar,
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signUpProcessWidget(1),
                const Text(
                  "회원가입", style: WidgetUtils.titleStyle, textAlign: TextAlign.start,
                ),
                const SizedBox(height: 32.0),
                const Text(
                  "이용약관", style: WidgetUtils.h1, textAlign: TextAlign.start,
                ),
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
                Padding(
                  padding: WidgetUtils.smallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                          value: _isChecked1,
                          onChanged: (value) =>
                          {
                            setState(() {
                              _isChecked1 = value ?? false;
                            })
                          }),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isChecked1 = !_isChecked1;
                          });
                        },
                        child: const Text("위 이용약관에 동의합니다."),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "개인정보 취급 방침", style: WidgetUtils.h1, textAlign: TextAlign.start,
                ),
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
                          value: _isChecked2,
                          onChanged: (value) =>
                          {
                            setState(() {
                              _isChecked2 = value ?? false;
                            })
                          }),
                      InkWell(
                        onTap: () {
                          {
                            setState(() {
                              _isChecked2 = !_isChecked2;
                            });
                          }
                        },
                        child: const Text("위의 개인정보 취급 방침에 동의합니다."),
                      ),
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
                          child: const Text("돌아가기")
                      ),
                      FilledButton(
                        onPressed: () {
                          if (_isChecked1 && _isChecked2) {
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