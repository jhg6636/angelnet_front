import 'dart:convert';
import 'dart:io';

import 'package:angelnet/models/common/user_type.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/widgets/admin/make_user_form.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../main.dart';
import '../../screens/admin/manage_user_screen.dart';
import '../../utils/StringUtils.dart';

class User {
  int id;
  String stringId;
  String name;
  UserType userType;
  String? workplace;
  String phone;
  String email;
  String? recommender;
  DateTime createdAt;
  DateTime lastLoginAt;
  int userLevelId;

  User({
    required this.id,
    required this.stringId,
    required this.name,
    required this.userType,
    required this.workplace,
    required this.phone,
    required this.email,
    required this.recommender,
    required this.createdAt,
    required this.lastLoginAt,
    required this.userLevelId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      stringId: json['stringId'],
      name: json['name'],
      userType: UserType.fromEnglish(json['type']),
      workplace: json['workplace'],
      phone: json['phone'],
      email: json['email'],
      recommender: json['recommender'],
      createdAt: DateTime(
          json['createdAt'][0], json['createdAt'][1], json['createdAt'][2]),
      lastLoginAt: DateTime(
          json['lastLoginAt'][0],
          json['lastLoginAt'][1],
          json['lastLoginAt'][2],
          json['lastLoginAt'][3],
          json['lastLoginAt'][4],
          json['lastLoginAt'][5]),
      userLevelId: json['userLevelId'] ?? -1
    );
  }

  factory User.fromMyInfoJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      stringId: json['stringId'],
      name: json['name'],
      userType: UserType.fromEnglish(json['level']),
      workplace: json['workplace'],
      phone: json['phone'],
      email: json['email'],
      recommender: json['recommender'],
      createdAt: DateTime.now(),
      // garbage
      lastLoginAt: DateTime.now(), // garbage
      userLevelId: -1 //garbage
    );
  }

  DataRow toDataRow(int index, BuildContext context) {
    return DataRow(cells: [
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
                Get.to(ScreenFrameV2(
                    main: MakeUserForm(
                        isAdmin: true, isEditing: true, user: this),
                    isAdmin: true,
                    crumbs: const ['회원관리', '회원정보수정']));
              },
              icon: const Icon(
                Remix.edit_2_line,
                size: 14,
                color: Color(0xff333333),
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff5a9a9),
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "삭제",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertWidget().deleteWidget(context,
                          () async {
                        var response = await deleteUser(stringId);
                        Navigator.pop(context);
                        Get.to(const ManageUserScreen());
                      });
                    });
              },
              icon: const Icon(
                Remix.subtract_line,
                size: 14,
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
      DataCell(Text((index + 1).toString())),
      DataCell(Text(userType.korean)),
      DataCell(Text(name)),
      DataCell(Text(stringId)),
      DataCell(Text(phone)),
      DataCell(Text(email)),
      DataCell(Text(DateFormat('yyyy-MM-dd').format(createdAt))),
      DataCell(Text(DateFormat('yyyy-MM-dd hh:mm:ss').format(lastLoginAt))),
      DataCell(Text(recommender ?? "")),
      DataCell(Text(workplace ?? "")),
    ]);
  }

  DataRow toGroupMemberDataRow(BuildContext context, int index, int groupId, List<int> selectedIds) {
    return DataRow(
      selected: selectedIds.contains(id),
      onSelectChanged: (selected) {
        if (selected == true) {
          if (!selectedIds.contains(id)) {
            selectedIds.add(id);
          }
        } else {
          selectedIds.remove(id);
        }
      },
      cells: [
        DataCell(Text(index.toString())),
        DataCell(Text(userType.korean)),
        DataCell(Text(name)),
        DataCell(Text(stringId)),
        DataCell(Text(phone)),
        DataCell(Text(email)),
        DataCell(Text(DateFormat('yyyy-MM-dd').format(createdAt))),
        // DataCell(Container(
        //   width: 36,
        //   height: 36,
        //   alignment: Alignment.center,
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: Color(0xfff5a9a9),
        //   ),
        //   child: IconButton(
        //     alignment: Alignment.center,
        //     splashRadius: 18,
        //     tooltip: "삭제",
        //     onPressed: () {
        //       showDialog(
        //           context: context,
        //           builder: (context) {
        //             return CustomAlertWidget().deleteWidget(context, () async {
        //               var response = await deleteGroupMember(id, groupId);
        //               Navigator.pop(context);
        //             });
        //           });
        //     },
        //     icon: const Icon(
        //       Remix.subtract_line,
        //       size: 14,
        //       color: Colors.white,
        //     ),
        //   ),
        // ))
      ]
    );
  }

  bool isContainedIn(List<User> users) {
    var userIds = users.map<String>((user) => user.stringId).toList();
    return userIds.contains(stringId);
  }
}

Future<List<User>> fetchUsers({
  String sort = "CREATE",
  String? name,
  String? stringId,
  String? phone,
  String? recommender,
  List<String>? levels,
}) async {
  Map<String, dynamic> params = {'sortBy': sort};
  if (name != null) {
    params['name'] = name;
  }
  if (stringId != null) {
    params['stringId'] = stringId;
  }
  if (phone != null) {
    params['phone'] = phone;
  }
  if (recommender != null) {
    params['recommender'] = recommender;
  }
  if (levels != null) {
    params['levels'] = levels;
  }
  var response = await http.get(
      StringUtils().stringToUri(
        '/admin/users',
        params: params,
      ),
      headers: await StringUtils().header());
  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<User>((json) => User.fromJson(json)).toList();
  return result;
}

Future<String> checkRoleApi() async {
  var response = await http.get(StringUtils().stringToUri("/role"),
      headers: await StringUtils().header());

  return response.body;
}

Future<bool> checkStringId(String stringId) async {
  var response = await http.get(
      StringUtils().stringToUri("/check-id", params: {"stringId": stringId}));
  print(response.body);
  if (response.body.contains('true')) return true;
  if (response.body.contains('false')) return false;
  return false;
  // return response.body as bool;
}

Future<Map<String, dynamic>> getMyInfo() async {
  var response = await http.get(StringUtils().stringToUri("/my-info"),
      headers: await StringUtils().header());

  return jsonDecode(utf8.decode(response.bodyBytes));
}

Future<http.Response> changePassword(
    String stringId, String newPassword) async {
  var response = await http.post(StringUtils().stringToUri("/change-password"),
      body: jsonEncode({"stringId": stringId, "newPassword": newPassword}),
      headers: StringUtils.noAuthHeader);

  return response;
}

Future<http.Response> signInApi(
  String stringId,
  String password,
  String name,
  String phone,
  String email,
  String recommender,
  String workplace,
) async {
  String? recommenderText = (recommender == "") ? null : recommender;
  String? workplaceText = (workplace == "") ? null : workplace;

  final Map<String, dynamic> request = {
    "stringId": stringId,
    "password": password,
    "name": name,
    "phone": phone,
    "email": email,
    "recommender": recommenderText,
    "workplace": workplaceText
  };
  var headers = {HttpHeaders.contentTypeHeader: "application/json"};

  var uri = StringUtils().stringToUri('/sign-in');
  var response =
      await http.post(uri, headers: headers, body: jsonEncode(request));
  return response;
}

Future<http.Response> loginApi(String stringId, String password) async {
  var deviceId = await StringUtils().getDeviceId();
  print(deviceId);
  final Map<String, dynamic> request = {
    "stringId": stringId,
    "password": password
  };
  var headers = {HttpHeaders.contentTypeHeader: "application/json"};

  var uri = StringUtils().stringToUri('login', params: request);
  var response = await http.get(uri, headers: headers);
  while (response.body.isBlank ?? true) {
    response = await http.get(uri, headers: headers);
  }

  print(response.body);

  // await secureStorage.write(key: deviceId, value: response.body);
  storage[deviceId] = response.body;
  // print(await secureStorage.containsKey(key: deviceId));
  return response;
}

Future<List<dynamic>> findIdApi(String name, String phone) async {
  var response = await http.get(StringUtils()
          .stringToUri("/find-id", params: {"name": name, "phone": phone})
      // headers: StringUtils.noAuthHeader
      );

  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes));
}

Future<http.Response> findPwApi(String name, String email, String stringId) async {
  return await http.get(
    StringUtils().stringToUri("/find-pw",
        params: {"name": name, "email": email, "stringId": stringId}),
    // headers: StringUtils.noAuthHeader
  );
}

Future<http.Response> editUserApi(
  String stringId,
  String name,
  String phone,
  String email,
  String recommender,
  String workplace,
  UserType userLevel,
) async {
  var body = jsonEncode({
    'stringId': stringId,
    'name': name,
    'phone': phone,
    'email': email,
    'recommender': recommender,
    'workplace': workplace,
    'userLevel': userLevel.english,
  });
  print(body);
  return await http.put(StringUtils().stringToUri('/user'),
      body: body, headers: await StringUtils().header());
}

Future<http.Response> deleteUser(String stringId) async {
  return await http.delete(
      StringUtils().stringToUri('/user', params: {'stringId': stringId}),
      headers: await StringUtils().header());
}
