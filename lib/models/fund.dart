import 'dart:convert';

import 'package:flutter/foundation.dart';
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
    return Fund(
        id: json['id'] as int,
        name: json['name'] as String,
        startupName: json['startupName'] as String,
        createdAt: json['createdAt'] as DateTime,
        cost: json['cost'] as int);
  }

}

Future<List<Fund>> fetchMyFunds(http.Client client) async {
  final response = await client.get('https://www.reoffice.com/lp/funds' as Uri);

  return compute(parseFunds, response.body);
}

List<Fund> parseFunds(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Fund>((json) => Fund.fromJson(json));
}