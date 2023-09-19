import 'package:angelnet/screens/bulletin/post_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/bulletin/bulletin.dart';
import '../../models/common/post.dart';
import '../../utils/WidgetUtils.dart';
import '../screen_frame.dart';

class BulletinDetailScreen extends StatefulWidget {

  final Bulletin bulletin;
  final bool isAdmin;

  const BulletinDetailScreen({super.key, required this.bulletin, required this.isAdmin});

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
            if (widget.isAdmin) Wrap(
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
            const Text("게시글 목록", style: WidgetUtils.h1Deprecated,),
            if (widget.isAdmin) FilledButton(
              onPressed: () {
                Get.to(const PostEditScreen());
                // Get.to(const PostEditScreen(isEditing: false,));
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
                    rows: snapshot.data!.map<DataRow>((post) => post.toDataRow(widget.isAdmin)).toList(),
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