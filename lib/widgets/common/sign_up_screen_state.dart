import 'dart:io';

import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../screens/common/signup_screen.dart';
import 'package:http/http.dart' as http;

import '../../utils/StringUtils.dart';

class SignUpScreenState extends State<SignUpScreen> {
  // TODO: 주소, 근무처, 명함첨부

  final _nameController = TextEditingController();
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _recommenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80.0),
              const Center(
                child: Text('RE:OFFICE'),
              ),
              const SizedBox(height: 120.0),
              TextField(
                keyboardType: TextInputType.text,
                controller: _stringIdController,
                decoration: const InputDecoration(
                  labelText: '아이디',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z0-9]"))
                ],
              ),
              const Text(
                "4~20자의 영문 소문자, 숫자로만 구성할 수 있습니다.",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                ),
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                ],
              ),
              const Text(
                "4~20자의 영문 소문자, 숫자, 특수문자(!@#\$%^&*()_+=?/)로만 구성할 수 있습니다",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordCheckController,
                decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                ),
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                ],
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: '이름',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[ㄱ-ㅎ가-힇ㆍᆢ]"))
                ],
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(labelText: '전화번호'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              const Text(
                "대쉬(-) 없이 숫자만 입력하세요.",
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: '이메일'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-z0-9@.-_=+!@#\$%^&*()/,?]"))
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _recommenderController,
                decoration: const InputDecoration(labelText: '추천인'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[ㄱ-ㅎ가-힇ㆍᆢ]"))
                ],
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('돌아가기'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  FilledButton(
                    child: const Text('회원가입'),
                    onPressed: () {
                      String? validityString = checkValidity();
                      if (validityString == null) {
                        signInApi();
                        Get.to(const HomeScreen());
                        Get.deleteAll();
                      } else {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text(validityString),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              }, child: const Text("OK"))
                            ],
                          );
                        });
                      }
                    },
                  ),
                ],
              ),

            ],
          )
        ),
      ),
    );
  }

  String? checkValidity() {
    if (!isValidStringId()) {
      return "ID를 확인해 주세요";
    }
    if (!isValidPassword()) {
      return "PW를 확인해 주세요";
    }
    if (!checkSamePassword()) {
      return "비밀번호가 다릅니다.";
    }
    if (!isValidName()) {
      return "이름을 확인해 주세요";
    }
    if (!isValidPhone()) {
      return "전화번호를 확인해 주세요";
    }
    if (!isValidEmail()) {
      return "이메일을 확인해 주세요";
    }
    if (!isValidRecommender()) {
      return "추천인을 확인해 주세요";
    }

    return null;
  }

  bool isValidStringId() {
    String stringId = _stringIdController.text;
    if (RegExp("^[a-z0-9]{4,20}\$").hasMatch(stringId)) {
      return true;
    }
    return false;
  }

  bool isValidPassword() {
    String password = _passwordController.text;
    if (RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[./,!@#\$%^&()+=-])[a-zA-Z0-9./,!@#\$%^&*()+=-]{4,20}\$").hasMatch(password)) {
      return true;
    }
    return false;
  }

  bool checkSamePassword() {
    String password = _passwordController.text;
    String checkPassword = _passwordCheckController.text;

    if (password == checkPassword) {
      return true;
    }

    return false;
  }

  bool isValidName() {
    String name = _nameController.text;
    if (RegExp("^[가-힇]{2,}\$").hasMatch(name)) {
      return true;
    }
    return false;
  }

  bool isValidPhone() {
    String phone = _phoneController.text;
    if (RegExp("^[0-9]{10,11}\$").hasMatch(phone)) {
      return true;
    }
    return false;
  }

  bool isValidEmail() {
    String email = _emailController.text;
    if (RegExp("^[a-zA-Z0-9./,!#\$%^&*()+=-]{1,}@[a-zA-Z0-9./,!#\$%^&*()+=-]{1,}.[a-zA-Z0-9./,!@#\$%^&*()+=-]{1,}\$").hasMatch(email)) {
      return true;
    }
    return false;
  }

  bool isValidRecommender() {
    String recommender = _recommenderController.text;
    if (recommender == "") {
      return true;
    }
    if (RegExp("^[가-힇]{2,}\$").hasMatch(recommender)) {
      return true;
    }

    return false;
  }

  Future<http.Response> signInApi() async {
    final Map<String, dynamic> request = {
      "stringId": _stringIdController.text,
      "password": _passwordController.text,
      "name": _nameController.text,
      "phone": _phoneController.text,
      "email": _emailController.text,
      "recommender": _recommenderController.text,
    };
    var headers = {HttpHeaders.contentTypeHeader: "application/json"};

    var uri = StringUtils().stringToUri('sign-in');
    var response = await http.post(uri, headers: headers, body: request);
    return response;
  }

}
