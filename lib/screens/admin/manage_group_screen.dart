import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/admin/group.dart';

class ManageGroupScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ManageGroupScreenState();

}

class ManageGroupScreenState extends State<ManageGroupScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              const Text(
                "그룹 관리",
                style: WidgetUtils.titleStyle,
              ),
              const SizedBox(height: 12.0,),
              FutureBuilder(
                future: fetchAllGroups(),
                builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
                  if (snapshot.hasError) {
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    return makeDataTable(snapshot.data ?? List.empty());
                  }
                }
              ),
            ],
          ),
        ),
        isAdmin: true
    );
  }

}