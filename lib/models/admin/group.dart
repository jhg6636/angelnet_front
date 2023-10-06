import 'dart:convert';

import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:remixicon/remixicon.dart';

import '../../screens/admin/group_detail_screen.dart';
import '../../utils/StringUtils.dart';
import '../common/user.dart';
import '../fund/fund.dart';

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

  DataRow toDataRow(int index, BuildContext context) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(name)),
      DataCell(Text(memberCount.toString())),
      DataCell(Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff2f2f2),
              // border: Border.all(color: )
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "수정",
              onPressed: () {
                Get.to(GroupDetailScreen(group: this,));
              },
              icon: const Icon(Remix.edit_2_line, size: 14, color: Color(0xff333333),),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff5a9a9),
              // border: Border.all(color: )
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "삭제",
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return CustomAlertWidget().deleteWidget(context, () async {
                    await deleteGroup(id);
                  });
                });
              },
              icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
            ),
          )
        ],
      ))
    ]);
    // return DataRow(cells: [
    //   DataCell(Text(id.toString())),
    //   DataCell(
    //       TextButton(
    //         onPressed: () {
    //           Get.to(const GroupDetailScreen());
    //           // Get.to(GroupDetailScreen(group: this));
    //         },
    //         child: Text(name),
    //       )
    //   ),
    //   DataCell(Text(memberCount.toString())),
    // ]);
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


Future<List<User>> fetchUsersInGroup(int groupId) async {
  print(groupId);
  var response = await http.get(
      StringUtils().stringToUri("/admin/group/member", params: {"groupId": groupId.toString()}),
      headers: await StringUtils().header(),
  );

  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<User>((json) => User.fromJson(json)).toList();
}

Future<http.Response> addGroupMember(List<int> userIds, int groupId) async {
  return await http.post(
    StringUtils().stringToUri("admin/group/member"),
    headers: await StringUtils().header(),
    body: jsonEncode({'groupId': groupId, 'userIds': userIds})
  );
}

Future<http.Response> deleteGroupMember(List<int> userIds, int groupId) async {
  return await http.delete(
    StringUtils().stringToUri('admin/group/member', params: {'userIds': StringUtils().apiListDataFormat(userIds), 'groupId': groupId.toString()}),
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

// Future<List<Fund>> fetchFundsInGroup(int groupId) async {
//
// }