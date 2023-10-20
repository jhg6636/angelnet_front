import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/screens/user/reset_pw_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/utils/custom_border_clipper.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'find_id_screen.dart';

class FindPwScreen extends StatefulWidget {

  const FindPwScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindPwScreenState();

}

class FindPwScreenState extends State<FindPwScreen> {

  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  var _buttonClicked = false;
  String? code;

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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("아이디/비밀번호 찾기",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Pretendard",
                                  color: Color(0xff111111))),
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
                                          Get.to(const FindPwScreen());
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
                              child: const Text("가입 당시 입력한 이름 / ID / 이메일을 입력하시면, 이메일을 통하여 인증 완료 후, 비밀번호를 재설정 하실 수 있습니다.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.16,
                                  color: Color(0xff333333),
                                ),
                              )
                          ),
                          const Divider(thickness: 2, color: Color(0xff2b2b2b),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("이름",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
                                  child: SizedBox(
                                    width: 263,
                                    height: 38,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.top,
                                      keyboardType: TextInputType.text,
                                      controller: _nameController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                              borderSide: BorderSide(color: Color(0xffdddddd))
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffdddddd),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("ID",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(140, 0, 0, 0),
                                  child: SizedBox(
                                    width: 263,
                                    height: 38,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.top,
                                      keyboardType: TextInputType.text,
                                      controller: _idController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                              borderSide: BorderSide(color: Color(0xffdddddd))
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffdddddd),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("이메일",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 263,
                                        height: 38,
                                        child: TextField(
                                          textAlignVertical: TextAlignVertical.top,
                                          keyboardType: TextInputType.text,
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                  borderSide: BorderSide(color: Color(0xffdddddd))
                                              )
                                          ),
                                        ),
                                      ),
                                      if (_buttonClicked && code != null) Container(
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: WidgetUtils.okMessage("인증번호가 입력하신 메일로 발송되었습니다."),
                                      ) else if (code == null && _buttonClicked) Container(
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: WidgetUtils.errorMessage("입력하신 정보를 다시 한 번 확인해 주세요."),
                                      )
                                    ],
                                  )
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                  child: FilledButton(
                                    style: FilledButton.styleFrom(
                                        fixedSize: const Size(118, 38),
                                        backgroundColor: const Color(0xff6c6f81),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                                        )
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _buttonClicked = false;
                                      });
                                      var response = await findPwApi(_nameController.text, _emailController.text, _idController.text);
                                      if (response.statusCode == 200) {
                                        code = response.body;
                                      } else {
                                        code = null;
                                      }
                                      setState(() {
                                        _buttonClicked = true;
                                      });
                                    },
                                    child: const Text("인증번호 전송",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringUtils.pretendard,
                                          color: Colors.white,
                                          letterSpacing: -0.32
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffdddddd),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("인증번호",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(97, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 263,
                                        height: 38,
                                        child: TextField(
                                          textAlignVertical: TextAlignVertical.top,
                                          keyboardType: TextInputType.text,
                                          controller: _codeController,
                                          decoration: InputDecoration(
                                              enabled: _buttonClicked && code != null,
                                              border: const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                                  borderSide: BorderSide(color: Color(0xffdddddd))
                                              )
                                          ),
                                        ),
                                      ),
                                      if (code != null && code != _codeController.text && _codeController.text.isNotEmpty) Container(
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: WidgetUtils.errorMessage("인증번호가 일치하지 않습니다."),
                                      )
                                    ],
                                  )
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffdddddd),),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                                if (_codeController.text == code) {
                                  Get.to(ResetPwScreen(isLost: true, username: _nameController.text, stringId: _idController.text,));
                                } else {
                                  setState(() {});
                                }
                              },
                              child: const Text("확인",
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Color(0xffffffff),
                                      letterSpacing: -0.34
                                  )
                              )
                            ),
                          ],
                        )
                    )
                  ]
                )
            )
        ))
    );
  }

}