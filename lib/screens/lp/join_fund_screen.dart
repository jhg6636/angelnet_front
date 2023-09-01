import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class JoinFundScreen extends StatefulWidget {

  const JoinFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => JoinFundScreenState();

}

class JoinFundScreenState extends State<JoinFundScreen> {

  final columnHeadStyle = const TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    letterSpacing: -0.17,
    color: Color(0xff333333)
  );
  final bigNumberStyle = const TextStyle(
    fontFamily: StringUtils.pretendard,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xff111111)
  );
  final unitTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    fontFamily: StringUtils.pretendard,
    color: Color(0xff333333),
    letterSpacing: -0.17
  );
  var stockCounts = 5;
  final stockCountsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    stockCountsController.text = stockCounts.toString();
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합 참여", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: DottedBorder(
                color: const Color(0xffb5becc),
                radius: const Radius.circular(5),
                dashPattern: const [3, 3],
                padding: const EdgeInsets.fromLTRB(0, 46, 0, 43),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      padding: const EdgeInsets.fromLTRB(18, 10, 17, 8),
                      decoration: BoxDecoration(
                        color: const Color(0x0f1badfb),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: const Text("조합검토기간",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff1badfb)
                        ),
                      ),
                    ),
                    const Text("리벤처스 테크 이노베이션 투자조합 6호",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        fontFamily: StringUtils.pretendard,
                        color: Color(0xff111111),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 60),
              decoration: BoxDecoration(
                color: const Color(0xffeef6fd),
                border: Border.all(color: const Color(0xffc3d9ff)),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 27,
                        height: 27,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff00958f),
                        ),
                        child: const Icon(Remix.check_fill, size: 18, color: CupertinoColors.white),
                      ),
                      const Text(" 참여 좌수는 ",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: -0.2,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text("5",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.2,
                          color: Color(0xff00968f),
                        ),
                      ),
                      const Text("단위로 참여가능합니다.",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: -0.2,
                          color: Color(0xff333333)
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: const Text("조합 참여 신청 완료 후, 진행될 프로세스는 마이페이지에서 확인 가능합니다.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.2,
                          color: Color(0xff333333)
                      ),
                    ),
                  ),
                  Container(
                    width: 526,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    padding: const EdgeInsets.fromLTRB(53, 41, 53, 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CupertinoColors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("1좌당 금액", style: columnHeadStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("5,000,000", style: bigNumberStyle,),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: Text("원", style: unitTextStyle,),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 24, 0, 21),
                          child: const DottedLine(
                            dashLength: 3,
                            dashGapLength: 3,
                            dashColor: Color(0xffb5becc),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("참여 좌수", style: columnHeadStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (stockCounts >= 5) stockCounts -= 5;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xffdddddd)),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: const Icon(Remix.subtract_line, size: 24, color: Color(0xff767676),),
                                  ),
                                ),
                                Container(
                                  width: 72,
                                  height: 34,
                                  margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: const TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff111111)
                                    ),
                                    controller: stockCountsController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                    ),
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    onEditingComplete: () {
                                      setState(() {
                                        stockCounts = (stockCountsController.text) as int;
                                      });
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      stockCounts += 5;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xffdddddd)),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: const Icon(Remix.add_line, size: 24, color: Color(0xff767676),),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 24, 0, 21),
                          child: const DottedLine(
                            dashLength: 3,
                            dashGapLength: 3,
                            dashColor: Color(0xffb5becc),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("참여 금액", style: columnHeadStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(StringUtils().currencyFormat(5000000 * stockCounts), style: bigNumberStyle,),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: Text("원", style: unitTextStyle,),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),

                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xff0d65de),
                        foregroundColor: const Color(0xff0d65de),
                        fixedSize: const Size(153, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.fromLTRB(24, 0, 14, 0),
                      ),
                      child: Row(
                        children: [
                          const Text("조합 참여하기",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.34,
                              color: CupertinoColors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                            child: const Icon(Remix.arrow_right_s_line, color: Colors.white, size: 19,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      isAdmin: false,
      crumbs: ["결성중인 조합", "리벤처스 테크 이노베이션 투자조합 6호", "조합 참여"]
    );
  }

}