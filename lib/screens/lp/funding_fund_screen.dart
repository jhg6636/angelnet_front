import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/pagination.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund.dart';

class FundingFundScreen extends StatefulWidget {
  const FundingFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => FundingFundScreenState();
}

class FundingFundScreenState extends State<FundingFundScreen> {

  final searchOptions = ['전체', '조합검토기간', '참여신청', '서류접수 및 입금확인', '중소벤처기업부 등록승인', '주금 납입', '완료'];
  var selectedSearchOption = '전체';

  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Future<List<Fund>> funds = searchFunds();
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("결성중인 조합",
              style: WidgetUtils.titleStyle,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: 90,
              decoration: const BoxDecoration(
                  color: Color(0xfff7faff),
                  border: Border(
                      top: BorderSide(
                          color: Color(0xff1173f9),
                          width: 2
                      )
                  )
              ),
              child: const Text("투자가 진행중인 조합들을 확인하고, 참여를 결정 할 수 있습니다.",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 42),
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
                              color: const Color(0xff1badfb),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 01",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: StringUtils.pretendard
                              ),
                            ),
                          ),
                          Container(
                            width: 46.91,
                            height: 46.91,
                            margin: const EdgeInsets.fromLTRB(0, 20.54, 0, 0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/funding_fund_image_1.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20.54, 0, 0),
                            child: const Text("조합검토기간",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
                  ),
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 42),
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
                              color: const Color(0xff5992ef),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 02",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: StringUtils.pretendard
                              ),
                            ),
                          ),
                          Container(
                            width: 40.39,
                            height: 40.39,
                            margin: const EdgeInsets.fromLTRB(0, 27.81, 0, 0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/funding_fund_image_2.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 19.8, 0, 0),
                            child: const Text("참여신청",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
                  ),
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 19.01),
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
                              color: const Color(0xff0361f9),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 03",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
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
                            margin: const EdgeInsets.fromLTRB(0, 19.22, 0, 0),
                            child: const Text("서류접수 및",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          ),
                          const Text("입금확인",
                            style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff434343)
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
                  ),
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 19),
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
                              color: const Color(0xff004cc6),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 04",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
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
                            margin: const EdgeInsets.fromLTRB(0, 23.83, 0, 0),
                            child: const Text("중소벤처기업부",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          ),
                          const Text("등록승인",
                            style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff434343)
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
                  ),
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 42),
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
                              color: const Color(0xff002997),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 05",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: StringUtils.pretendard
                              ),
                            ),
                          ),
                          Container(
                            width: 33.46,
                            height: 45.21,
                            margin: const EdgeInsets.fromLTRB(0, 21.76, 0, 0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/fund_image_5.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 21.02, 0, 0),
                            child: const Text("주금 납입",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: const Text("▶", style: TextStyle(fontSize: 14, color: Color(0xff33363b)),)
                  ),
                  Container(
                      width: 156,
                      height: 210,
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 18),
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
                              color: const Color(0xff00958f),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Text("STEP 06",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: StringUtils.pretendard
                              ),
                            ),
                          ),
                          Container(
                            width: 42.29,
                            height: 44.98,
                            margin: const EdgeInsets.fromLTRB(0, 19.47, 0, 0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/funding_fund_image_6.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 21.54, 0, 0),
                            child: const Text("완료",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff434343)
                              ),
                            ),
                          ),
                          const Text("(출자증서 발급)",
                            style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff434343)
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
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
                  ),
                  Row(
                    children: [
                      Container(
                        color: const Color(0xfff2f2f2),
                        height: 42,
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                          padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                          value: selectedSearchOption,
                          items: searchOptions
                              .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                              .toList(),
                          onChanged: (String? value) => setState(() {
                            selectedSearchOption = value ?? "전체";
                          }),
                        ))
                      ),
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: const Divider(color: Color(0xff333333),),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("참여가능 인원 ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff333333),
                              letterSpacing: -0.15,
                            ),
                          ),
                          const Text("45",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.15,
                              color: Color(0xff0361f9),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text("|",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffdddddd)
                              ),
                            )
                          ),
                          const Text("참여좌수 ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff333333),
                              letterSpacing: -0.15,
                            ),
                          ),
                          const Text("135",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.15,
                              color: Color(0xff0361f9),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text("|",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffdddddd)
                                ),
                              )
                          ),
                          const Text("남은좌수 ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: StringUtils.pretendard,
                              color: Color(0xff333333),
                              letterSpacing: -0.15,
                            ),
                          ),
                          const Text("25",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.15,
                              color: Color(0xff0361f9),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text("|",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffdddddd)
                                ),
                              )
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.22,
                            color: Color(0xff191919),
                          ),
                        )
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Row(
                          children: [
                            const Text("주요제품",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: -0.15,
                                color: Color(0xff333333),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.15,
                                color: Color(0xff757575)
                              ),
                            )
                          ],
                        )
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                          child: Row(
                            children: [
                              const Text("결성금액",
                                style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  letterSpacing: -0.15,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: const Text("|",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffdddddd)
                                    ),
                                  )
                              ),
                              const Text("1,000,000,000,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: StringUtils.pretendard,
                                    letterSpacing: -0.15,
                                    color: Color(0xff000000)
                                ),
                              ),
                              const Text("원",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: StringUtils.pretendard,
                                    letterSpacing: -0.15,
                                    color: Color(0xff757575)
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                  Container(
                    // todo 스타일 enum class에 지정
                    alignment: Alignment.center,
                    width: 186,
                    height: 47,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffbbd2f7)),
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: const Text("서류접수 및 입금확인",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xff0361f9)
                      )
                    ),
                  ),
                ],
              )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("참여가능 인원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("45",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("참여좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("135",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("남은좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("25",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.22,
                                color: Color(0xff191919),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              children: [
                                const Text("주요제품",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Row(
                              children: [
                                const Text("결성금액",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("1,000,000,000,000",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff000000)
                                  ),
                                ),
                                const Text("원",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      // todo 스타일 enum class에 지정
                      alignment: Alignment.center,
                      width: 186,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff98c7c6)),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Text("완료(출자증서 발급)",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xff00968f)
                          )
                      ),
                    ),
                  ],
                )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("참여가능 인원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("45",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("참여좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("135",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("남은좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("25",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.22,
                                color: Color(0xff191919),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              children: [
                                const Text("주요제품",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Row(
                              children: [
                                const Text("결성금액",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("1,000,000,000,000",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff000000)
                                  ),
                                ),
                                const Text("원",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      // todo 스타일 enum class에 지정
                      alignment: Alignment.center,
                      width: 186,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffbfd1ef)),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Text("중소벤처기업부 등록승인",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xff004cc6)
                          )
                      ),
                    ),
                  ],
                )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("참여가능 인원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("45",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("참여좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("135",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("남은좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("25",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.22,
                                color: Color(0xff191919),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              children: [
                                const Text("주요제품",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Row(
                              children: [
                                const Text("결성금액",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("1,000,000,000,000",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff000000)
                                  ),
                                ),
                                const Text("원",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      // todo 스타일 enum class에 지정
                      alignment: Alignment.center,
                      width: 186,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffa1d6f2)),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Text("조합검토기간",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xff1badfb)
                          )
                      ),
                    ),
                  ],
                )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("참여가능 인원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("45",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("참여좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("135",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("남은좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("25",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.22,
                                color: Color(0xff191919),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              children: [
                                const Text("주요제품",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Row(
                              children: [
                                const Text("결성금액",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("1,000,000,000,000",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff000000)
                                  ),
                                ),
                                const Text("원",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      // todo 스타일 enum class에 지정
                      alignment: Alignment.center,
                      width: 186,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffc1d8ff)),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Text("참여신청",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xff5992ef)
                          )
                      ),
                    ),
                  ],
                )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("참여가능 인원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("45",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("참여좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("135",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            ),
                            const Text("남은좌수 ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: StringUtils.pretendard,
                                color: Color(0xff333333),
                                letterSpacing: -0.15,
                              ),
                            ),
                            const Text("25",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.15,
                                color: Color(0xff0361f9),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("|",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffdddddd)
                                  ),
                                )
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: const Text("리벤쳐스 테크 이노베이션 투자조합 6호",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.22,
                                color: Color(0xff191919),
                              ),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              children: [
                                const Text("주요제품",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("플랜아이는 기획, 디자인, 프로그램의 역량을 활용하여 정보를 쉽게 표현하고 명확하게 전달하는 것을 가장 잘 하는 회사입니다.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                            child: Row(
                              children: [
                                const Text("결성금액",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    letterSpacing: -0.15,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: const Text("|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffdddddd)
                                      ),
                                    )
                                ),
                                const Text("1,000,000,000,000",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff000000)
                                  ),
                                ),
                                const Text("원",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: StringUtils.pretendard,
                                      letterSpacing: -0.15,
                                      color: Color(0xff757575)
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      // todo 스타일 enum class에 지정
                      alignment: Alignment.center,
                      width: 186,
                      height: 47,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffccd1de)),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Text("주금납입",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xff002997)
                          )
                      ),
                    ),
                  ],
                )
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: pagination(54),
              )
            )
          ],
        ),
      ),
      isAdmin: false, crumbs: ["결성중인 조합"]
    );

    // return ScreenFrame(
    //   main: WidgetUtils().wrapAsDualScrollWidget(
    //       Column(
    //         children: [
    //           fundStatusFlow(),
    //           FutureBuilder<List<Fund>>(
    //             future: funds,
    //             builder:
    //                 (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
    //               if (snapshot.hasError) {
    //                 print(snapshot.error);
    //                 print(snapshot.stackTrace);
    //                 return WidgetUtils.errorPadding;
    //               } else if (snapshot.hasData == false) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 return DataTable(
    //                     columns: const [
    //                       DataColumn(label: Text("조합명")),
    //                       DataColumn(label: Text("투자종목")),
    //                       DataColumn(label: Text("주요제품")),
    //                       DataColumn(label: Text("결성금액")),
    //                       DataColumn(label: Text("참여 좌수")),
    //                       DataColumn(label: Text("남은 좌수")),
    //                       DataColumn(label: Text("참여 가능 인원")),
    //                       DataColumn(label: Text("자세히 보기")),
    //                     ],
    //                     rows: snapshot.data
    //                         ?.map<DataRow>((fund) => fund.toFundingFundDataRow())
    //                         .toList()
    //                         ?? List.empty()
    //                 );
    //               }
    //             },
    //           ),
    //         ],
    //       )
    //   ),
    //   isAdmin: false
    // );
  }
}

Widget fundStatusFlow() {
  return Wrap(children: const [
    Text("1. 조합검토기간"),
    Icon(Icons.arrow_right),
    Text("2. 참여신청"),
    Icon(Icons.arrow_right),
    Text("3. 서류접수 및 입금확인"),
    Icon(Icons.arrow_right),
    Text("4. 중소벤처기업부 등록승인"),
    Icon(Icons.arrow_right),
    Text("5. 주금납입"),
    Icon(Icons.arrow_right),
    Text("6. 완료 (출자증서 발급)"),
  ],);
}