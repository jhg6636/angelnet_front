import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/common/post.dart';

class PostForm extends StatefulWidget {

  final int bulletinId;
  final Post? post;

  const PostForm({super.key, required this.bulletinId, this.post});

  @override
  State<StatefulWidget> createState() => PostFormState();

}

class PostFormState extends State<PostForm> {

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "제목",
                border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  labelText: "내용",
                  border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
      isAdmin: true
    );
  }

}