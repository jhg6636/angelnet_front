import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/StringUtils.dart';

class Bulletin {
  final int id;
  final String name;
  final String tag;
  int postCount;

  bool isOpened;

  Bulletin(
    {
      required this.id,
      required this.name,
      this.tag = 'ALL',
      this.postCount = 0,
      this.isOpened = true
    }
  );

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      id: json["id"] as int,
      name: json["name"] as String,
    );
  }

  DataRow toAdminDataRow() {
    return DataRow(
      cells: [
        DataCell(Text(id.toString())),
        DataCell(TextButton(
          onPressed: () {
            // Get.to(BulletinDetailScreen(bulletin: this, isAdmin: true));
          },
          child: Text(name),
        )),
        DataCell(Text(postCount.toString())),
      ],
    );
  }

  DataRow toLpDataRow() {
    return DataRow(
      cells: [
        DataCell(TextButton(
          onPressed: () {
            // Get.to(BulletinDetailScreen(bulletin: this, isAdmin: false,));
          },
          child: Text(name),
        )),
        DataCell(Text(postCount.toString())),
      ]
    );
  }
}

Future<List<Bulletin>> fetchAllBulletins() async {
  var response = await http.get(
    StringUtils().stringToUri("/bulletin"),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<Bulletin>((json) => Bulletin.fromJson(json)).toList();
}

Future<http.Response> makeBulletin(String name) async {
  return await http.post(StringUtils().stringToUri('bulletin'),
      headers: await StringUtils().header(), body: name);
}
