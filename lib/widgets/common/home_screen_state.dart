import 'dart:io';

import 'package:backoffice_front/main.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/common/terms_of_use_screen.dart';
import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/lp/fund.dart';

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
                  onPressed: () async {
                    try {
                      loginApi(
                          _stringIdController.text, _passwordController.text);
                      String role = await checkRoleApi().obs.value;
                      switch (role) {
                        case "LP":
                          Get.to(const LpMyPage());
                          break;
                        case "ADMIN":
                          Get.to(const LpMyPage());
                          break;
                        case "STARTUP":
                          Get.to(const LpMyPage());
                          break;
                      }
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
    final Map<String, dynamic> request = {
      "stringId": stringId,
      "password": password
    };
    var headers = {HttpHeaders.contentTypeHeader: "application/json"};

    var uri = StringUtils().stringToUri('login', params: request);
    var response = await http.get(uri, headers: headers);

    var deviceId = await StringUtils().getDeviceId();

    secureStorage.write(key: deviceId, value: response.body);
    return response;
  }

  Future<String> checkRoleApi() async {
    var deviceId = await StringUtils().getDeviceId();
    var token = await secureStorage.read(key: deviceId) ?? "";

    var response = await http.get(StringUtils().stringToUri("/role"),
        headers: StringUtils().header(token));

    return response.body;
  }

}