import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';

class GroupMemberWidget extends StatefulWidget {
  const GroupMemberWidget({super.key});

  @override
  State<StatefulWidget> createState() => GroupMemberWidgetState();
}

class GroupMemberWidgetState extends State<GroupMemberWidget> {
  var isAdding = false;
  final searchOptions = ['전체', 'ID', '성명', '연락처'];
  var selectedSearchOption = '전체';
  final searchTextController = TextEditingController();

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
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: const Text(
                    "페이지",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.16,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                const Text(
                  "1",
                  style: TextStyle(
                    fontFamily: StringUtils.pretendard,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.16,
                    color: Color(0xff333333),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: const Text(
                      "/6",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    )),
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
                const Text(
                  "60",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.16,
                    color: Color(0xff333333),
                  ),
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
                }, // todo 그룹 생성 팝업
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
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
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
              rows: [
                for (int i = 0; i < 10; i++)
                  DataRow(
                    onSelectChanged: (value) {
                      setState(() {

                      });
                    },
                    cells: [
                      DataCell(Text((252 - i).toString())),
                      const DataCell(Text("일반회원")),
                      const DataCell(Text("홍길동")),
                      const DataCell(Text("abc1234")),
                      const DataCell(Text("010-1234-5667")),
                      const DataCell(Text("abdc@naver.com")),
                      const DataCell(Text("2023-08-18")),
                      DataCell(Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xfff5a9a9),
                          // border: Border.all(color: )
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          splashRadius: 18,
                          tooltip: "삭제",
                          onPressed: () {},
                          icon: const Icon(
                            Remix.subtract_line,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ])
            ]
          )
        )
      ],
    );
  }
}
