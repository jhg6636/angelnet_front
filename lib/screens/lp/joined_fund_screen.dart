import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class JoinedFundScreen extends StatefulWidget {

  // todo fund 추가 + enum class 도입하여 문구 및 step 자동화

  const JoinedFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => JoinedFundScreenState();

}

class JoinedFundScreenState extends State<JoinedFundScreen> {

  final fileNameController1 = TextEditingController();
  final fileNameController2 = TextEditingController();
  final fileNameController3 = TextEditingController();

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
                        const Text("리벤처스 테크 이노베이션 투자조합 6호",
                          style: TextStyle(
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
                      onPressed: () {},
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: fundStatusWidget(5),
              ),
              Container(
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
                margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff555555),),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  padding: const EdgeInsets.fromLTRB(19, 0, 746, 0),
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
                          )
                        ],
                      ),
                      FilledButton(
                        onPressed: () {},
                        child: Text("파일찾기",
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
                  )
              )
            ],
          )
      ),
    isAdmin: false, crumbs: const ["마이페이지", "참여중인 조합"]
    );
  }

}

Row fundStatusWidget(int step) {
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
                color: (step == 1) ? const Color(0xff1badfb) : const Color(0xffb5becc),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text("STEP 01",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: (step == 1) ? FontWeight.w600 : FontWeight.w500,
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
                  fontWeight: (step == 1) ? FontWeight.bold : FontWeight.w400,
                  color: (step == 1) ? const Color(0xff111111) : const Color(0xff434343)
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
                  color: (step == 2) ? const Color(0xff5992ef) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 02",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (step == 2) ? FontWeight.w600 : FontWeight.w500,
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
                      fontWeight: (step == 2) ? FontWeight.bold : FontWeight.w400,
                      color: (step == 2) ? const Color(0xff111111) : const Color(0xff434343)
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
                  color: (step == 3) ? const Color(0xff0361f9) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 03",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (step == 3) ? FontWeight.w600 : FontWeight.w500,
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
                      fontWeight: (step == 3) ? FontWeight.bold : FontWeight.w400,
                      color: (step == 3) ? const Color(0xff111111) : const Color(0xff434343)
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
                  color: (step == 4) ? const Color(0xff004cc6) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 04",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (step == 4) ? FontWeight.w600 : FontWeight.w500,
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
                      fontWeight: (step == 4) ? FontWeight.bold : FontWeight.w400,
                      color: (step == 4) ? const Color(0xff111111) : const Color(0xff434343)
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
                  color: (step == 5) ? const Color(0xff002997) : const Color(0xffb5becc),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text("STEP 05",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: (step == 5) ? FontWeight.w600 : FontWeight.w500,
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
                      fontWeight: (step == 5) ? FontWeight.bold : FontWeight.w400,
                      color: (step == 5) ? const Color(0xff111111) : const Color(0xff434343)
                  ),
                ),
              )
            ],
          )
      )
    ],
  );
}