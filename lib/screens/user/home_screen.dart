import 'dart:ui';

import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/admin/manage_user_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/user/terms_of_use_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'find_id_pw_select_screen.dart';
import '../not_developed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();
  var idSaveChecked = false;

  @override
  Widget build(BuildContext context) {
    var loginBlock =
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 48,
                height: 20,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: const Text(
                  "아이디",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),
            Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: TextField(
                controller: _stringIdController,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    )
                ),
                textInputAction: TextInputAction.go,
                onSubmitted: (_) async {
                  tryLogin();
                },
              ),
            ),
            Container(
                width: 60,
                height: 20,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                child: const Text(
                  "패스워드",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ),
            Container(
              width: 400,
              height: 60,
              child: TextField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    constraints: BoxConstraints.tightForFinite()
                ),
                obscureText: true,
                textInputAction: TextInputAction.go,
                onSubmitted: (_) async {
                  tryLogin();
                },
              ),
            )
          ],
        ),
      ],
    );

    var idSaveCheckbox = Row(
        children: [
          Checkbox(
            side: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 0.19)
            ),
            activeColor: const Color.fromRGBO(255, 255, 255, 0.19),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            value: idSaveChecked,
            onChanged: (bool? value) {
              idSaveChecked = value ?? false;
              setState(() {});
            },
          ),
          Container(
              width: 90,
              height: 19,
              margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: InkWell(
                onTap: () {
                  idSaveChecked = !idSaveChecked;
                  setState(() {});
                },
                child: const Text(
                  "아이디 저장",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
          ),
        ]
    );

    var buttonBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          height: 60,
          child: ElevatedButton(
              onPressed: () async {
                var response = tryLogin();
                Get.to(LpMyPage());
                // todo 로그인 시도 -> 성공 실패 시 각각 Action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00A8E3),
                foregroundColor: const Color(0xff00A8E3),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)))
              ),
              child: const Text("Login", style: TextStyle(color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Pretendard"),
              )
          )
        ),
        // Container(
        //   margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        //   child: WidgetUtils.errorMessage("테스트용"),
        // ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 46, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 5.0, color: Color(0xffdddddd),),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: const Text(
                      "이 사이트에 방문이 처음이세요?",
                      style: TextStyle(
                        color: Color(0xffdddddd),
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const TermsOfUseScreen());
                      },
                      child: const Text("회원가입",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 16.0,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 5.0, color: Color(0xffdddddd),),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: const Text("비밀번호를 잊으셨나요?",
                      style: TextStyle(
                        color: Color(0xffdddddd),
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      )
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            Get.to(const TermsOfUseScreen());
                          },
                          child: const Text("아이디 / 패스워드 찾기",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 16.0,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      )
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/home_screen_image.png'),
                  fit: BoxFit.fill
                )
              )
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                child: Container(
                  width: 530,
                  height: 681,
                  decoration: const BoxDecoration(
                      color: Color(0x2fffffff),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  padding: const EdgeInsets.fromLTRB(65.0, 41.0, 65.0, 41.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 239,
                          height: 81,
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 37),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/white_logo.png'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(
                            width: 640,
                            child: loginBlock
                        ),
                        SizedBox(
                            width: 640,
                            child: idSaveCheckbox
                        ),
                        Container(
                            width: 640,
                            margin: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                            child: buttonBlock
                        ),
                      ]
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void tryLogin() async {
    try {
      var response =
      await loginApi(_stringIdController.text, _passwordController.text);
      if (response.statusCode == 200) {
        String role = await checkRoleApi().obs.value;
        switch (role) {
          case "LP":
            Get.to(const LpMyPage());
            break;
          case "ADMIN":
            Get.to(const ManageUserScreen());
            break;
          case "STARTUP":
            Get.to(const NotDevelopedScreen(isAdmin: false));
            break;
        }
      } else {
        Fluttertoast.showToast(
            msg: "ID/PW를 확인해주세요",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 64.0);
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
