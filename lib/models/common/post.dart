import 'dart:convert';
import 'dart:html';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
      createdAt: json["createdAt"] as DateTime,
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

  DataRow toDataRow(int index) {
    return DataRow(cells: [
      DataCell(Text(index as String)),
      DataCell(TextButton(onPressed: () { Get.to(toPostScreen()); }, child: Text(title),)),
      DataCell(Text(writer)),
      DataCell(Text(createdAt as String)),
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