import 'dart:convert';
import 'dart:html';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class Post {

  final int id;
  final String title;
  final String writer;
  final String body;

  const Post(
      {
        required this.id,
        required this.title,
        required this.writer,
        required this.body
      }
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      title: json["title"] as String,
      writer: json["writer"] as String,
      body: json["body"] as String,
    );
  }

  Widget toPostScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BackButton(),
          Wrap(children: [const Text("제목"), Text(title)]),
          Wrap(children: [const Text("작성자"), Text(writer)]),
          Html(data: body),
        ],
      )
    );
  }

}

Future<List<Post>> fetchPostsInBulletin(int? bulletinId) async {
  var response = await http.get(
    StringUtils().stringToUri("/post", params: {'bulletinId': bulletinId}),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<Post>((json) => Post.fromJson(json)).toList();
}