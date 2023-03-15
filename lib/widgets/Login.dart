import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
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
                Text('BACKOFFICE'),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FilledButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                TextButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> loginApi(String username, String password) async {
    final Map request = {"username": username, "password": password};
    var body = json.encode(request);

    return await http.Client.post(
        "localhost:8080", headers: {'Content-type': 'application/json'},
        body: body,
        encoding: Encoding.getByName("UTF-8"))
  }
}
