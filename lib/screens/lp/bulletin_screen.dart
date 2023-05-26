import 'package:backoffice_front/models/common/bulletin.dart';
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
          return TabBarView(
            children: children,

          );
        }
      },
    );
  }

}