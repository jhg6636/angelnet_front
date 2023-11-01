import 'dart:convert';

import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../screens/bulletin/post_edit_screen.dart';
import '../../screens/screen_frame.dart';
import '../../utils/StringUtils.dart';

class Post {

  final int id;
  final int? fundId;
  final String? fundName;
  final String title;
  final String writer;
  final DateTime createdAt;
  final String body;

  const Post(
      {
        required this.id,
        required this.fundId,
        required this.fundName,
        required this.title,
        required this.writer,
        required this.createdAt,
        required this.body
      }
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      fundId: json["bulletinId"] as int,
      fundName: json["fundName"] as String,
      title: json["title"] as String,
      writer: json["writer"] as String,
      createdAt: DateTime.parse(json["createdAt"]),
      body: json["body"] as String,
    );
  }

  Widget toPostScreen(bool isAdmin) {
    return ScreenFrame(
      main: SingleChildScrollView(
          child: Column(
            children: [
              ButtonBar(
                children: [
                  const BackButton(),
                  if (isAdmin) ElevatedButton(
                    onPressed: () {
                      Get.to(const PostEditScreen());
                      // Get.to(PostEditScreen(post: this, isEditing: true));
                    },
                    child: const Text("수정하기"),
                  )
                ],
              ),
              Wrap(children: [const Text("제목"), Text(title)]),
              Wrap(children: [const Text("작성자"), Text(writer)]),
              Html(data: body),
            ],
          )
      ),
      isAdmin: true
    );
  }

  DataRow toDataRow(bool isAdmin) {
    return DataRow(cells: [
      DataCell(Text(id.toString())),
      DataCell(TextButton(onPressed: () { Get.to(toPostScreen(isAdmin)); }, child: Text(title),)),
      DataCell(Text(writer)),
      DataCell(Text(createdAt.toString())),
    ]);
  }

  DataRow toFundDataRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(index.toString())),
        DataCell(Text(title)),
        DataCell(Text(writer)),
        DataCell(Text(DateFormat('yyyy-MM-dd').format(createdAt))),
        DataCell(
          Row(
            children: [
              WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2),
                IconButton(
                  onPressed: () {
                    Get.to(const PostEditScreen());
                  },
                  icon: const Icon(Remix.edit_line, color: Color(0xff333333), size: 14),
                )
              ),
              const SizedBox(width: 15,),
              WidgetUtils.circleButtonFrame(ColorUtils.negativeColor,
                IconButton(
                  onPressed: () {
                    // todo delete api
                  },
                  icon: const Icon(Remix.close_line, color: Colors.white, size: 24,)
                )
              )
            ],
          )
        )
      ]
    );
  }

}

Future<List<Post>> fetchAllPosts() async {
  var response = await http.get(
    StringUtils().stringToUri("/post"),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<Post>((json) => Post.fromJson(json)).toList();
}

Future<http.Response> makePost(int bulletinId, String title, String body) async {
  return await http.post(
    StringUtils().stringToUri('post'),
    headers: await StringUtils().header(),
    body: jsonEncode({'bulletinId': bulletinId, 'title': title, 'body': body})
  );
}

Future<Post> fetchOnePost(int postId) async {
  var response = await http.get(
    StringUtils().stringToUri('post/full', params: {'postId': postId}),
    headers: await StringUtils().header(),
  );

  return Post.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<List<Post>> fetchPostsInBulletin(int bulletinId) async {
  var response = await http.get(
    StringUtils().stringToUri('post', params: {'bulletinId': bulletinId.toString()}),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
}

Future<List<Post>> fetchPostsInFund(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri('post/fund', params: {'fundId': fundId.toString()},),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
}