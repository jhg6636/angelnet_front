import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../models/admin/group.dart';
import '../../utils/WidgetUtils.dart';
import '../screen_frame.dart';

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
                    print(snapshot.error);
                    print(snapshot.stackTrace);
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
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _groupNameController,
                                  decoration: const InputDecoration(
                                    labelText: "그룹명",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                ButtonBar(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("취소하기")
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          var response = await makeGroup(_groupNameController.text);
                                          if (response.statusCode == 200) {
                                            Fluttertoast.showToast(msg: "그룹이 생성되었습니다.");
                                            Navigator.pop(context);
                                          } else {
                                            Fluttertoast.showToast(msg: "그룹이 생성되지 않았습니다. 관리자에게 문의해 주세요.");
                                          }
                                          print(response.body);
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