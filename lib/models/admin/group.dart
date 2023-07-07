import 'dart:convert';

import 'package:backoffice_front/screens/admin/group_detail_screen.dart';
import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/user.dart';

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
      DataCell(Text(id.toString())),
      DataCell(
          TextButton(
            onPressed: () {
              Get.to(GroupDetailScreen(group: this));
            },
            child: Text(name),
          )
      ),
      DataCell(Text(memberCount.toString())),
    ]);
  }

}

Future<List<Group>> fetchAllGroups() async {
  var response = await http.get(
    StringUtils().stringToUri("/admin/group"),
    headers: await StringUtils().header(),
  );

  print(jsonDecode(utf8.decode(response.bodyBytes)));

  return (jsonDecode(utf8.decode(response.bodyBytes)) as List)
    .map<Group>((json) => Group.fromJson(json))
    .toList();
}

DataTable makeDataTable(List<Group> groups) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("번호")),
        DataColumn(label: Text("그룹명")),
        DataColumn(label: Text("그룹인원")),
      ],
      rows: groups.map<DataRow>((group) => group.toDataRow()).toList()
  );
}

Future<List<User>> fetchUsersInGroup(int groupId) async {
  var response = await http.get(
      StringUtils().stringToUri("/admin/group/member", params: {"groupId": groupId.toString()}),
      headers: await StringUtils().header(),
  );

  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<User>((json) => User.fromJson(json)).toList();
}

DataTable makeGroupMemberDataTable(List<User> users) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("이름")),
        DataColumn(label: Text("아이디")),
        DataColumn(label: Text("연락처")),
        DataColumn(label: Text("이메일")),
      ],
      rows: users.map<DataRow>((user) => user.toGroupMemberDataRow()).toList()
  );
}

Future<http.Response> addGroupMember(int groupId, List<String> stringIds) async {
  return await http.post(
    StringUtils().stringToUri("admin/group/member"),
    headers: await StringUtils().header(),
    body: jsonEncode({'groupId': groupId, 'stringIds': stringIds})
  );
}

Future<http.Response> deleteGroupMember(int userGroupId) async {
  return await http.delete(
    StringUtils().stringToUri('admin/group/member', params: {'userGroupId': userGroupId}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> makeGroup(String name) async {
  return await http.post(
    StringUtils().stringToUri('admin/group'),
    headers: await StringUtils().header(),
    body: name
  );
}

Future<http.Response> deleteGroup(int groupId) async {
  return await http.delete(
    StringUtils().stringToUri('admin/group', params: {'groupId': groupId}),
    headers: await StringUtils().header(),
  );
}