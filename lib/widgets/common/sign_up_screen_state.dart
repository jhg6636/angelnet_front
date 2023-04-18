import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/common/signup_screen.dart';

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
                controller: _stringIdController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: '아이디',
                ),
              ),
              const Text(
                "4~20자의 영문 소문자, 숫자로만 구성할 수 있습니다.",
                textAlign: TextAlign.left,
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
              const Text(
                "4~20자의 영문 소문자, 숫자, 특수문자로만 구성할 수 있습니다",
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordCheckController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: '비밀번호 확인',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: '이름',
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(filled: true, labelText: '전화번호'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(filled: true, labelText: '이메일'),
              ),
              const SizedBox(
                height: 12.0,
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
                      Get.to(const HomeScreen());
                      Get.deleteAll();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _recommenderController,
                decoration: const InputDecoration(labelText: '추천인'),
              ),
            ],
          )
        ),
      ),
    );
  }
}
