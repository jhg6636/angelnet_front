import 'dart:convert';

import 'package:angelnet/utils/StringUtils.dart';
import 'package:http/http.dart' as http;

class Notification {

  final int id;
  final String title;
  final String content;
  final DateTime sendAt;
  final DateTime? checkAt;

  Notification({required this.id, required this.title, required this.content, required this.sendAt, this.checkAt});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: int.parse(json['id']),
      title: json['title'],
      content: json['content'],
      sendAt: DateTime.parse(json['sendAt']),
      checkAt: DateTime.parse(json['checkAt'])
    );
  }

}

Future<List<Notification>> fetchMyNotifications() async {
  var response = await http.get(
    StringUtils().stringToUri('notification/my'),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map((json) => Notification.fromJson(json)).toList();
}