import 'dart:convert';

import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
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

  DataRow generalLevelDataRow(BuildContext context, Function(Function ()) setState) {
    var priorityController = TextEditingController(text: priority.toString());
    var nameController = TextEditingController(text: name);
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
              onPressed: () async {
                // todo post api
                var response = await modifyUserLevel(UserLevel(id: id, name: nameController.text, priority: int.parse(priorityController.text)));
                print('here');
                print(response.statusCode);
                showDialog(context: context, builder: (BuildContext context) {
                  return CustomAlertWidget().informationWidget(context, "저장되었습니다.", "");
                });
                setState;
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

  DataRow specialLevelDataRow(BuildContext context, Function(Function()) setState) {
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
                onPressed: () async {
                  // todo post api
                  await modifyUserLevel(UserLevel(id: id, name: nameController.text, priority: -1));
                  showDialog(context: context, builder: (BuildContext context) {
                    return WidgetUtils.okMessage("저장되었습니다.");
                  });
                  setState;
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

  @override
  bool operator ==(dynamic other) {
    return other is UserLevel && other.id == id;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

}

Future<List<UserLevel>> getAllUserLevels() async {
  var response = await http.get(
    StringUtils().stringToUri('/level'),
    headers: await StringUtils().header()
  );

  print(response.body);

  return (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>)
      .map<UserLevel>((json) => UserLevel.fromJson(json)).toList();
}

Future<http.Response> makeUserLevel(String name, bool isSpecial) async {
  return await http.post(
    StringUtils().stringToUri('/level'),
    body: jsonEncode({'name': name, 'isSpecial': isSpecial}),
    headers: await StringUtils().header()
  );
}

Future<http.Response> modifyUserLevel(UserLevel userLevel) async {
  print(userLevel.name);
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