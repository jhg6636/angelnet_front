import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/custom_border_clipper.dart';

class FundingFundDetailScreen extends StatefulWidget {

  const FundingFundDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => FundingFundDetailScreenState();

}

class FundingFundDetailScreenState extends State<FundingFundDetailScreen> {

  var selectedMenu = '기본정보';

  @override
  Widget build(BuildContext context) {
    const bigNumberTextStyle = TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.bold,
      fontSize: 38,
      letterSpacing: -0.38,
      color: Color(0xff0361f9)
    );
    const headColumnTextStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.17,
      color: Color(0xff333333),
    );
    const columnTextStyle = TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      letterSpacing: -0.15,
      color: Color(0xff555555)
    );
    const h1Style = TextStyle(
        fontFamily: StringUtils.pretendard,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color(0xff1173f9),
        letterSpacing: -0.17
    );

    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("결성중인 조합", style: WidgetUtils.titleStyle,),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              padding: const EdgeInsets.fromLTRB(60, 46, 60, 44),
              decoration: BoxDecoration(
                color: const Color(0xffeef6fd),
                border: Border.all(color: const Color(0xffc3d9ff),),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            height: 37,
                            decoration: BoxDecoration(
                              color: const Color(0xff1badfb), // todo status별로 색깔
                              borderRadius: BorderRadius.circular(19)
                            ),
                            child: const Text("조합검토기간",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: StringUtils.pretendard,
                                  color: Colors.white
                                ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 14, 0, 0),
                            child: const Text("리벤처스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                color: Color(0xff111111),
                              ),
                            ),
                          )
                        ],
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff293655),
                          foregroundColor: const Color(0xff293655),
                          fixedSize: const Size(121, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.fromLTRB(24, 0, 16, 0)
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("조합 참여",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringUtils.pretendard,
                                fontSize: 17,
                                letterSpacing: -0.34,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Remix.arrow_right_s_line, size: 19, color: Colors.white,)
                          ],
                        )
                      )
                    ],
                  ),
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 60),
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 106,
                            margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                            padding: const EdgeInsets.fromLTRB(40, 30, 30, 31),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 41.23,
                                      height: 41.23,
                                      margin: const EdgeInsets.fromLTRB(0, 0, 10.77, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('lib/assets/images/funding_fund_detail_image_1.png'),
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    ),
                                    const Text("참여 가능 인원 수",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: StringUtils.pretendard,
                                          color: Color(0xff333333),
                                          letterSpacing: -0.17
                                      ),
                                    )
                                  ],
                                ),
                                const Text("45", style: bigNumberTextStyle)
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 106,
                            margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                            padding: const EdgeInsets.fromLTRB(40, 30, 30, 31),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 36.17,
                                      height: 43.96,
                                      margin: const EdgeInsets.fromLTRB(0, 0, 10.77, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('lib/assets/images/funding_fund_detail_image_2.png'),
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    ),
                                    const Text("참여 좌수",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: StringUtils.pretendard,
                                          color: Color(0xff333333),
                                          letterSpacing: -0.17
                                      ),
                                    )
                                  ],
                                ),
                                const Text("293", style: bigNumberTextStyle)
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 106,
                            margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                            padding: const EdgeInsets.fromLTRB(40, 30, 30, 31),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 42.38,
                                      height: 36.88,
                                      margin: const EdgeInsets.fromLTRB(0, 0, 10.77, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('lib/assets/images/funding_fund_detail_image_3.png'),
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    ),
                                    const Text("남은좌수",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: StringUtils.pretendard,
                                          color: Color(0xff333333),
                                          letterSpacing: -0.17
                                      ),
                                    )
                                  ],
                                ),
                                const Text("132", style: bigNumberTextStyle)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 65, 0, 0),
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMenu = '기본정보';
                            });
                          },
                          child: (selectedMenu == '기본정보')? ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  width: 426,
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
                                    child: Text("기본정보",
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
                              width: 426,
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff9f9f9),
                                  border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                              ),
                              child: const Center(
                                child: Text("기본정보", style: h1Style), // todo h1Style 다시 봐
                              )
                          ),
                        )
                    ),
                    Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMenu = '회사소개';
                            });
                          },
                          child: (selectedMenu == '회사소개')? ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  width: 426,
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
                                    child: Text("회사소개",
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
                              width: 426,
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff9f9f9),
                                  border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                              ),
                              child: const Center(
                                child: Text("회사소개",
                                  style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff282728),
                                      letterSpacing: -0.17
                                  ),
                                ),
                              )
                          ),
                        )
                    ),
                    Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMenu = '공지사항';
                            });
                          },
                          child: (selectedMenu == '공지사항')? ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  width: 426,
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
                              width: 426,
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
                                  ),
                                ),
                              )
                          ),
                        )
                    ),
                  ],
                )
            ),
            if (selectedMenu == '기본정보') Container(
              margin: const EdgeInsets.fromLTRB(0, 33, 0, 8),
              child: const Text("기본정보",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: StringUtils.pretendard,
                  color: Color(0xff333333),
                  letterSpacing: -0.2
                ),
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xff555555), thickness: 2,),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("조합명", style: headColumnTextStyle),
                  ),
                  Text("리벤처스 테크 이노베이션 투자조합 6호", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("투자종목", style: headColumnTextStyle),
                  ),
                  Text("(주)플랜아이", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("주요제품", style: headColumnTextStyle),
                  ),
                  Text("웹서비스", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("투자형태", style: headColumnTextStyle),
                  ),
                  Text("상환전환 우선주", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("결성금액", style: headColumnTextStyle),
                  ),
                  Text("100,000,000,000원 (최소참여금액 : 10,000,000원)", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("투자밸류", style: headColumnTextStyle),
                  ),
                  Text("PRE 500억원", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("발행가격(인수가격)", style: headColumnTextStyle),
                  ),
                  Text("주당 0원", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("조합결성일", style: headColumnTextStyle),
                  ),
                  Text("2023-01-01", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("조합인수일", style: headColumnTextStyle),
                  ),
                  Text("2023-01-01", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("담당자", style: headColumnTextStyle),
                  ),
                  Text("김철수", style: columnTextStyle,)
                ],
              ),
            ),
            if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 156,
                    child: Text("기타", style: headColumnTextStyle),
                  ),
                  Text("기타 특이사항 및 메모가 들어갑니다.", style: columnTextStyle,)
                ],
              ),
            ),
            // todo 참조자료
            // if (selectedMenu == '기본정보') const Divider(color: Color(0xffdddddd)),
            // if (selectedMenu == '기본정보') Container(
            //   margin: const EdgeInsets.fromLTRB(0, 41, 0, 8),
            //   child: const Text("참조 자료", style: h1Style,)
            // ),
            // if (selectedMenu == '기본정보') const Divider(color: Color(0xff555555), thickness: 2,),
            // if (selectedMenu == '기본정보') Container(
            //   padding: const EdgeInsets.fromLTRB(19, 5, 0, 1),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //         width: 156,
            //         child: Text("조합명", style: headColumnTextStyle),
            //       ),
            //       Text("리벤처스 테크 이노베이션 투자조합 6호", style: columnTextStyle,)
            //     ],
            //   ),
            // ),
            if (selectedMenu == '기본정보') Container(
              padding: const EdgeInsets.fromLTRB(50, 34, 50, 40),
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              decoration: const BoxDecoration(
                color: Color(0xfff7faff),
                border: Border(top: BorderSide(color: Color(0xff1173f9), width: 2),),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("투자 위험 고지",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: StringUtils.pretendard,
                      color: Color(0xff002997),
                      letterSpacing: -0.38
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff002997),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          alignment: Alignment.center,
                          child: const Text("1",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),
                        ),
                        const Text("개인투자조합은 비상장기업에 대한 투자로 수익률을 보장하지 않으며, 투자기업의 실적 약화 / 파산 등의 이유로 원금 일부 또는 전부를 잃을 수 있습니다.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            color: Color(0xff333333),
                            letterSpacing: -0.16
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff002997),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          alignment: Alignment.center,
                          child: const Text("2",
                            style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const Text("조합 출자 후 만기 전에 (조기 해산되는 경우 제외) 어떠한 경우에도 현금으로 전환, 상환되지 않습니다.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff333333),
                              letterSpacing: -0.16
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff002997),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          alignment: Alignment.center,
                          child: const Text("3",
                            style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white
                            ),
                          ),
                        ),
                        const Text("조세특례제한법 제16조에 따르면 개인투자조합에 청약 후 3년 이내 해산 시 공제받은 소득금액이 추징 될 수 있습니다.",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff333333),
                              letterSpacing: -0.16
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                    padding: const EdgeInsets.fromLTRB(30, 21, 38, 23),
                    decoration: BoxDecoration(
                      color: const Color(0xffeef3fc),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("조세특례제한법 제16조",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: -0.15,
                            color: Color(0xff111111),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: const Text("소득공제를 적용 받은 거주자가 출자일 또는 투자일로부터 3년이 지나기 전에 다음 각 호의 어느 하나에 해당하게 되면 그 거주자의 관할 세무서장 또는 원천징수의무자는 대통령령으로 정하는 바에 따라 거주자가 이미 공제받은 소득금액에 해당하는 세액을 추징한다.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff555555),
                              letterSpacing: -0.15
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      isAdmin: false,
      crumbs: const ["결성중인 조합", "리벤처스 테크 이노베이션 투자조합 6호"]
    );
  }

}