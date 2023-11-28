import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/models/lp/limited_partner.dart';
import 'package:angelnet/screens/lp/document_lp_screen.dart';
import 'package:angelnet/screens/notification/notification_screen.dart';
import 'package:angelnet/screens/post/manage_post_screen.dart';
import 'package:angelnet/screens/user/edit_user_info_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund.dart';
import '../screen_frame_v2.dart';

class LpMyPage extends StatefulWidget {

  final User user;

  const LpMyPage({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => LpMyPageState();
}

class LpMyPageState extends State<LpMyPage> {
  var totalCost = 0;

  @override
  Widget build(BuildContext context) {
    var topBox = Container(
      padding: const EdgeInsets.fromLTRB(54.0, 0, 38.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.user.name,
                style: const TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const Text(" 님",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: StringUtils.pretendard,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0x33000000),
                    foregroundColor: const Color(0x33000000),
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    fixedSize: const Size(96, 40)
                  ),
                  onPressed: () {
                    Get.to(LpDocumentScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                        child: const Icon(Remix.sticky_note_line, size: 16, color: Colors.white,),
                      ),
                      const Text("서류제출",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                child: FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(0x33000000),
                        foregroundColor: const Color(0x33000000),
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        fixedSize: const Size(96, 40)
                    ),
                    onPressed: () {
                      Get.to(EditUserInfoScreen(user: widget.user));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                          child: const Icon(Remix.user_3_line, size: 16, color: Colors.white,),
                        ),
                        const Text("회원정보",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: IconButton(
                    onPressed: () {
                      Get.to(const NotificationScreen(isAdmin: false));
                    },
                    icon: const Badge(
                      backgroundColor: Colors.transparent,
                      offset: Offset(9, -9),
                      label: Icon(Icons.circle, size: 6, color: Colors.white,),
                      child: Icon(Remix.notification_2_line, size: 24, color: Colors.white,),
                    )
                ),
              )
            ],
          )
        ],
      )
    );

    return ScreenFrameV2(
        main: Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("마이페이지",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: StringUtils.pretendard,
                  color: Color(0xff111111)
                )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 29, 0, 0),
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  gradient: const LinearGradient(
                    colors: [Color(0xff00ade2), Color(0xff006ce8)],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: topBox,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("참여중인 조합",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.2,
                        color: Color(0xff333333),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: const Text("조합명 클릭 시, 참여중인 조합의 상세페이지로 이동할 수 있습니다.",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: -0.15,
                          color: Color(0xff555555),
                        ),
                      )
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: fetchMine(),
                builder: (BuildContext context, AsyncSnapshot<List<LimitedPartner>> snapshot) {
                  if (snapshot.hasError) {
                    StringUtils().printError(snapshot);
                    return Container(
                      margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  } else {
                    for (var fund in snapshot.data!) {
                      totalCost += fund.cost;
                    }
                    return Container(
                      width: 1280,
                      margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 1280,
                            child: DataTable(
                                headingTextStyle: WidgetUtils.dataTableHeadStyle,
                                dataTextStyle: WidgetUtils.dataTableDataStyle,
                                border: const TableBorder(
                                  top: BorderSide(color: Color(0xff333333), width: 2),
                                  bottom: BorderSide(color: Color(0xffe6e6e6)),
                                  horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
                                ),
                                columns: const [
                                  DataColumn(label: Center(child: Text("번호"))),
                                  DataColumn(label: Center(child: Text("조합명"))),
                                  DataColumn(label: Center(child: Text("투자기업"))),
                                  DataColumn(label: Center(child: Text("참여금액"))),
                                  DataColumn(label: Center(child: Text("결성일"))),
                                  DataColumn(label: Center(child: Text("조합상태"))),
                                ],
                                rows: snapshot.data!.indexed.map((e) => e.$2.toLpMyPageRow(e.$1 + 1)).toList()
                            ),
                          ),
                          Container(
                            height: 83,
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: DottedBorder(
                                color: const Color(0xffb5becc),
                                radius: const Radius.circular(5),
                                dashPattern: const [3, 3],
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 27,
                                        height: 27,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff00958f),
                                        ),
                                        child: const Icon(Remix.check_fill, size: 18, color: Colors.white,),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                        child: const Text("참여금액 합계",
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: StringUtils.pretendard,
                                            color: Color(0xff333333),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                        child: const Text("|",
                                          style: TextStyle(color: Color(0x4d707070), fontSize: 10),
                                        ),
                                      ),
                                      Text(StringUtils().currencyFormat(totalCost),
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: StringUtils.pretendard,
                                            color: Color(0xff333333)
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("공지사항",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: -0.2,
                              color: Color(0xff333333)
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          child: const Text("엔젤넷과 참여하고 있는 조합의 최신 공지사항입니다.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555),
                            ),
                          ),
                        )
                      ],
                    ),
                    WidgetUtils.moreButton(() {
                      Get.to(const ManagePostScreen(isAdmin: false));
                    })
                  ],
                ),
              ),
              Container(
                  width: 1280,
                  margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: FutureBuilder(
                    future: fetchAllPosts(),
                    builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return const Center(
                          child: Text("공지사항이 없습니다.", style: WidgetUtils.dataTableDataStyle,),
                        );
                      } else {
                        var data = snapshot.data!.where((post) => post.fundName == null);
                        return DataTable(
                          // todo 가운데정렬
                          // todo headingRow 아래 border 조정
                          headingTextStyle: WidgetUtils.dataTableHeadStyle,
                          dataTextStyle: WidgetUtils.dataTableDataStyle,
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
                            DataColumn(label: Center(child: Text("조회수"))),
                          ],
                          rows: data.indexed
                          .map((e) => e.$2.toDataRow(false, false, data.length - e.$1)).toList(),
                        );
                      }
                    },
                  )
              ),
            ],
          ),
        ),
        isAdmin: false, crumbs: const ["마이페이지"],
    );
  }
}

DataRow toMyPageRow(int index, Fund fund) {
  return DataRow(cells: [
    DataCell(Text(index.toString())),
    DataCell(Text(fund.name)),
    DataCell(Text(fund.startupName)),
    DataCell(Text(fund.cost.toString())),
    DataCell(Text(fund.startAt.toString())),
    DataCell(Text(fund.dissolvedAt.toString() ?? "")),
    DataCell(Text(fund.margin.toString() ?? "")),
    const DataCell(Text(""))
  ]);
}