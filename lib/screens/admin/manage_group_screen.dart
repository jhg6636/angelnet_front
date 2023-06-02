import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/admin/group.dart';

class ManageGroupScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ManageGroupScreenState();

}

class ManageGroupScreenState extends State<ManageGroupScreen> {
  final _groupNameController = TextEditingController();

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
              ElevatedButton(
                  onPressed: () {
                    // TODO 그룹 추가하는 팝업/다이얼로그 등 연결
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                TextField(controller: _groupNameController,),
                                ButtonBar(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("취소하기")
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          // todo 그룹 추가하는 api
                                        },
                                        child: const Text("추가하기")
                                    )
                                  ],
                                )
                              ],
                            )
                          );
                    });
                  },
                  child: const Text("그룹 추가")
              )
            ],
          ),
        ),
        isAdmin: true
    );
  }

}