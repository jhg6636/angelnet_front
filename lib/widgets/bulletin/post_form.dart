import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/bulletin/bulletin.dart';
import '../../models/common/post.dart';

class PostForm extends StatefulWidget {

  Bulletin? bulletin;
  final Post? post;

  PostForm({super.key, this.bulletin, this.post});

  @override
  State<StatefulWidget> createState() => PostFormState();

}

class PostFormState extends State<PostForm> {

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: widget.post?.title);
    final bodyController = TextEditingController(text: widget.post?.body);
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                const Text("선택된 게시판"),
                const SizedBox(width: 8.0,),
                Text(widget.bulletin?.name ?? "-"),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: fetchAllBulletins(),
                                builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
                                  if (snapshot.hasError) {
                                    return WidgetUtils.errorPadding;
                                  } else if (!snapshot.hasData) {
                                    return const CircularProgressIndicator();
                                  }
                                  return DataTable(
                                    columns: const [
                                      DataColumn(label: Text("게시판명")),
                                      DataColumn(label: Text("선택")),
                                    ],
                                    rows: snapshot.data!.map<DataRow>((bulletin) => DataRow(
                                      cells: [
                                        DataCell(Text(bulletin.name)),
                                        DataCell(FilledButton(
                                          onPressed: () {
                                            widget.bulletin = bulletin;
                                            Navigator.pop(context);
                                          },
                                          child: const Text("선택"),
                                        ))
                                      ]
                                    )).toList(),
                                  );
                                }
                              )
                            ],
                          ),
                        );
                      }
                    );
                  },
                  child: const Text("선택하기")
                )
              ],
            ),
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
            ),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    // todo 한 번 더 확인 팝업
                    Get.back();
                  },
                  child: const Text("취소하기")
                ),
                FilledButton(
                  onPressed: () {
                    if (widget.post != null) {
                      // todo POST API
                    } else {
                      // todo PUT API
                    }
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