import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notice {
  String receiverId;
  String type; //enum으로
  String title;
  String content;
  DateTime sendAt;
  DateTime? checkAt;
  String id;

  Notice({
    required this.receiverId,
    required this.type,
    required this.title,
    required this.content,
    required this.sendAt,
    required this.checkAt,
    required this.id,
  });

  factory Notice.fromJson(Map<String, dynamic> json){
    return Notice(
      receiverId: json['receiverId'].toString(),
      type: json['type'],
      title: json['title'],
      content: json['content'],
      sendAt: DateTime.parse(json['sendAt']),
      checkAt: json['checkAt']!= null?DateTime.parse(json['checkAt']): null,
      id: json['id'].toString(),
    );
  }
  DataRow toDataRow(){
    return DataRow(cells: [
      DataCell(Text(receiverId)),
      DataCell(Text(type)),
      DataCell(Text(title)),
      DataCell(Text(content)),
      DataCell(Text(sendAt.toString())),
      DataCell(Text(checkAt.toString())),

    ]);
  }
}
//lp 알림
Future<List<Notice>> fetchNotification(String stringId) async{
  var response = await http.get(
      StringUtils().stringToUri('/admin/notification',params: {"stringId": stringId}),
      headers: await StringUtils().header()
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<Notice>((json)=> Notice.fromJson(json)).toList();
  return result;
}
// 관리자 모든알림
Future<List<Notice>> fetchNotifications() async{
  var response = await http.get(
    StringUtils().stringToUri('/admin/notifications'),
      headers: await StringUtils().header()
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<Notice>((json)=> Notice.fromJson(json)).toList();
  return result;
}

Future<http.Response> postNotificationApi(
    String stringId,
    String type,
    String title,
    String content,
    ) async {
  final Map<String, dynamic> request = {
    "receiverId": stringId,
    "type": type,
    "title": title,
    "content": content,

  };
  var headers = {HttpHeaders.contentTypeHeader: "application/json"};

  var uri = StringUtils().stringToUri('/admin/notifications');
  var response = await http.post(uri, headers: headers, body: jsonEncode(request));
  return response;
}

Future<http.Response> checkNoticeApi(String stringId) async {
  var uri = StringUtils().stringToUri('/check/notification/id',params: {"stringId":stringId});
  try {
    var response = await http.post(uri,headers: await StringUtils().header());

    if (response.statusCode == 200) {

      return response;
    } else {

      throw Exception('서버에서 오류 응답을 받았습니다: ${response.statusCode}');
    }
  } catch (e) {

    print('오류 발생: $e');

    return http.Response('{"error": "서버 응답을 처리할 수 없습니다."}', 500);
  }


}

Future<bool> checkNoticeStringId(String stringId) async {
  var response = await http.get(StringUtils().stringToUri("/check-notification-id", params: {"stringId": stringId}));
  return response.body as bool;
}