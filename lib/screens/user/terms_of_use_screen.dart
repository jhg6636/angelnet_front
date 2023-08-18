import 'dart:html';

import 'package:angelnet/screens/user/signup_screen.dart';
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
  int id1 = 1;
  int id2 = 1;
  bool allChecked = false;
  Future<String> text1 = StringUtils().loadText("lib/assets/texts/terms_of_use_1.txt");
  Future<String> text2 = StringUtils().loadText("lib/assets/texts/terms_of_use_2.txt");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Container(
          width: 154,
          height: 52,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(320, 50, 320, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("회원가입",
                    style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1,
                        color: Color(0xff111111)
                    ),
                  ),
                  signUpProcessWidget(1),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: const Text("이용약관",
                      style: TextStyle(
                          fontSize: 26,
                          letterSpacing: -0.26,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    height: 314,
                    margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffdddddd),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: FutureBuilder<String>(
                      future: text1,
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Flexible(
                            child: Padding(
                                padding: WidgetUtils.smallPadding,
                                child: SingleChildScrollView(
                                  child: Text(snapshot.data ?? ""),
                                )
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Radio(
                          activeColor: Color(0xff505050),
                          splashRadius: 1,
                          value: 2,
                          groupValue: id1,
                          onChanged: (value) {
                            setState(() {
                              id1 = 2;
                              if (id2 == 2) {
                                allChecked = true;
                              }
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(6, 0, 22, 0),
                          child: Text("동의",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                letterSpacing: -0.17
                            ),
                          ),
                        ),
                        Radio(
                          activeColor: Color(0xff505050),
                          splashRadius: 1,
                          value: 1,
                          groupValue: id1,
                          onChanged: (value) {
                            setState(() {
                              id1 = 1;
                              allChecked = false;
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: const Text("동의하지 않음",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                letterSpacing: -0.17
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: const Text("개인정보 수집·이용안내",
                      style: TextStyle(
                          fontSize: 26,
                          letterSpacing: -0.26,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Container(
                    height: 314,
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffdddddd),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: FutureBuilder<String>(
                      future: text2,
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Flexible(
                            child: Padding(
                                padding: WidgetUtils.smallPadding,
                                child: SingleChildScrollView(
                                  child: Text(snapshot.data ?? ""),
                                )
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Radio(
                          activeColor: Color(0xff505050),
                          splashRadius: 1,
                          value: 2,
                          groupValue: id2,
                          onChanged: (value) {
                            setState(() {
                              id2 = 2;
                              if (id1 == 2) {
                                allChecked = true;
                              }
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(6, 0, 22, 0),
                          child: Text("동의",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                letterSpacing: -0.17
                            ),
                          ),
                        ),
                        Radio(
                          activeColor: Color(0xff505050),
                          splashRadius: 1,
                          value: 1,
                          groupValue: id2,
                          onChanged: (value) {
                            setState(() {
                              id2 = 1;
                              allChecked = false;
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: Text("동의하지 않음",
                            style: TextStyle(
                                color: Color(0xff555555),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Pretendard",
                                fontSize: 17,
                                letterSpacing: -0.17
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 94,
                    margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                    decoration: BoxDecoration(
                        color: Color(0xfff8f8fa),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: Color(0xff222222),
                            value: allChecked,
                            onChanged: (val) {
                              setState(() {
                                allChecked = val ?? false;
                                if (allChecked == true) {
                                  id1 = 2;
                                  id2 = 2;
                                } else {
                                  id1 = 1;
                                  id2 = 1;
                                }
                              });
                            }
                        ),
                        const Text("약관 및 개인정보 수집·이용에 전체 동의합니다.",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.18
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(120, 50),
                              side: const BorderSide(color: Color(0xff222222), width: 2.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("취소",
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Color(0xff222222),
                                    letterSpacing: -0.34
                                )
                            )
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xff222222),
                              fixedSize: Size(120, 50),
                              side: const BorderSide(color: Color(0xff222222), width: 2.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                            onPressed: () {
                              if (allChecked) {
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
                            child: const Text("다음단계",
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Color(0xffffffff),
                                    letterSpacing: -0.34
                                )
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 75,
            ),
            WidgetUtils.fnb
          ],
        )
      ),
    );
  }

}