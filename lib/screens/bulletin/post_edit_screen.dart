import 'package:backoffice_front/models/common/user.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/admin/html_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/common/post.dart';

class PostEditScreen extends StatefulWidget {

  Post? post;
  bool isEditing;

  PostEditScreen({super.key, required this.isEditing, this.post});

  @override
  State<StatefulWidget> createState() => PostEditScreenState();

}

class PostEditScreenState extends State<PostEditScreen> {

  TextEditingController titleController = TextEditingController();
  HtmlEditor htmlEditor = HtmlEditor();

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            // todo 게시판 선택 dropdown, 제목, 작성자 (자동 생성), 본문
            Wrap(
              children: [
                const Text("게시판 선택"),
                DropdownButton(items: [], onChanged: (item) {})
              ],
            ),
            Wrap(
              children: [
                const Text("제목"),
                TextField(controller: titleController,)
              ],
            ),
            Wrap(
              children: [
                const Text("작성자"),
                FutureBuilder(
                  future: getMyInfo(),
                  builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    if (snapshot.hasError) {
                      return WidgetUtils.errorPadding;
                    } else if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return Text(snapshot.data!['name']);
                    }
                  }
                )
              ],
            ),
            htmlEditor,
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("취소하기")
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("저장하기")
                )
              ],
            )
          ],
        ),
      ),
      isAdmin: true
    );
  }

}