import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/html_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/common/post.dart';

class PostEditScreen extends StatefulWidget {

  final Post? post;
  final bool isEditing;

  const PostEditScreen({super.key, required this.isEditing, this.post});

  @override
  State<StatefulWidget> createState() => PostEditScreenState();

}

class PostEditScreenState extends State<PostEditScreen> {

  late TextEditingController titleController = TextEditingController(text: widget.post?.title);
  late HtmlEditor htmlEditor = HtmlEditor(body: widget.post?.body,);
  Future<List<Bulletin>> bulletins = fetchAllBulletins();
  Bulletin? selectedBulletin = null;

  @override
  Widget build(BuildContext context) {
    print(widget.post?.body);
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("취소하기")
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (widget.isEditing) {

                          } else {
                            await makePost(selectedBulletin!.id, titleController.text, htmlEditor.controller.document.toPlainText());
                            Get.back();
                          }
                        },
                        child: const Text("저장하기")
                    )
                  ],
                ),
                const Text("게시판 선택"),
                FutureBuilder(
                  future: bulletins,
                  builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
                    if (snapshot.hasError) {
                      return WidgetUtils.errorPadding;
                    } else if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return DropdownButton(
                        value: selectedBulletin,
                        items: snapshot.data!.map<DropdownMenuItem>((bulletin) =>
                          DropdownMenuItem(
                            value: bulletin,
                            child: Text(bulletin.name)
                          )
                        ).toList(),
                        onChanged: (value) {
                          selectedBulletin = value;
                          setState(() {});
                        }
                      );
                    }
                  }
                )
              ],
            ),
            Wrap(
              children: [
                const Text("제목"),
                TextField(controller: titleController,)
              ],
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
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
          ],
        ),
      ),
      isAdmin: true
    );
  }

}