import 'dart:convert';

import 'package:backoffice_front/main.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String stringId;
  String name;
  String userLevel;
  String? workPlace;
  String phone;
  String email;
  String? recommender;
  DateTime createdAt;

  User({
    required this.stringId,
    required this.name,
    required this.userLevel,
    required this.workPlace,
    required this.phone,
    required this.email,
    required this.recommender,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        stringId: json['stringId'],
        name: json['name'],
        userLevel: json['userLevel'],
        workPlace: "", // json['workPlace'],
        phone: json['phone'],
        email: json['email'],
        recommender: json['recommender'],
        createdAt: DateTime.parse(json['createdAt']));
  }

  DataRow toDataRow() {
    return DataRow(cells: [
      DataCell(Text(stringId)),
      DataCell(Text(name)),
      DataCell(Text(userLevel)),
      DataCell(Text(workPlace ?? "")),
      DataCell(Text(phone)),
      DataCell(Text(email)),
      DataCell(Text(recommender ?? "")),
      DataCell(Text(createdAt.toString())),
    ]);
  }
}

Future<List<User>> fetchUsers() async {
  var response = await http.get(
      StringUtils().stringToUri('/admin/users'),
      headers: await StringUtils().header()
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<User>((json) => User.fromJson(json)).toList();
  return result;
}

Future<String> checkRoleApi() async {
  var response = await http.get(StringUtils().stringToUri("/role"),
      headers: await StringUtils().header());

  return response.body;
}