import 'package:flutter/material.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindIdScreenState();
}

class FindIdScreenState extends State<FindIdScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text("이름"),
                SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _nameController,
                    )
                ),
              ],
            ),
            Wrap(
              children: [
                Column(
                  children: [
                    const Text("이메일로 찾기"),
                    SizedBox(
                      width: 350.0,
                      child: TextField(
                        controller: _emailController,
                      ),
                    ),
                    FilledButton(onPressed: () {}, child: const Text("찾기"))
                  ],
                ),
                const SizedBox(width: 50.0,),
                Column(children: [
                  const Text("연락처로 찾기"),
                  SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _phoneController,
                    ),
                  ),
                  FilledButton(onPressed: () {}, child: const Text("찾기"))
                ])
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("취소하기"))
          ],
        )
    );
  }
}
