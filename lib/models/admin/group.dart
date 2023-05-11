import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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