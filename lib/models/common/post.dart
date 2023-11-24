import 'dart:convert';

import 'package:angelnet/screens/post/post_view_screen.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../screens/post/post_edit_screen.dart';
import '../../screens/screen_frame.dart';
import '../../utils/StringUtils.dart';

class Post {

  final int id;
  // final int? fundId;
  final String? fundName;
  final String title;
  final String writer;
  final DateTime createdAt;
  final String body;
  final int viewCount;

  const Post(
      {
        required this.id,
        // required this.fundId,
        required this.fundName,
        required this.title,
        required this.writer,
        required this.createdAt,
        required this.body,
        required this.viewCount
      }
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      // fundId: json["bulletinId"] as int,
      fundName: json["fundName"],
      title: json["title"],
      writer: json["writer"],
      createdAt: DateTime(json['createdAt'][0], json['createdAt'][1], json['createdAt'][2], ),
      body: json["body"],
      viewCount: json["viewCount"] as int,
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

  DataRow toDataRow(bool needFundColumn, bool isAdmin, int index) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      if (needFundColumn) DataCell(Text(fundName ?? "")),
      DataCell(TextButton(
        style: TextButton.styleFrom(
          // backgroundColor: const Color(0xff444444),
          foregroundColor: const Color(0xff444444),
          textStyle: const TextStyle(
            color: Color(0xff444444),
            decoration: TextDecoration.underline,
          )
        ),
        onPressed: () { Get.to(PostViewScreen(post: this, isAdmin: isAdmin,)); },
        child: Text(title),
      )),
      DataCell(Text(writer)),
      DataCell(Text(DateFormat('yyyy-MM-dd').format(createdAt))),
      DataCell(Text(viewCount.toString()))
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
                    Get.to(PostEditScreen(isEditing: true, post: this,));
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

Future<http.Response> makePost(String? fundName, String title, String body) async {
  return await http.post(
    StringUtils().stringToUri('post'),
    headers: await StringUtils().header(),
    body: jsonEncode({'fundName': fundName, 'title': title, 'body': body})
  );
}

Future<http.Response> editPost(int id, String? fundName, String title, String body) async {
  return await http.put(
      StringUtils().stringToUri('post'),
      headers: await StringUtils().header(),
      body: jsonEncode({'id': id, 'fundName': fundName, 'title': title, 'body': body})
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

Future<List<Post>> fetchPostsByLpId(int lpId) async {
  var response = await http.get(
    StringUtils().stringToUri('post/lp', params: {'lpId': lpId.toString()},),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
}