import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/admin/manage_user_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/user/terms_of_use_screen.dart';
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
    var loginBlock = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 60, child: Text("아이디")),
                const SizedBox(width: 12),
                SizedBox(width: 400, child: TextField(
                  controller: _stringIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.go,
                  onSubmitted: (_) async {
                    tryLogin();
                  },
                ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 60, child: Text("비밀번호")),
                const SizedBox(width: 12),
                SizedBox(width: 400, child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    constraints: BoxConstraints.tightForFinite()
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (_) async {
                    tryLogin();
                  },
                ),)
              ],
            )
          ],
        ),
        FilledButton(
          onPressed: tryLogin,
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(LinearBorder())),
          child: const Text("로그인"),
        ),
      ],
    );

    var idSaveCheckbox = Row(
      children: [
        const SizedBox(
          width: 80,
        ),
        SizedBox(
          width: 24,
          child: Checkbox(
            value: idSaveChecked,
            onChanged: (bool? value) {
              idSaveChecked = value ?? false;
              setState(() {});
            },
          )
        ),
        SizedBox(
            width: 120,
            child: InkWell(
              onTap: () {
                idSaveChecked = !idSaveChecked;
                setState(() {});
              },
              child: const Text("  아이디 저장"),
            )
        ),
      ]
    );

    var buttonBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("이 사이트에 방문이 처음이세요?"),
            FilledButton(
                onPressed: () {
                  Get.to(const TermsOfUseScreen());
                },
                child: const Text("신규회원 가입하기"))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("아이디나 비밀번호를 잊어버리셨나요?"),
            OutlinedButton(
                onPressed: () {
                  Get.to(const FindIdPwSelectScreen());
                },
                child: const Text("아이디 / 패스워드 찾기"))
          ],
        ),
      ],
    );

    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50.0),
                  SizedBox(width: 640, child: loginBlock),
                  const SizedBox(height: 12.0),
                  SizedBox(width: 640, child: idSaveCheckbox),
                  const SizedBox(height: 12.0),
                  SizedBox(width: 640, child: buttonBlock),
                ]
            ),
          ),
        ),
      )
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
