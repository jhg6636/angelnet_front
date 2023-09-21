import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../screens/user/edit_user_info_screen.dart';
import '../../utils/StringUtils.dart';

class User {
  String stringId;
  String name;
  String userLevel;
  String? workplace;
  String phone;
  String email;
  String? recommender;
  DateTime createdAt;
  DateTime lastLoginAt;

  User({
    required this.stringId,
    required this.name,
    required this.userLevel,
    required this.workplace,
    required this.phone,
    required this.email,
    required this.recommender,
    required this.createdAt,
    required this.lastLoginAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        stringId: json['stringId'],
        name: json['name'],
        userLevel: json['level'],
        workplace: json['workplace'],
        phone: json['phone'],
        email: json['email'],
        recommender: json['recommender'],
        createdAt: DateTime.parse(json['createdAt']),
        lastLoginAt: DateTime.parse(json['lastLoginAt']),
    );
  }

  factory User.fromMyInfoJson(Map<String, dynamic> json) {
    return User(
      stringId: json['stringId'],
      name: json['name'],
      userLevel: json['level'],
      workplace: json['workplace'],
      phone: json['phone'],
      email: json['email'],
      recommender: json['recommender'],
      createdAt: DateTime.now(), // garbage
      lastLoginAt: DateTime.now(), // garbage
    );
  }

  DataRow toDataRow() {
    return DataRow(cells: [
      DataCell(Text(stringId)),
      DataCell(Text(name)),
      DataCell(Text(userLevel)),
      DataCell(Text(phone)),
      DataCell(Text(email)),
      DataCell(Text(recommender ?? "")),
      DataCell(Text(lastLoginAt.toString())),
      DataCell(Text(workplace ?? "")),
      DataCell(Text(createdAt.toString())),
      DataCell(OutlinedButton(
        onPressed: () {
          Get.to(EditUserInfoScreen(user: this,));
        },
        child: const Text("수정"),
      ))
    ]);
  }

  DataRow toGroupMemberDataRow() {
    return DataRow(cells: [
      DataCell(Text(name)),
      DataCell(Text(stringId)),
      DataCell(Text(phone)),
      DataCell(Text(email)),
    ]);
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
      StringUtils().stringToUri('/admin/users',
          params: params,
      ),
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

Future<bool> checkStringId(String stringId) async {
  var response = await http.get(StringUtils().stringToUri("/check-id", params: {"stringId": stringId}));
  print(response.body);
  if (response.body.contains('true')) return true;
  if (response.body.contains('false')) return false;
  return false;
  // return response.body as bool;
}

Future<Map<String, dynamic>> getMyInfo() async {
  var response = await http.get(
      StringUtils().stringToUri("/my-info"),
      headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes));
}

Future<http.Response> changePassword(String stringId, String newPassword) async {
  var response = await http.post(
    StringUtils().stringToUri("/change-password"),
    body: jsonEncode({"stringId": stringId, "newPassword": newPassword}),
    headers: await StringUtils().header()
  );

  return response;
}

Future<http.Response> signInApi(
    String stringId,
    String password,
    String name,
    String phone,
    String email,
    String recommender
    ) async {
  String? recommenderText = (recommender == "") ? null : recommender;

  final Map<String, dynamic> request = {
    "stringId": stringId,
    "password": password,
    "name": name,
    "phone": phone,
    "email": email,
    "recommender": recommenderText,
  };
  var headers = {HttpHeaders.contentTypeHeader: "application/json"};

  var uri = StringUtils().stringToUri('/sign-in');
  var response = await http.post(uri, headers: headers, body: jsonEncode(request));
  return response;
}

Future<http.Response> loginApi(String stringId, String password) async {
  var deviceId = await StringUtils().getDeviceId();
  print(deviceId);
  final Map<String, dynamic> request = {
    "stringId": stringId,
    "password": password
  };
  var headers = {
    HttpHeaders.contentTypeHeader: "application/json"
  };

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
  var response = await http.get(
      StringUtils().stringToUri("/find-id", params: {"name": name, "phone": phone})
      // headers: StringUtils.noAuthHeader
  );

  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes));
}

Future<String> findPwApi(String name, String email, String stringId) async {
  var response = await http.get(
      StringUtils().stringToUri(
          "/find-pw",
          params: {"name": name, "email": email, "stringId": stringId}
      ),
      // headers: StringUtils.noAuthHeader
  );

  print(response.body);

  return response.body;
}