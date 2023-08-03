import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPwScreen extends StatefulWidget {

  const ResetPwScreen({super.key});

  @override
  State<StatefulWidget> createState() => ResetPwScreenState();

}

class ResetPwScreenState extends State<ResetPwScreen> {
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("비밀번호"),
          TextField(
            controller: _passwordController,
          ),
          const Text("비밀번호 확인"),
          TextField(
            controller: _passwordCheckController,
          ),
          ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: const Text("취소하기")),
              FilledButton(onPressed: () {}, child: const Text("비밀번호 변경하기"))
            ],
          )
        ],
      )
    );
  }

}