import 'dart:convert';

import 'package:angelnet/models/notification/notification_type.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Notification {

  final int id;
  final int receiverId;
  final String title;
  final String content;
  final DateTime sendAt;
  final DateTime? checkAt;
  final NotificationType type;

  Notification({required this.id, required this.receiverId, required this.title, required this.content, required this.sendAt, this.checkAt, required this.type});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      receiverId: json['receiverId'],
      title: json['title'],
      content: json['body'],
      sendAt: DateTime(json['sendAt'][0], json['sendAt'][1], json['sendAt'][2], json['sendAt'][3], json['sendAt'][4], json['sendAt'][5]),
      checkAt: json['checkAt'] == null? null : DateTime(json['checkAt'][0], json['checkAt'][1], json['checkAt'][2], json['checkAt'][3], json['checkAt'][4], json['checkAt'][5]),
      type: NotificationType.fromEnglish(json['type'])
    );
  }

  Widget toWidget(Function()? setState) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: setState,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: 1200,
            margin: const EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      transform: Matrix4.translationValues(-3, 0, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (checkAt == null)? const Color(0xff0361f9) : const Color(0xffaaaaaa),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(DateFormat('yyyy.MM.dd hh:mm:ss').format(sendAt),
                        style: TextStyle(
                            fontWeight: (checkAt == null)? FontWeight.w600 : FontWeight.w300,
                            fontSize: 16,
                            fontFamily: StringUtils.pretendard,
                            color: (checkAt == null)? const Color(0xff1173f9) : const Color(0xffaaaaaa),
                            letterSpacing: -0.32
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                  child: Text(content,
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontSize: 19,
                        fontWeight: (checkAt == null)? FontWeight.w600 : FontWeight.w300,
                        color: (checkAt == null)? const Color(0xff333333) : const Color(0xffaaaaaa),
                      )
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (checkAt == null)? const Color(0xff1173f9) : const Color(0xffaaaaaa),
            ),
            child: const Center(
              child: Icon(Remix.arrow_right_line, color: Colors.white, size: 20,),
            ),
          )
        ],
      )
    );
  }

}

Future<List<Notification>> fetchMyNotifications() async {
  var response = await http.get(
    StringUtils().stringToUri('notification/my'),
    headers: await StringUtils().header()
  );
  print("notification/my");
  print("Response Body: ${response.body}");

  return jsonDecode(utf8.decode(response.bodyBytes)).map<Notification>((json) => Notification.fromJson(json)).toList();
}

Future<http.Response> checkNotification(int notificationId) async {
  return await http.post(
    StringUtils().stringToUri('notification/check'),
    body: notificationId.toString(),
    headers: await StringUtils().header()
  );
}