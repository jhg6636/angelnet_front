import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/admin/group.dart';
import '../../models/common/user.dart';
import '../../utils/WidgetUtils.dart';

class GroupDetailScreen extends StatefulWidget {

  final Group group;

  const GroupDetailScreen({super.key, required this.group});

  @override
  State<StatefulWidget> createState() => GroupDetailScreenState();

}

class GroupDetailScreenState extends State<GroupDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Text(widget.group.name),
                  ButtonBar(
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                        // TODO 확인용 팝업 -> 그룹 삭제하는 API 연결
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("그룹 삭제"),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                        // TODO 변경 팝업 -> API 연결
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
                  const Text("멤버 보기"),
                  ElevatedButton(
                      onPressed: () {
                        // todo 그룹에 멤버 추가하는 기능
                      },
                      child: const Text("멤버 추가")
                  )
                ],
              ),
              FutureBuilder(
                  future: fetchUsersInGroup(widget.group.id),
                  builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.hasError) {
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