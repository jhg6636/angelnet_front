import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';
import '../../utils/custom_border_clipper.dart';
import '../../widgets/core/pagination.dart';

class BulletinScreen extends StatefulWidget {

  const BulletinScreen({super.key});

  @override
  State<StatefulWidget> createState() => BulletinScreenState();

}

class BulletinScreenState extends State<BulletinScreen> {
  var selectedMenu = '공지사항';
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("게시판", style: WidgetUtils.titleStyle),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMenu = '공지사항';
                        });
                      },
                      child: (selectedMenu == '공지사항')? ClipPath(
                          clipper: CustomBorderClipper(),
                          child: Container(
                              width: 640,
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(color: Color(0xff1173f9), width: 2),
                                    left: BorderSide(color: Color(0xff1173f9), width: 2),
                                    right: BorderSide(color: Color(0xff1173f9), width: 2),
                                  )
                              ),
                              child: const Center(
                                child: Text("공지사항",
                                  style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1173f9),
                                      letterSpacing: -0.17
                                  ),
                                ),
                              )
                          )
                      ) :
                      Container(
                          width: 640,
                          height: 62,
                          decoration: const BoxDecoration(
                              color: Color(0xfff9f9f9),
                              border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                          ),
                          child: const Center(
                            child: Text("공지사항",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff282728),
                                    letterSpacing: -0.17
                                )
                            ),
                          )
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMenu = '조합 게시판';
                        });
                      },
                      child: (selectedMenu == '조합 게시판')? ClipPath(
                          clipper: CustomBorderClipper(),
                          child: Container(
                              width: 640,
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(color: Color(0xff1173f9), width: 2),
                                    left: BorderSide(color: Color(0xff1173f9), width: 2),
                                    right: BorderSide(color: Color(0xff1173f9), width: 2),
                                  )
                              ),
                              child: const Center(
                                child: Text("조합 게시판",
                                  style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1173f9),
                                      letterSpacing: -0.17
                                  ),
                                ),
                              )
                          )
                      ) :
                      Container(
                          width: 640,
                          height: 62,
                          decoration: const BoxDecoration(
                              color: Color(0xfff9f9f9),
                              border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                          ),
                          child: const Center(
                            child: Text("조합 게시판",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff282728),
                                    letterSpacing: -0.17
                                )
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 38, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: const Text("페이지",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const Text("1",
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
                          child: const Text("/6",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          )
                      ),
                      const Text("총 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text("60",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text("건",
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
                  Row(
                    children: [
                      Container(
                          width: 320,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color(0xfff2f2f2),
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 29,
                                  child: TextField(
                                    controller: searchTextController,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                        hintText: "검색어를 입력하세요",
                                        hintStyle: TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff757575),
                                            letterSpacing: -0.16
                                        )
                                    ),
                                  )
                              ),
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
                                            image: AssetImage('lib/assets/images/search_icon.png'),
                                            fit: BoxFit.fill,
                                          )
                                      ),
                                    ),
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
            Container( // todo 공지사항 - 조합 게시판에 따라 내용물 다르게 보이게
                width: 1280,
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: DataTable(
                  // todo 정렬
                  // todo headingRow 아래 border 조정
                  // todo 이미지 있을 시 표시 / 새 글 표시
                  headingTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.16,
                    color: Color(0xff222222),
                  ),
                  dataTextStyle: const TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: -0.16,
                      color: Color(0xff757575)
                  ),
                  border: const TableBorder(
                    top: BorderSide(color: Color(0xff333333), width: 2),
                    bottom: BorderSide(color: Color(0xffe6e6e6)),
                    horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
                  ),
                  columns: const [
                    DataColumn(label: Center(child: Text("번호"))),
                    DataColumn(label: Center(child: Text("제목"))),
                    DataColumn(label: Center(child: Text("작성자"))),
                    DataColumn(label: Center(child: Text("작성일"))),
                    DataColumn(label: Center(child: Text("첨부파일"))),
                  ],
                  rows: const [
                    DataRow(
                        cells: [
                          DataCell(Text("101")),
                          DataCell(Text("홈페이지 이용과 관련하여 필수적인 공지사항을 안내드립니다.")),
                          DataCell(Text("관리자")),
                          DataCell(Text("2023-03-03")),
                          DataCell(Text("DOC")),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("101")),
                          DataCell(Text("인기있는 게시글 입니다.")),
                          DataCell(Text("최고관리자")),
                          DataCell(Text("2023-03-03")),
                          DataCell(Text("PDF")),
                        ]
                    )
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: pagination(4)
            )
          ],
        ),
      ),
      isAdmin: false,
      crumbs: const ["게시판"]
    );
  }
}