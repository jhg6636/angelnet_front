import 'dart:convert';

import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remixicon/remixicon.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/WidgetUtils.dart';

class UserLevel {

  final int id;
  final String name;
  final int priority;

  const UserLevel({required this.id, required this.name, required this.priority});

  factory UserLevel.fromJson(Map<String, dynamic> json) {
    return UserLevel(
      id: json['id'],
      name: json['name'],
      priority: json['priority']
    );
  }

  DataRow generalLevelDataRow() {
    final priorityController = TextEditingController(text: priority.toString());
    final nameController = TextEditingController(text: name);
    return DataRow(
      cells: [
        DataCell(
          TextField(
            controller: priorityController,
            decoration: const InputDecoration(),
          )
        ),
        DataCell(
            TextField(
              controller: nameController,
              decoration: const InputDecoration(),
            )
        ),
        DataCell(
          WidgetUtils.circleButtonFrame(const Color(0xff333333), IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 2.0,
              onPressed: () {
                // todo post api
              },
              icon: const Icon(Remix.save_line, color: Colors.white, size: 24,)
          ))
        ),
        DataCell(
            WidgetUtils.circleButtonFrame(
                ColorUtils.negativeColor,
                IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 2.0,
                    onPressed: () {},
                    icon: const Icon(Remix.subtract_line, color: Colors.white, size: 24,)
                )
            )
        )
      ]
    );
  }

  DataRow specialLevelDataRow() {
    final nameController = TextEditingController(text: name);
    return DataRow(
      cells: [
        DataCell(
          TextField(
            controller: nameController,
            decoration: const InputDecoration(),
          )
        ),
        DataCell(
            WidgetUtils.circleButtonFrame(const Color(0xff333333), IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 2.0,
                onPressed: () {
                  // todo post api
                },
                icon: const Icon(Remix.save_line, color: Colors.white, size: 24,)
            ))
        ),
        DataCell(WidgetUtils.circleButtonFrame(
            ColorUtils.negativeColor,
            IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 2.0,
                onPressed: () {},
                icon: const Icon(Remix.subtract_line, color: Colors.white, size: 24,)
            )
        ))
      ]
    );
  }

}

Future<List<UserLevel>> getAllUserLevels() async {
  var response = await http.get(
    StringUtils().stringToUri('/level'),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map((json) => UserLevel.fromJson(json));
}

Future<http.Response> makeUserLevel(String name, bool isSpecial) async {
  return await http.post(
    StringUtils().stringToUri('/level'),
    body: jsonEncode({'name': name, 'isSpecial': isSpecial}),
    headers: await StringUtils().header()
  );
}

Future<http.Response> modifyUserLevel(UserLevel userLevel) async {
  return await http.put(
    StringUtils().stringToUri('/level'),
    body: jsonEncode({'id': userLevel.id, 'name': userLevel.name, 'priority': userLevel.priority}),
    headers: await StringUtils().header()
  );
}

Future<http.Response> deleteUserLevel(int userLevelId) async {
  return await http.delete(
    StringUtils().stringToUri('/level', params: {'userLevelId': userLevelId}),
    headers: await StringUtils().header()
  );
}

Future<http.Response> changeUserLevel(int userId, int userLevelId) async {
  return await http.post(
    StringUtils().stringToUri('/level/user'),
    body: jsonEncode({'userId': userId, 'userLevelId': userLevelId}),
    headers: await StringUtils().header()
  );
}

Future<http.Response> setFundUserLevel(int fundId, int userLevelId, String type) async {
  return await http.post(
    StringUtils().stringToUri('/level/fund'),
    body: jsonEncode({'fundId': fundId, 'userLevelId': userLevelId, 'type': type}),
    headers: await StringUtils().header()
  );
}