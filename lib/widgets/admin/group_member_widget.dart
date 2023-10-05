import 'package:angelnet/models/admin/group.dart';
import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/pagination.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';

class GroupMemberWidget extends StatefulWidget {
  final Group group;

  const GroupMemberWidget({super.key, required this.group});

  @override
  State<StatefulWidget> createState() => GroupMemberWidgetState();
}

class GroupMemberWidgetState extends State<GroupMemberWidget> {
  var isAdding = false;
  final searchOptions = ['전체', 'ID', '성명', '연락처'];
  var selectedSearchOption = '전체';
  final searchTextController = TextEditingController();
  var selectedMap = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("회원목록", style: WidgetUtils.h1Style),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
          color: const Color(0xfff7faff),
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 120,
                  height: 42,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.16,
                      color: Color(0xff333333),
                    ),
                    value: selectedSearchOption,
                    items: searchOptions
                        .map<DropdownMenuItem<String>>((value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (String? value) => setState(() {
                      selectedSearchOption = value ?? "전체";
                    }),
                  ))),
              Container(
                  width: 320,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 29,
                          child: TextField(
                            controller: searchTextController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: "검색어를 입력하세요",
                                hintStyle: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff757575),
                                    letterSpacing: -0.16)),
                          )),
                      Flexible(
                          flex: 3,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 9.69, 0),
                              width: 20.31,
                              height: 20.31,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/search_icon.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                          ))
                    ],
                  ))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "총 ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.16,
                    color: Color(0xff333333),
                  ),
                ),
                FutureBuilder(
                  future: fetchUsersInGroup(widget.group.id),
                  builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.hasError) {
                      StringUtils().printError(snapshot);
                      return const Text(
                        "0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      );
                    } else {
                      return Text((snapshot.data?.length ?? 0).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      );
                    }
                  }
                ),
                const Text(
                  "건",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.16,
                    color: Color(0xff333333),
                  ),
                )
              ],
            ),
            if (!isAdding) OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Color(0xffcccccc)),
                    ),
                    padding: const EdgeInsets.fromLTRB(28, 10, 27, 10),
                    fixedSize: const Size(127, 36)),
                onPressed: () {
                  setState(() {
                    isAdding = true;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: const Icon(
                        Remix.user_add_line,
                        size: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    const Text(
                      "회원 추가",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.14,
                          color: Color(0xff333333)),
                    )
                  ],
                ))
          ],
        ),
        FutureBuilder(
          future: fetchUsersInGroup(widget.group.id),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasError) {
              StringUtils().printError(snapshot);
              return const CircularProgressIndicator();
            } else if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              var members = snapshot.data ?? [];
              if (members.isEmpty) {
                return const Center(
                  child: Text("그룹에 멤버가 없습니다.",
                    style: WidgetUtils.dataTableDataStyle,
                  )
                );
              } else {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 31),
                    width: 1280,
                    child: DataTable(
                        showCheckboxColumn: isAdding,
                        headingTextStyle: WidgetUtils.dataTableHeadStyle,
                        dataTextStyle: WidgetUtils.dataTableDataStyle,
                        border: WidgetUtils.tableBorder,
                        dataRowMinHeight: 62,
                        dataRowMaxHeight: 62,
                        columns: const [
                          DataColumn(label: Text("번호")),
                          DataColumn(label: Text("회원등급")),
                          DataColumn(label: Text("성명")),
                          DataColumn(label: Text("ID")),
                          DataColumn(label: Text("연락처")),
                          DataColumn(label: Text("이메일")),
                          DataColumn(label: Text("가입일")),
                          DataColumn(label: Text("기능")),
                        ],
                        rows: members.indexed.map((e) => e.$2.toGroupMemberDataRow(
                          context, members.length - e.$1, widget.group.id
                        )).toList()
                    )
                );
              }
            }
          }
        ),
        if (isAdding) Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: WidgetUtils().buttonBar(
            "취소",
            "저장",
            () {
              setState(() {
                isAdding = false;
              });
            },
            () => null
          ),
        )
      ],
    );
  }
}
