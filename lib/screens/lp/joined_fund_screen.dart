import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/fund/fund_status.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:remixicon/remixicon.dart';

import 'fund_detail_lp_screen.dart';

class JoinedFundScreen extends StatefulWidget {

  // todo fund 추가 + enum class 도입하여 문구 및 step 자동화

  final Fund fund;

  // final bool isRunning; // todo fundStatus로 관리하기
  const JoinedFundScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => JoinedFundScreenState();

}

class JoinedFundScreenState extends State<JoinedFundScreen> {

  final fileNameController1 = TextEditingController();
  final fileNameController2 = TextEditingController();
  final fileNameController3 = TextEditingController();
  bool isRunning = false;
  bool detailPageClicked = false;

  @override
  Widget build(BuildContext context) {
    isRunning = (widget.fund.status == FundStatus.running) && !detailPageClicked;
    return ScreenFrameV2(
      main: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("참여중인 조합",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: -1,
                  color: Color(0xff111111),
                ),
              ),
              Container(
                height: 90,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                padding: const EdgeInsets.fromLTRB(50, 0, 31, 0),
                decoration: const BoxDecoration(
                    color: Color(0xfff7faff),
                    border: Border(
                        top: BorderSide(
                            color: Color(0xff1173f9),
                            width: 2
                        )
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("조합명",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.38,
                            color: Color(0xff002997)
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                          child: const Text("|",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0x8072839f)
                            ),
                          ),
                        ),
                        Text(widget.fund.name,
                          style: const TextStyle(
                            fontSize: 19,
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333)
                          ),
                        )
                      ],
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        foregroundColor: const Color(0xff0d65de),
                        backgroundColor: const Color(0xff0d65de),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        fixedSize: const Size(153, 50),
                        padding: EdgeInsets.zero
                      ),
                      onPressed: () {
                        setState(() {
                          detailPageClicked = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("조합 상세페이지",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringUtils.pretendard,
                                fontSize: 17,
                                letterSpacing: -0.34,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: const Icon(Remix.arrow_right_s_line, size: 19, color: Colors.white,)
                            )
                          ],
                        ),
                      )
                    )
                  ],
                )
              ),
              if (!isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: fundStatusWidget(widget.fund.status),
              ),
              if (!isRunning) Container(
                height: 83,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: DottedBorder(
                  color: const Color(0xffb5becc),
                  radius: const Radius.circular(5),
                  dashPattern: const [3, 3],
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          width: 27,
                          height: 27,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00958f)
                          ),
                          child: const Icon(Remix.check_fill, size: 18, color: Colors.white,),
                        ),
                        const Text("조합 결성이 진행 중입니다.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            fontFamily: StringUtils.pretendard,
                            color: Color(0xff333333)
                          ),
                        )
                      ],
                    )
                  )
                )
              ),

              if (isRunning) Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: const Text("투자정보",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.2,
                    ),
                  )
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff333333),),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("조합명",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                          color: Color(0xff333333)
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                        child: const Text("리벤처스 테크 이노베이션 투자조합 6호",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555)
                          ),
                        )
                    )
                  ],
                ),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("투자기업",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                          color: Color(0xff333333)
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
                        child: const Text("(주)플랜아이",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555)
                          ),
                        )
                    ),
                    if (isRunning) Container(
                      margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: const Divider(color: Color(0xffdddddd),),
                    )
                  ],
                ),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("투자 좌수",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                          color: Color(0xff333333)
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(94, 0, 0, 0),
                        child: const Text("15 좌",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555)
                          ),
                        )
                    )
                  ],
                ),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("투자 금액",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                          color: Color(0xff333333)
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(94, 0, 0, 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("60,000,000",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.15,
                                  color: Color(0xff111111)
                              ),
                            ),
                            Text("원",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.15,
                                  color: Color(0xff555555)
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: Row(
                  children: [
                    const Text("출자증서 발급",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.2,
                          color: Color(0xff333333)
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: const Text("출자증서를 다운로드 하실 수 있습니다.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555)
                          ),
                        )
                    )
                  ],
                ),
              ),
              if (isRunning) Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff555555),),
              ),
              if (isRunning) Container(
                  padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: Row(
                    children: [
                      const Text("출자증서",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.17,
                          color: Color(0xff333333),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
                        child: FilledButton(
                            style: FilledButton.styleFrom(
                                fixedSize: const Size(164, 38),
                                foregroundColor: const Color(0xff6c6f81),
                                backgroundColor: const Color(0xff6c6f81),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Remix.download_2_line, size: 16, color: Colors.white,),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: const Text("출자증서 다운로드",
                                    style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.32,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                    ],
                  )
              ),
              if (isRunning) const Divider(color: Color(0xffdddddd),),
              if (isRunning) Container(
                  margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("공지사항",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.2,
                                  color: Color(0xff333333)
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                            child: const Text("참여하고 있는 조합의 최신 공지사항입니다.",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.15,
                                  color: Color(0xff555555)
                              ),
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("더보기",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.15,
                                color: Color(0xff555555),
                              ),
                            ),
                            Icon(Remix.arrow_right_s_line, color: Color(0xff555555), size: 15,)
                          ],
                        ),
                      )
                    ],
                  )
              ),
              if (isRunning) Container(
                  width: 1280,
                  margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
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
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("서류 제출",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                        color: Color(0xff333333)
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: const Text("제출하신 서류는 조합 관리자 확인 후 승인됩니다. 승인 후에는 수정하실 수 없습니다.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.15,
                          color: Color(0xff555555)
                        ),
                      )
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff555555),),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  padding: const EdgeInsets.fromLTRB(19, 0, 636, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("사업자등록증",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            letterSpacing: -0.17
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 263,
                              height: 38,
                              margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                              child: TextField(
                                controller: fileNameController1,
                                decoration: InputDecoration(
                                    enabled: false,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffdddddd)),
                                        borderRadius: BorderRadius.circular(2)
                                    )
                                ),
                              )
                          ),
                          FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xff6c6f81),
                                foregroundColor: const Color(0xff6c6f81),
                                fixedSize: const Size(90, 38),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                              ),
                              onPressed: () {},
                              child: const Text("파일찾기",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.32,
                                  color: Colors.white,
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: const Divider(thickness: 1, color: Color(0xffdddddd),),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  padding: const EdgeInsets.fromLTRB(19, 0, 636, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("등기부등본",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff333333),
                            letterSpacing: -0.17
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 263,
                              height: 38,
                              margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                              child: TextField(
                                controller: fileNameController1,
                                decoration: InputDecoration(
                                    enabled: false,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Color(0xffdddddd)),
                                        borderRadius: BorderRadius.circular(2)
                                    )
                                ),
                              )
                          ),
                          FilledButton(
                              style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xff6c6f81),
                                  foregroundColor: const Color(0xff6c6f81),
                                  fixedSize: const Size(90, 38),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                              ),
                              onPressed: () {},
                              child: const Text("파일찾기",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: StringUtils.pretendard,
                                  letterSpacing: -0.32,
                                  color: Colors.white,
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  )
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                child: const Divider(thickness: 1, color: Color(0xffdddddd),),
              ),
              if (isRunning) Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff222222),
                    foregroundColor: const Color(0xff222222),
                    fixedSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  onPressed: () {},
                  child: const Text("서류 등록",
                    style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.34,
                      color: Colors.white,
                    ),
                  ),
                )
              ),
            ],
          )
      ),
    isAdmin: false, crumbs: const ["마이페이지", "참여중인 조합"]
    );
  }

}

Row fundStatusWidget(FundStatus status) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 200,
        height: 210,
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xffdddddd))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 88,
              height: 33,
              decoration: BoxDecoration(
                color: (status == FundStatus.receivingDocuments || status == FundStatus.accepting)
                    ? const Color(0xff1badfb) : const Color(0xffb5becc),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text("STEP 01",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: (status == FundStatus.receivingDocuments || status == FundStatus.accepting) ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 15,
                  fontFamily: StringUtils.pretendard
                ),
              ),
            ),
            Container(
              width: 50.83,
              height: 44.62,
              margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_1.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 28.38, 0, 0),
              child: Text("서류제출",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 18,
                  fontWeight: (status == FundStatus.receivingDocuments || status == FundStatus.accepting) ? FontWeight.bold : FontWeight.w400,
                  color: (status == FundStatus.receivingDocuments || status == FundStatus.accepting) ? const Color(0xff111111) : const Color(0xff434343)
                ),
              ),
            )
          ],
        )
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 12, 0),
        child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
      ),
      Container(
          width: 200,
          height: 210,
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffdddddd))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 88,
                height: 33,
                decoration: BoxDecoration(
                  color: (status == FundStatus.stockPayment) ? const Color(0xff5992ef) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 02",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (status == FundStatus.stockPayment) ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard
                  ),
                ),
              ),
              Container(
                width: 48.62,
                height: 44.84,
                margin: const EdgeInsets.fromLTRB(0, 25.35, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/fund_image_2.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25.81, 0, 0),
                child: Text("입금대기",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 18,
                      fontWeight: (status == FundStatus.stockPayment) ? FontWeight.bold : FontWeight.w400,
                      color: (status == FundStatus.stockPayment) ? const Color(0xff111111) : const Color(0xff434343)
                  ),
                ),
              )
            ],
          )
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 12, 0),
          child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
      ),
      Container(
          width: 200,
          height: 210,
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffdddddd))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 88,
                height: 33,
                decoration: BoxDecoration(
                  color: (status == FundStatus.stockPaymentComplete) ? const Color(0xff0361f9) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 03",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (status == FundStatus.stockPaymentComplete) ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard
                  ),
                ),
              ),
              Container(
                width: 39,
                height: 46.01,
                margin: const EdgeInsets.fromLTRB(0, 24.76, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/fund_image_3.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25.22, 0, 0),
                child: Text("입금완료",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 18,
                      fontWeight: (status == FundStatus.stockPaymentComplete) ? FontWeight.bold : FontWeight.w400,
                      color: (status == FundStatus.stockPaymentComplete) ? const Color(0xff111111) : const Color(0xff434343)
                  ),
                ),
              )
            ],
          )
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 12, 0),
          child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
      ),
      Container(
          width: 200,
          height: 210,
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffdddddd))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 88,
                height: 33,
                decoration: BoxDecoration(
                  color: (status == FundStatus.governmentProcess) ? const Color(0xff004cc6) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 04",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (status == FundStatus.governmentProcess) ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard
                  ),
                ),
              ),
              Container(
                width: 48.54,
                height: 42.41,
                margin: const EdgeInsets.fromLTRB(0, 23.76, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/fund_image_4.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 29.83, 0, 0),
                child: Text("중기부 승인 진행",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 18,
                      fontWeight: (status == FundStatus.governmentProcess) ? FontWeight.bold : FontWeight.w400,
                      color: (status == FundStatus.governmentProcess) ? const Color(0xff111111) : const Color(0xff434343)
                  ),
                ),
              )
            ],
          )
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 12, 0),
          child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
      ),
      Container(
          width: 200,
          height: 210,
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffdddddd))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 88,
                height: 33,
                decoration: BoxDecoration(
                  color: (status == FundStatus.stockPaymentComplete) ? const Color(0xff002997) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 05",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (status == FundStatus.stockPaymentComplete) ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard
                  ),
                ),
              ),
              Container(
                width: 33.46,
                height: 45.21,
                margin: const EdgeInsets.fromLTRB(0, 23.76, 0, 0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/fund_image_5.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 27.02, 0, 0),
                child: Text("주금 납입",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 18,
                      fontWeight: (status == FundStatus.stockPaymentComplete) ? FontWeight.bold : FontWeight.w400,
                      color: (status == FundStatus.stockPaymentComplete) ? const Color(0xff111111) : const Color(0xff434343)
                  ),
                ),
              )
            ],
          )
      )
    ],
  );
}