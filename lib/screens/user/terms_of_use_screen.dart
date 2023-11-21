import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/screens/user/signup_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:angelnet/widgets/user/sign_up_process_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({super.key});

  @override
  State<TermsOfUseScreen> createState() => TermsOfUseScreenState();
}

class TermsOfUseScreenState extends State<TermsOfUseScreen> {
  int id1 = 1;
  int id2 = 1;
  bool allChecked = false;

  @override
  Widget build(BuildContext context) {
    Future<String> text = getTermsOfUseText();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: InkWell(
          onTap: () { Get.to(const HomeScreen()); },
          child: Container(
            width: 154,
            height: 52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
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
                    padding: WidgetUtils.smallPadding,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffdddddd),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: FutureBuilder<String>(
                      future: text,
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return SingleChildScrollView(
                            child: Text(snapshot.data?.split("||")[0] ?? ""),
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
                          activeColor: const Color(0xff505050),
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
                          margin: const EdgeInsets.fromLTRB(6, 0, 22, 0),
                          child: const Text("동의",
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
                          activeColor: const Color(0xff505050),
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
                    padding: WidgetUtils.smallPadding,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffdddddd),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: FutureBuilder<String>(
                      future: text,
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          print("Data: ${snapshot.data!.length} bytes");
                          return SingleChildScrollView(
                            child: Text(snapshot.data?.split("||")[1] ?? ""),
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
                          activeColor: const Color(0xff505050),
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
                          margin: const EdgeInsets.fromLTRB(6, 0, 22, 0),
                          child: const Text("동의",
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
                          activeColor: const Color(0xff505050),
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
                    height: 94,
                    margin: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                    decoration: BoxDecoration(
                        color: const Color(0xfff8f8fa),
                        borderRadius: BorderRadius.circular(4.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff222222),
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
                        InkWell(
                          onTap: () {
                            setState(() {
                              allChecked = !allChecked;
                              if (allChecked == true) {
                                id1 = 2;
                                id2 = 2;
                              } else {
                                id1 = 1;
                                id2 = 1;
                              }
                            });
                          },
                          child: const Text("약관 및 개인정보 수집·이용에 전체 동의합니다.",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.18
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 50),
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
                              backgroundColor: const Color(0xff222222),
                              fixedSize: const Size(120, 50),
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
                                      return CustomAlertWidget().informationWidget(
                                          context,
                                          "이용약관/개인정보 취급방침 동의는 필수입니다.",
                                          "이용약관 동의 체크 후 다음 단계를 진행해 주세요."
                                      );
                                    }
                                );
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
            const SizedBox(
              height: 75,
            ),
            WidgetUtils.fnb
          ],
        )
      ),
    );
  }

  Future<String> getTermsOfUseText() async {
    return (await http.get(StringUtils().stringToUri('/terms-of-use'), headers: StringUtils.noAuthHeader))
        .body;
  }

}