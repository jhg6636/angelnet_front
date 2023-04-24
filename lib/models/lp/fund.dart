import 'dart:convert';
import 'dart:core';

import 'package:backoffice_front/main.dart';
import 'package:backoffice_front/models/startup/startup.dart';
import 'package:backoffice_front/screens/startup/startup_screen.dart';
import 'package:backoffice_front/utils/ListUtils.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Fund {
  int id;
  String name;
  String startupName;
  DateTime createdAt;
  String type;
  int cost;

  Fund(
      {required this.id,
      required this.name,
      required this.startupName,
      required this.createdAt,
      required this.type,
      required this.cost});

  factory Fund.fromJson(Map<String, dynamic> json) {
    print(json);
    return Fund(
        id: json['id'] as int,
        name: json['name'] as String,
        startupName: json['startupName'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        type: "",
        cost: json['cost'] as int);
  }

  DataRow toDataRow() {
    return DataRow(
        cells: [
          DataCell(Text(id.toString())),
          DataCell(Text(name)),
          DataCell(
              FutureBuilder<Startup>(
                future: fetchStartup(startupName),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return WidgetUtils.errorPadding;
                  } else {
                    return TextButton(
                        onPressed: () {
                          Get.to(StartupScreen(startup: snapshot.data));
                        },
                        child: Text(startupName)
                    );
                  }
                }
              )
              //Text(startupName)
          ),
          DataCell(Text(createdAt.toString())),
          DataCell(Text(cost.toString())),
        ]
    );
  }

  DataRow toDataRowWithButton() {
    return DataRow(
        cells: [
          DataCell(Text(id.toString())),
          DataCell(Text(name)),
          DataCell(Text(startupName)),
          DataCell(Text(createdAt.toString())),
          DataCell(Text(cost.toString())),
          DataCell(
              ElevatedButton(
                onPressed: () {
                  joinFund(id);
                },
                child: const Text("조합 참여하기"),
              )
          ),
        ]
    );
  }
}

Future<List<Fund>> fetchMyFunds() async {
  var response = await http.get(
      StringUtils().stringToUri('lp/my-fund'),
      headers: await StringUtils().header()
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
  return result;
}

Future<List<Fund>> fetchAllFunds() async {
  var response = await http.get(
    StringUtils().stringToUri('admin/funds'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<List<Fund>> searchFunds(String status) async {
  var response = await http.get(
    StringUtils().stringToUri('lp/fund'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<http.Response> joinFund(int fundId) async {
  return await http.post(
    StringUtils().stringToUri('lp/fund'),
    headers: await StringUtils().header(),
    body: {"fundId": fundId.toString()},
  );
}