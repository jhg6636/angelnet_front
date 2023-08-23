import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 320),
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("회원가입",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pretendard",
                      color: Color(0xff111111)
                  )
                ),
                signUpProcessWidget(3),
                Container(
                  width: 1280,
                  height: 440,
                  padding: const EdgeInsets.fromLTRB(0, 54.32, 0, 55),
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffdddddd),),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 247.02,
                        height: 221.35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/assets/images/welcome_image.png'),
                            fit: BoxFit.contain
                          )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 44.32, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("안녕하세요 ",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.44,
                                color: Color(0xff111111)
                              ),
                            ),
                            Text(userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.44,
                                color: Color(0xff111111),
                              ),
                            ),
                            const Text("회원님",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.44,
                                color: Color(0xff111111)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("엔젤넷 회원가입이 ",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: StringUtils.pretendard,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.44,
                                  color: Color(0xff111111)
                              ),
                            ),
                            Text("완료",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.44,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Text("되었습니다. 회원이 되신걸 환영합니다.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.44,
                                  color: Color(0xff111111)
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff222222),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          fixedSize: const Size(120, 50)
                      ),
                      onPressed: () {
                        Get.to(const HomeScreen());
                      },
                      child: const Text("로그인",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          letterSpacing: -0.34,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  )
                )
              ],
            ),
          )
        )
    );
  }

}