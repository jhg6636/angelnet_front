import 'package:backoffice_front/models/bulletin/bulletin.dart';
import 'package:backoffice_front/screens/bulletin/post_edit_screen.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/common/post.dart';

class BulletinDetailScreen extends StatefulWidget {

  final Bulletin bulletin;

  const BulletinDetailScreen({super.key, required this.bulletin});

  @override
  State<StatefulWidget> createState() => BulletinDetailScreenState();

}

class BulletinDetailScreenState extends State<BulletinDetailScreen> {

  late bool isOpened = widget.bulletin.isOpened;

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.bulletin.name, style: WidgetUtils.titleStyle,),
            Wrap(
              children: [
                const Text("게시판 개방 상태"),
                Switch(value: isOpened, onChanged: (value) async {
                  // todo await changeIsOpened(widget.bulletin, value);
                  setState(() {
                    isOpened = value;
                  });
                })
              ],
            ),
            const Text("게시글 목록", style: WidgetUtils.h1,),
            FilledButton(
              onPressed: () {
                Get.to(PostEditScreen(isEditing: false,));
              },
              child: const Text("작성하기")
            ),
            FutureBuilder(
              future: fetchPostsInBulletin(widget.bulletin.id),
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  print(snapshot.stackTrace);
                  return WidgetUtils.errorPadding;
                } else if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("제목")),
                      DataColumn(label: Text("작성자")),
                      DataColumn(label: Text("작성일시")),
                    ],
                    rows: snapshot.data!.map<DataRow>((post) => post.toDataRow()).toList(),
                  );
                }
              }
            )
          ],
        ),
      ),
      isAdmin: true
    );
  }

}