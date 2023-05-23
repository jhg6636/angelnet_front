import 'dart:convert';

import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Group {

  int id;
  String name;
  int memberCount;

  Group({
    required this.id,
    required this.name,
    required this.memberCount,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      memberCount: json['memberCount']
    );
  }

  DataRow toDataRow() {
    return DataRow(cells: [
      DataCell(Text(id as String)),
      DataCell(
          TextButton(
            onPressed: () {
              Get.to(const NotDevelopedScreen(isAdmin: true));
            },
            child: Text(name),
          )
      ),
      DataCell(Text(memberCount as String))
    ]);
  }

}

Future<List<Group>> fetchAllGroups() async {
  var response = await http.get(
    StringUtils().stringToUri("/group"),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes))
    .map<Group>((json) => Group.fromJson(json)).toList();
}