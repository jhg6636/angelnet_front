import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/screens/bulletin/post_edit_screen.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/WidgetUtils.dart';
import '../../utils/custom_border_clipper.dart';
import '../../widgets/core/pagination.dart';

class ManagePostScreen extends StatefulWidget {

  final bool isAdmin;
  const ManagePostScreen({super.key, required this.isAdmin});

  @override
  State<StatefulWidget> createState() => ManagePostScreenState();

}

class ManagePostScreenState extends State<ManagePostScreen> {
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("총 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                      Text("60",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                      Text("건",
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
                      ),
                      if (widget.isAdmin) Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Color(0xffcccccc)),
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                          onPressed: () {
                            Get.to(const PostEditScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: const Icon(Remix.edit_line, size: 16, color: Color(0xff333333),),
                                ),
                                const Text("게시글 등록",
                                  style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.14,
                                      color: Color(0xff333333)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container( // todo 공지사항 - 조합 게시판에 따라 내용물 다르게 보이게
                width: 1280,
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: FutureBuilder(
                  future: (selectedMenu == '공지사항')? fetchAllPosts() : fetchAllPosts(),
                  builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      StringUtils().printError(snapshot);
                      return const Center(child: Text("공지사항이 없습니다.", style: WidgetUtils.dataTableDataStyle,),);
                    } else {
                      DataTable(
                          headingTextStyle: WidgetUtils.dataTableHeadStyle,
                          dataTextStyle: WidgetUtils.dataTableDataStyle,
                          border: const TableBorder(
                            top: BorderSide(color: Color(0xff333333), width: 2),
                            bottom: BorderSide(color: Color(0xffe6e6e6)),
                            horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
                          ),
                          columns: [
                            const DataColumn(label: Center(child: Text("번호"))),
                            if (selectedMenu == '조합 게시판') const DataColumn(label: Center(child: Text("조합명"),)),
                            const DataColumn(label: Center(child: Text("제목"))),
                            const DataColumn(label: Center(child: Text("작성자"))),
                            const DataColumn(label: Center(child: Text("작성일"))),
                            if (widget.isAdmin) const DataColumn(label: Center(child: Text("기능"))),
                          ],
                          rows: snapshot.data!
                              .where((post) => (post.fundId == null && selectedMenu == '공지사항') || post.fundId != null && selectedMenu == '조합 게시판')
                              .indexed
                              .map((e) => e.$2.toDataRow(widget.isAdmin))
                              .toList() // todo 수정
                      )
                    }
                  },
                )
            ),
          ],
        ),
      ),
      isAdmin: widget.isAdmin,
      crumbs: const ["게시판"]
    );
  }
}