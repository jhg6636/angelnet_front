import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/common/terms_of_use_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:backoffice_front/utils/StringUtils.dart';

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
                Text('RE:OFFICE'),
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
                    try {
                      loginApi(_stringIdController.text, _passwordController.text);
                    } catch (e) {
                      print("Error: e");
                    }
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

  Future<http.Response> loginApi(String stringId, String password) async {
    final Map<String, dynamic> request = {"stringId": stringId, "password": password};
    var headers = {HttpHeaders.contentTypeHeader: "application/json"};

    try {
      var uri = StringUtils().stringToUri('login', request);
      print(uri);
      var response = await http.get(uri, headers: headers);
      print(response.body);
      return response;
    } catch (e) {
      print('Error: $e');
    }
    return Future(() => http.Response('', 404));
  }
}
