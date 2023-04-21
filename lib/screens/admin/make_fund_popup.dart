import 'dart:convert';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MakeFundPopup {
  final _fundNameController = TextEditingController();
  final _startupNameController = TextEditingController();

  AlertDialog build(BuildContext context) {
    return AlertDialog(
      title: const Text("조합 생성"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _fundNameController,
              decoration: InputDecoration(hintText: '조합명'),
            ),
            TextField(
              controller: _startupNameController,
              decoration: InputDecoration(hintText: '투자종목'),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("취소")
        ),
        ElevatedButton(
            onPressed: () {
              makeFundApi(_fundNameController.text, _startupNameController.text);
              Navigator.pop(context);
            },
            child: Text("생성")
        )
      ],
    );
  }
}

Future<http.Response> makeFundApi(String fundName, String startupName) async {
  return await http.post(
    StringUtils().stringToUri("/admin/fund"),
    headers: await StringUtils().header(),
    body: jsonEncode({"name": fundName, "startupName": startupName})
  );
}