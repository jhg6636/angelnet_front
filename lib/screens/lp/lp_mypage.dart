import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/models/lp/limited_partner.dart';
import 'package:angelnet/screens/not_developed_screen.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/lp/fund_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund.dart';
import '../../widgets/lp/lp_my_page_state.dart';
import '../screen_frame_v2.dart';
import 'funding_fund_screen.dart';

class LpMyPage extends StatefulWidget {

  final User user;

  const LpMyPage({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => LpMyPageState();
}

class LpMyPageState extends State<LpMyPage> {
  Future<List<Fund>> funds = fetchMyFunds();

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
                  onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    // todo 회전 적용
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
              Container(
                  width: 1280,
                  margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: DataTable(
                    // todo 가운데정렬
                    // todo headingRow 아래 border 조정
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
                      DataColumn(label: Center(child: Text("조합명"))),
                      DataColumn(label: Center(child: Text("투자기업"))),
                      DataColumn(label: Center(child: Text("참여금액"))),
                      DataColumn(label: Center(child: Text("결성일"))),
                      DataColumn(label: Center(child: Text("진행상태"))),
                    ],
                    rows: const [
                      DataRow(
                          cells: [
                            DataCell(Text("1")),
                            DataCell(Text("플랜아이")),
                            DataCell(Text("(주)리벤처스")),
                            DataCell(Text("6,000,000,000")),
                            DataCell(Text("2023.06.06")),
                            DataCell(Text("서류접수중")),
                          ]
                      ),
                      DataRow(
                          cells: [
                            DataCell(Text("2")),
                            DataCell(Text("플랜아이")),
                            DataCell(Text("(주)리벤처스")),
                            DataCell(Text("6,000,000,000")),
                            DataCell(Text("2023.06.06")),
                            DataCell(Text("운용중")),
                          ]
                      )
                    ],
                  )
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
                        const Text("18,000,000,000",
                          style: TextStyle(
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                      child: const Text("참여하고 있는 조합의 최신 공지사항입니다.",
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
              ),
              Container(
                  width: 1280,
                  margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: DataTable(
                    // todo 가운데정렬
                    // todo headingRow 아래 border 조정
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
            ],
          ),
        ),
        isAdmin: false, crumbs: const ["마이페이지"],
    );
  }

  List<FundCard> fundCardsFromFunds(List<Fund> funds) {
    List<FundCard> result = List.empty(growable: true);
    for (var fund in funds) {
      result.add(FundCard(fund: fund));
    }

    return result;
  }
}

DataRow toMyPageRow(int index, Fund fund, LimitedPartner lp) {
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