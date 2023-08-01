import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/admin/manage_user_screen.dart';
import 'package:angelnet/screens/common/find_id_pw_select_screen.dart';
import 'package:angelnet/screens/common/not_developed_screen.dart';
import 'package:angelnet/screens/common/terms_of_use_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Text(
                      'AngelNet',
                      style: TextStyle(fontSize: 72.0, fontFamily: 'Sriracha'),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: _stringIdController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '아이디',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                    ),
                    textInputAction: TextInputAction.go,
                    onSubmitted: (_) async {
                      tryLogin();
                    },
                  ),
                ),

                const SizedBox(height: 12.0),
                SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '비밀번호',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0)
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (_) async {
                      tryLogin();
                    },
                  ),
                ),
                const SizedBox(height: 20.0,),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FilledButton(
                      onPressed: tryLogin,
                      child: const Text('로그인'),
                    ),
                    TextButton(
                      child: const Text('회원가입'),
                      onPressed: () {
                        // 회원가입
                        Get.to(const TermsOfUseScreen());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('ID/비밀번호 찾기'),
                      onPressed: () {
                        // Navigator.of(context).pushNamed(Routes.resetPassword);
                        Get.to(const FindIdPwSelectScreen());
                      },
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }

  void tryLogin() async {
    try {
      var response = await loginApi(
          _stringIdController.text, _passwordController.text
      );
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
            fontSize: 64.0
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }

}
