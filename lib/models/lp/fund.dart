import 'dart:convert';
import 'dart:core';

import 'package:backoffice_front/main.dart';
import 'package:backoffice_front/utils/ListUtils.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:http/http.dart' as http;

class Fund {
  final int id;
  final String name;
  final String startupName;
  final DateTime createdAt;
  final int cost;

  Fund(
      {required this.id,
      required this.name,
      required this.startupName,
      required this.createdAt,
      required this.cost});

  factory Fund.fromJson(Map<String, dynamic> json) {
    print(json);
    return Fund(
        id: json['id'] as int,
        name: json['name'] as String,
        startupName: json['startupName'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        cost: json['cost'] as int);
  }
}

Future<List<Fund>> fetchMyFunds() async {
  var response = await http.get(StringUtils().stringToUri('lp/my-fund'),
      headers: StringUtils()
          .header(
          await secureStorage.read(key: await StringUtils().getDeviceId()) ??
              ""));

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
  return result;
}

List<Fund> parseFunds(String responseBody) {
  print(responseBody);
  final parsed = json.decode(responseBody).cast<List<Map<String, dynamic>>>();

  return parsed.map<Fund>((json) => Fund.fromJson(json));
}
