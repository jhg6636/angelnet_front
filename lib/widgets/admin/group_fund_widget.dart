import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';
import '../core/pagination.dart';

class GroupFundWidget extends StatefulWidget {

  const GroupFundWidget({super.key});

  @override
  State<StatefulWidget> createState() => GroupFundWidgetState();

}

class GroupFundWidgetState extends State<GroupFundWidget> {

  final searchOptions = ['전체', '조합명', '투자종목'];
  var selectedSearchOption = '전체';
  var isAdding = false;
  final searchTextController = TextEditingController();
  static const statusTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.45,
      color: Colors.white
  );
  var selectedMap = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("조합 목록", style: WidgetUtils.h1Style,),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
          color: const Color(0xfff7faff),
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
        Container(
          alignment: Alignment.centerRight,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xffcccccc)),
                  ),
                  padding: const EdgeInsets.fromLTRB(17, 10, 11, 10),
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
                      Remix.file_add_line,
                      size: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const Text(
                    "노출 조합 추가",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.14,
                        color: Color(0xff333333)),
                  )
                ],
              )),
        ),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 31),
          child: DataTable(
              showCheckboxColumn: isAdding,
              border: const TableBorder(
                  top: BorderSide(color: Color(0xff333333), width: 2),
                  horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
                  bottom: BorderSide(color: Color(0xffe6e6e6))
              ),
              headingTextStyle: WidgetUtils.dataTableHeadStyle,
              dataTextStyle: WidgetUtils.dataTableDataStyle,
              dataRowMinHeight: 62,
              dataRowMaxHeight: 62,
              columns: const [
                DataColumn(label: Text("번호")),
                DataColumn(label: Text("조합명")),
                DataColumn(label: Text("투자종목")),
                DataColumn(label: Text("담당자")),
                DataColumn(label: Text("참여인원")),
                DataColumn(label: Text("진행상태")),
                DataColumn(label: Text("기능")),
              ],
              rows: [
                DataRow(
                  selected: selectedMap[0] ?? false,
                  onSelectChanged: (value) {
                    setState(() {
                      selectedMap[0] = value ?? false;
                    });
                  },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("183")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff43a3d6),
                    child: const Text("서류접수중", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
                DataRow(
                    selected: selectedMap[1] ?? false,
                    onSelectChanged: (value) {
                      setState(() {
                        selectedMap[1] = value ?? false;
                      });
                    },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("289")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff8f40de),
                    child: const Text("조합검토기간", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
                DataRow(
                    selected: selectedMap[2] ?? false,
                    onSelectChanged: (value) {
                      setState(() {
                        selectedMap[2] = value ?? false;
                      });
                    },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("183")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff323c4e),
                    child: const Text("해산", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
                DataRow(
                    selected: selectedMap[3] ?? false,
                    onSelectChanged: (value) {
                      setState(() {
                        selectedMap[3] = value ?? false;
                      });
                    },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("183")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff002997),
                    child: const Text("주금납입", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
                DataRow(
                    selected: selectedMap[4] ?? false,
                    onSelectChanged: (value) {
                      setState(() {
                        selectedMap[4] = value ?? false;
                      });
                    },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("183")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff0361f9),
                    child: const Text("참여신청", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
                DataRow(
                    selected: selectedMap[5] ?? false,
                    onSelectChanged: (value) {
                      setState(() {
                        selectedMap[5] = value ?? false;
                      });
                    },
                    cells: [
                  const DataCell(Text("101")),
                  const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                  const DataCell(Text("소부장")),
                  const DataCell(Text("리벤처스")),
                  const DataCell(Text("183")),
                  DataCell(Container(
                    alignment: Alignment.center,
                    width: 84,
                    height: 28,
                    color: const Color(0xff04b45f),
                    child: const Text("운용중", style: statusTextStyle,),
                  )),
                  DataCell(Row(
                    children: [
                      Container(
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
                          icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
                ]),
              ]
          ),
        ),
        pagination(1),
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