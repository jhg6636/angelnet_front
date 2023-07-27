import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../screens/bulletin/post_edit_screen.dart';
import '../../screens/screen_frame.dart';
import '../../utils/StringUtils.dart';

class Post {

  final int id;
  final int bulletinId;
  final String title;
  final String writer;
  final DateTime createdAt;
  final String body;

  const Post(
      {
        required this.id,
        required this.bulletinId,
        required this.title,
        required this.writer,
        required this.createdAt,
        required this.body
      }
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      bulletinId: json["bulletinId"] as int,
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
                      Get.to(PostEditScreen(post: this, isEditing: true));
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