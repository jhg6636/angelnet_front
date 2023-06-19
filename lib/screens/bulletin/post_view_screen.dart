import 'package:backoffice_front/screens/common/not_developed_screen.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../models/common/post.dart';

class PostViewScreen extends StatelessWidget {

  final String bulletinName;
  final Post post;
  final bool isAdmin;

  const PostViewScreen({
    super.key,
    required this.bulletinName,
    required this.post,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            Text("$bulletinName 게시판"),
            Wrap(children: [
              const Text("제목"),
              Text(post.title),
            ],),
            Wrap(children: [
              const Text("작성자"),
              Text(post.writer),
            ],),
            Wrap(children: [
              const Text("작성일시"),
              Text(post.createdAt.toString()),
            ],),
            Wrap(children: [
              const Text("본문"),
              Html(data: post.body,)
            ],),
            FilledButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("뒤로 가기")
            ),
            if (isAdmin) ElevatedButton(
              onPressed: () {
                Get.to(NotDevelopedScreen(isAdmin: isAdmin));
              },
              child: const Text("수정하기")
            )
          ],
        ),
      ),
      isAdmin: isAdmin
    );
  }

}