import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/assets/routes.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/common/terms_of_use_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/common/signup_screen.dart';

class HomeScreenState extends State<HomeScreen> {
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: const <Widget>[
                SizedBox(height: 16.0),
                Text('RE:BACKOFFICE'),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _stringIdController,
              decoration: const InputDecoration(
                filled: true,
                labelText: '아이디',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FilledButton(
                  child: const Text('로그인'),
                  onPressed: () {
                    _stringIdController.clear();
                    _passwordController.clear();
                    // backend 로그인 로직
                  },
                ),
                TextButton(
                  child: const Text('회원가입'),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(Routes.signUp);
                    // 회원가입
                    Get.to(TermsOfUseScreen());
                  },
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('비밀번호 변경'),
                  onPressed: () {
                    // Navigator.of(context).pushNamed(Routes.resetPassword);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Future<http.Response> loginApi(String username, String password) async {
  //   final Map request = {"username": username, "password": password};
  //   var body = json.encode(request);
  //
  //   TODO()
  // }
}
