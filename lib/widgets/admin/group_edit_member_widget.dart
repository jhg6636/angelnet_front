import 'dart:convert';

import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../models/admin/group.dart';
import '../../models/common/user.dart';

class GroupEditMemberWidget extends StatefulWidget {

  final int groupId;

  const GroupEditMemberWidget({super.key, required this.groupId});

  @override
  State<StatefulWidget> createState() => GroupEditMemberWidgetState();

}

class GroupEditMemberWidgetState extends State<GroupEditMemberWidget> {
  List<User> addingMembers = [];
  late Future<List<User>> users;

  @override
  Widget build(BuildContext context) {
    users = fetchUsers();
    TextEditingController nameController = TextEditingController();
    TextEditingController stringIdController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          ButtonBar(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("취소하기")
              ),
              ElevatedButton(
                onPressed: () async {
                  var memberResponse = await fetchUsersInGroup(widget.groupId);
                  print(addingMembers
                      .where((user) => !user.isContainedIn(memberResponse))
                      .map<String>((user) => user.stringId).toList());
                  var response = await addGroupMember(
                      widget.groupId,
                      addingMembers
                        .where((user) => !user.isContainedIn(memberResponse))
                        .map<String>((user) => user.stringId).toList()
                  );
                  if (response.statusCode == 200) {
                    Fluttertoast.showToast(msg: "멤버가 추가되었습니다.");
                    Navigator.pop(context);
                  } else if (jsonDecode(response.body)["exception"] == "org.springframework.dao.DataIntegrityViolationException") {
                    Fluttertoast.showToast(msg: "이미 그룹에 존재하는 멤버가 있습니다. 해당 멤버를 제외하고 멤버를 다시 추가해 주세요.", timeInSecForIosWeb: 5);
                  } else {
                    print(response.body);
                    Fluttertoast.showToast(msg: "오류가 발생했습니다. 관리자에게 문의해주세요.");
                  }
                },
                child: const Text("저장하기")
              ),
            ],
          ),
          const Text("추가할 멤버", style: WidgetUtils.h1Deprecated),
          DataTable(
            columns: const [
              DataColumn(label: Text("이름")),
              DataColumn(label: Text("아이디")),
              DataColumn(label: Text("연락처")),
              DataColumn(label: Text("메일")),
              DataColumn(label: Text("취소")),
            ],
            rows: addingMembers.map<DataRow>((member) => DataRow(
              cells: [
                DataCell(Text(member.name)),
                DataCell(Text(member.stringId)),
                DataCell(Text(member.phone)),
                DataCell(Text(member.email)),
                DataCell(OutlinedButton(
                    onPressed: () {
                      addingMembers.remove(member);
                      setState(() {});
                    },
                    child: const Text("취소")
                ))
              ]
            )).toList()
          ),
          const Text("멤버 선택", style: WidgetUtils.h1Deprecated),
          FutureBuilder(
            future: users,
            builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                print(snapshot.stackTrace);
                return WidgetUtils.errorPadding;
              } else if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return DataTable(
                  columns: const [
                    DataColumn(label: Text("추가")),
                    DataColumn(label: Text("이름")),
                    DataColumn(label: Text("아이디")),
                    DataColumn(label: Text("연락처")),
                    DataColumn(label: Text("메일")),
                  ],
                  rows: snapshot.data!.map<DataRow>((user) {
                    return DataRow(
                        cells: [
                          DataCell(OutlinedButton(
                            onPressed: () {
                              if (!user.isContainedIn(addingMembers)) {
                                addingMembers.add(user);
                              }
                              setState(() {});
                            },
                            child: const Text("추가"),
                          )),
                          DataCell(Text(user.name)),
                          DataCell(Text(user.stringId)),
                          DataCell(Text(user.phone)),
                          DataCell(Text(user.email)),
                        ]
                    );
                  }).toList(),
                );
              }
            }
          ),
        ],
      ),
    );
  }

}