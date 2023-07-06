import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/common/user.dart';

class GroupEditMemberWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GroupEditMemberWidgetState();

}

class GroupEditMemberWidgetState extends State<GroupEditMemberWidget> {
  List<User> addingMembers = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("추가할 멤버", style: WidgetUtils.h1),
          DataTable(
            columns: const [
              DataColumn(label: Text("이름")),
              DataColumn(label: Text("아이디")),
              DataColumn(label: Text("연락처")),
              DataColumn(label: Text("메일")),
              DataColumn(label: Text("제거")),
            ],
            rows: addingMembers.map<DataRow>((member) => member.toGroupMemberDataRow()).toList()
          ),

        ],
      ),
    );
  }

}