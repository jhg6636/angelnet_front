import 'package:backoffice_front/models/common/bulletin.dart';
import 'package:backoffice_front/models/common/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class BulletinScreen extends StatelessWidget {

  const BulletinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAllBulletins(),
      builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
        if (snapshot.hasError) {
          return WidgetUtils.errorPadding;
        } else if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        } else {
          var children = snapshot.data?.map<Widget>((bulletin) => Text(bulletin.name)).toList() ?? List.empty();
          children.insert(0, const Text("전체"));
          return DefaultTabController(
              length: snapshot.data?.length ?? 1,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("게시판"),
                  bottom: TabBar(
                    tabs: children,
                  )
                ),
                body: FutureBuilder(
                  future: fetchAllPosts(),
                  builder: (BuildContext context2, AsyncSnapshot<List<Post>> snapshot2) {
                    if (snapshot2.hasError) {
                      return WidgetUtils.errorPadding;
                    } else if (snapshot2.hasData == false) {
                      return const CircularProgressIndicator();
                    } else {
                      var posts = snapshot2.data ?? List.empty();
                      var dataTables = <Widget>[];
                      snapshot.data?.forEach((bulletin) {
                        var postsInBulletin = posts.where((post) => post.bulletinId == bulletin.id);
                        if (postsInBulletin.isEmpty) {
                          dataTables.add(const Text("No Posts"));
                        } else {
                          var index = postsInBulletin.length;
                          dataTables.add(
                              DataTable(
                                  columns: const [
                                    DataColumn(label: Text("번호")),
                                    DataColumn(label: Text("제목")),
                                    DataColumn(label: Text("작성자")),
                                    DataColumn(label: Text("작성 일자")),
                                  ],
                                  rows: postsInBulletin.map((post) =>
                                      post.toDataRow(index--)
                                  ).toList()
                              )
                          );
                        }
                      });
                      return TabBarView(children: dataTables);
                    }
                  },
                ),
              )
          );
        }
      },
    );
  }

}