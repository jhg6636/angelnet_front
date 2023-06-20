import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/StringUtils.dart';
import 'package:http/http.dart' as http;

class Bulletin {

  final int id;
  final String name;

  bool checked;

  Bulletin({required this.id, required this.name, this.checked = false});

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      id: json["id"] as int,
      name: json["name"] as String,
    );
  }

  DataRow toDataRow() {
    return DataRow(
        cells: [
          DataCell(Text(id as String)),
          DataCell(TextButton(
            onPressed: () {
              // Get.to();
            },
            child: Text(name),
          )),
          const DataCell(Text("0")),
        ],
    );
  }

  DataRow toDataRowWithCheckbox() {
    return DataRow(
      cells: [
        DataCell(Text(id as String)),
        DataCell(TextButton(
          onPressed: () {
            // Get.to();
          },
          child: Text(name),
        )),
        const DataCell(Text("0")),
      ],
      selected: checked,
      onSelectChanged: (selected) {
        checked = selected ?? false;
      }
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
  return await http.post(
    StringUtils().stringToUri('bulletin'),
    headers: await StringUtils().header(),
    body: {'name': name}
  );
}