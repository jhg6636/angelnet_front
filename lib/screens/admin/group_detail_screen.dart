import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/admin/group.dart';
import '../../models/common/user.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/admin/group_edit_member_widget.dart';
import '../screen_frame.dart';

class GroupDetailScreen extends StatefulWidget {

  final Group group;

  const GroupDetailScreen({super.key, required this.group});

  @override
  State<StatefulWidget> createState() => GroupDetailScreenState();

}

class GroupDetailScreenState extends State<GroupDetailScreen> {

  late Future<List<User>> users;

  @override
  Widget build(BuildContext context) {
    users = fetchUsersInGroup(widget.group.id);

    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text("${widget.group.name} 그룹", style: WidgetUtils.titleStyle,),
                  ButtonBar(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          deleteGroup(widget.group.id);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("그룹 삭제"),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          TextEditingController nameController = TextEditingController();
                        // TODO 변경 팝업 -> API 연결
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(labelText: "그룹명"),
                                    ),
                                    FilledButton(
                                      onPressed: () {

                                      },
                                      child: const Text("변경하기")
                                    )
                                  ],
                                );
                              }
                          );
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("그룹명 변경")
                      )
                    ],
                  )
                ],
              ),
              Wrap(
                children: [
                  const Text("멤버 보기", style: WidgetUtils.h1Deprecated,),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return SingleChildScrollView(
                          child: GroupEditMemberWidget(groupId: widget.group.id),
                        );
                      });
                    },
                    child: const Text("멤버 편집")
                  )
                ],
              ),
              FutureBuilder(
                future: users,
                builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    return makeGroupMemberDataTable(snapshot.data ?? List.empty());
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