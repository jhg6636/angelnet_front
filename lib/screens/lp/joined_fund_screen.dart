import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/lp/limited_partner.dart';
import 'package:angelnet/models/lp/lp_status.dart';
import 'package:angelnet/screens/lp/fund_detail_screen.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';


class LpJoinedFundScreen extends StatefulWidget {

  final LimitedPartner lp;

  const LpJoinedFundScreen({super.key, required this.lp});

  @override
  State<StatefulWidget> createState() => LpJoinedFundScreenState();

}

class LpJoinedFundScreenState extends State<LpJoinedFundScreen> {

  final fileNameController1 = TextEditingController();
  final fileNameController2 = TextEditingController();
  final fileNameController3 = TextEditingController();
  bool detailPageClicked = false;

  @override
  Widget build(BuildContext context) {
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
                        Text(widget.lp.fundName,
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
                      onPressed: () async {
                        var fund = await getFundByLpId(widget.lp.id);
                        setState(() {
                          Get.to(FundDetailScreen(fund: fund));
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
              if (!widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: lpStatusWidget(widget.lp.status),
              ),
              if (!widget.lp.fundStatus.isRunning()) Container(
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
                        Text(widget.lp.status.joinedFundComment,
                          style: const TextStyle(
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

              if (widget.lp.fundStatus.isRunning()) Container(
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
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff333333),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
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
                        child: Text(widget.lp.fundName,
                          style: const TextStyle(
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
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
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
                        child: Text(widget.lp.startupName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.15,
                              color: Color(0xff555555)
                          ),
                        )
                    ),
                    if (widget.lp.fundStatus.isRunning()) Container(
                      margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: const Divider(color: Color(0xffdddddd),),
                    )
                  ],
                ),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
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
                        child: Text("${widget.lp.stockCount} 좌",
                          style: const TextStyle(
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
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(StringUtils().currencyFormat(widget.lp.cost),
                              style: const TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.15,
                                  color: Color(0xff111111)
                              ),
                            ),
                            const Text("원",
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
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Divider(color: Color(0xffdddddd),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: Row(
                  children: [
                    const Text("출자증서 및 소득공제 서류 발급",
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
                        child: const Text("출자증서 및 소득공제 서류를 다운로드 하실 수 있습니다.",
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
              if (widget.lp.fundStatus.isRunning()) Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff555555),),
              ),
              if (widget.lp.fundStatus.isRunning()) Container(
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
              if (widget.lp.fundStatus.isRunning()) const Divider(color: Color(0xffdddddd),),
              if (widget.lp.fundStatus.isRunning()) Container(
                  padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: Row(
                    children: [
                      const Text("소득공제",
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
                                  child: const Text("소득공제 다운로드",
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
              if (widget.lp.fundStatus.isRunning()) const Divider(color: Color(0xffdddddd),),
              if (widget.lp.fundStatus.isRunning()) Container(
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
              if (widget.lp.fundStatus.isRunning()) Container(
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
              if (widget.lp.fundStatus.isRunning()) Container(
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

Row lpStatusWidget(LpStatus status) {
  var containers = <Widget>[];
  for (var thisStatus in LpStatus.values) {
    if (thisStatus == LpStatus.waiting) {
      continue;
    }
    containers.add((status == thisStatus) ? thisStatus.toEnabledWidget() : thisStatus.toDisabledWidget());
    if (thisStatus.index != 5) {
      containers.add(Container(
          margin: const EdgeInsets.fromLTRB(13, 0, 12, 0),
          child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
      ));
    }
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: containers
  );
}