import 'package:angelnet/screens/user/find_id_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/StringUtils.dart';
import '../../utils/custom_border_clipper.dart';
import 'home_screen.dart';

class ResetPwScreen extends StatefulWidget {

  final String username;

  const ResetPwScreen({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => ResetPwScreenState();

}

class ResetPwScreenState extends State<ResetPwScreen> {
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();

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
        body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 320),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("비밀번호 재설정",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pretendard",
                          color: Color(0xff111111)
                      )
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          children: [
                            Flexible(
                                child: InkWell(
                                    onTap: () {
                                      Get.to(const FindIdScreen());
                                    },
                                    child: Container(
                                        width: 640,
                                        height: 62,
                                        decoration: const BoxDecoration(
                                            color: Color(0xfff9f9f9),
                                            border: Border(
                                              bottom: BorderSide(color: Color(0xff1173f9), width: 2),)
                                        ),
                                        child: const Center(
                                          child: Text("아이디 찾기",
                                            style: TextStyle(
                                                fontFamily: StringUtils.pretendard,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff282728),
                                                letterSpacing: -0.17
                                            ),
                                          ),
                                        )
                                    )
                                )
                            ),
                            Flexible(
                                child: InkWell(
                                  onTap: () {
                                  },
                                  child: ClipPath(
                                    clipper: CustomBorderClipper(),
                                    child: Container(
                                        width: 640,
                                        height: 62,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                                top: BorderSide(color: Color(0xff1173f9), width: 2),
                                                left: BorderSide(color: Color(0xff1173f9), width: 2),
                                                right: BorderSide(color: Color(0xff1173f9), width: 2)
                                            )
                                        ),
                                        child: const Center(
                                          child: Text("비밀번호 찾기",
                                            style: TextStyle(
                                                fontFamily: StringUtils.pretendard,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff1173f9),
                                                letterSpacing: -0.17
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 38, 0, 10),
                      child: Text("${widget.username} 님, 재설정하실 비밀번호를 입력해주세요.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    const Divider(color: Color(0xff2b2b2b), thickness: 2,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: const Text("*",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w400,
                                color: Color(0xff4d87ef)
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: const Text("비밀번호",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333333),
                                  letterSpacing: -0.17
                              ),
                            )
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 263,
                                height: 38,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                          borderSide: BorderSide(color: Color(0xffdddddd))
                                      )
                                  ),
                                  obscureText: true,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: const Text(
                                  "4~20자의 영문 (대소문자 구분), 숫자, 특수문자(!@#\$%^&*()_+=?/) 조합",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff555555),
                                      letterSpacing: -0.15
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Divider(color: Color(0xffdddddd),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: const Text("*",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w400,
                                color: Color(0xff4d87ef)
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: const Text("비밀번호 재확인",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff333333),
                                  letterSpacing: -0.17
                              ),
                            )
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: SizedBox(
                            width: 263,
                            height: 38,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.text,
                              controller: _passwordCheckController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                      borderSide: BorderSide(color: Color(0xffdddddd))
                                  )
                              ),
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xffdddddd),),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: Color(0xff222222),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            fixedSize: Size(162, 50)
                        ),
                        onPressed: () {

                        },
                        child: const Text("비밀번호 재설정",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              fontSize: 17,
                              letterSpacing: -0.34
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
        )
    );
  }

}