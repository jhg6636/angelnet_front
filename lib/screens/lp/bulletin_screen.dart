import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class BulletinScreen extends StatelessWidget {

  const BulletinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            const Text("게시판 목록", style: WidgetUtils.titleStyle),
            FutureBuilder(
                future: fetchAllBulletins(),
                builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
                  if (snapshot.hasError) {
                    return WidgetUtils.errorPadding;
                  } else if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return DataTable(
                        columns: const [
                          DataColumn(label: Text("게시판명")),
                          DataColumn(label: Text("게시글수")),
                        ],
                        rows: snapshot.data!.map<DataRow>((bulletin) =>
                            bulletin.toLpDataRow()
                        ).toList()
                    );
                  }
                }
            )
          ],
        ),
      ),
      isAdmin: false
    );
  }

}