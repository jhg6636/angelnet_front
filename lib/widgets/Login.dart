import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenState extends State<HomeScreen> {
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                    // 회원가입 화면
                  },
                ),
              ],
            ),
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
