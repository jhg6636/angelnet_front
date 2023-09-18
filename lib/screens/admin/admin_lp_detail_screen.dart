import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class AdminLpDetailScreen extends StatefulWidget {

  const AdminLpDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => AdminLpDetailScreenState();

}

class AdminLpDetailScreenState extends State<AdminLpDetailScreen> {

  static const headingStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: -0.17,
    color: Color(0xff333333)
  );
  static const dataStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w300,
    fontSize: 15,
    letterSpacing: -0.15,
    color: Color(0xff555555)
  );

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합원 관리", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 40),
              padding: const EdgeInsets.fromLTRB(50, 20, 31, 20),
              decoration: BoxDecoration(
                color: const Color(0xffeef6fd),
                border: Border.all(color: const Color(0xffc3d9ff)),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("회원명",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          letterSpacing: -0.38,
                          color: Color(0xff002997)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        child: const Text("|",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff72839f)
                          ),
                        ),
                      ),
                      const Text("김철수",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            letterSpacing: -0.38,
                            color: Color(0xff333333)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: const Text("조합명",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              letterSpacing: -0.38,
                              color: Color(0xff002997)
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        child: const Text("|",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff72839f)
                          ),
                        ),
                      ),
                      const Text("리벤처스 테크 이노베이션 투자조합 6호",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            letterSpacing: -0.38,
                            color: Color(0xff333333)
                        ),
                      ),
                    ],
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff0d65de),
                      foregroundColor: const Color(0xff0d65de),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.fromLTRB(23, 20, 15, 20)
                    ),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text("서류납부상태",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.34,
                            color: Colors.white
                          ),
                        ),
                        Icon(Remix.arrow_right_s_line, color: Colors.white,)
                      ],
                    )
                  )
                ],
              ),
            ),
            const Text("투자정보", style: WidgetUtils.h1Style,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: const Divider(thickness: 2, color: Color(0xff555555),),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 112, 0),
                    child: const Text("조합명", style: headingStyle,),
                  ),
                  const Text("리벤처스 테크 이노베이션 투자조합 6호", style: dataStyle,)
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 98, 0),
                    child: const Text("투자기업", style: headingStyle,),
                  ),
                  const Text("(주) 플랜아이", style: dataStyle,)
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 94, 0),
                    child: const Text("투자 좌수", style: headingStyle,),
                  ),
                  const Text("15 좌", style: dataStyle,)
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 9, 0, 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 94, 0),
                    child: const Text("투자 금액", style: headingStyle,),
                  ),
                  const Text("15,000,000",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.15,
                      color: Color(0xff111111)
                    ),
                  ),
                  const Text("원", style: dataStyle,)
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 8),
              child: const Text("출자증서/소득공제 서류", style: WidgetUtils.h1Style,),
            ),
            const Divider(color: Color(0xff555555), thickness: 2,),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("출자증서", style: headingStyle,),
                  Container(
                    width: 777,
                    margin: const EdgeInsets.fromLTRB(98, 0, 4, 0),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffdddddd)),
                        borderRadius: BorderRadius.circular(2)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 24,
                          height: 20,
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/assets/images/img.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.png",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                        const Text("(123.4KB)",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.14,
                              color: Color(0xff999999)
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff6c6f81),
                          foregroundColor: const Color(0xff6c6f81),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                          fixedSize: const Size(90, 38)
                      ),
                      onPressed: () {},
                      child: const Text("파일찾기",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.32,
                            color: Colors.white
                        ),
                      )
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 38,
                      height: 38,
                      margin: const EdgeInsets.fromLTRB(4, 0, 1, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: const Color(0xffcccccc))
                      ),
                      child: const Icon(Remix.add_line, color: Color(0xff555555), size: 18,),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: const Color(0xffcccccc))
                      ),
                      child: const Icon(Remix.subtract_line, color: Color(0xff555555), size: 18,),
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("소득공제 서류", style: headingStyle,),
                  Container(
                    width: 777,
                    height: 38,
                    margin: const EdgeInsets.fromLTRB(65, 0, 4, 0),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffdddddd)),
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                  FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xff6c6f81),
                          foregroundColor: const Color(0xff6c6f81),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                          fixedSize: const Size(90, 38)
                      ),
                      onPressed: () {},
                      child: const Text("파일찾기",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: -0.32,
                            color: Colors.white
                        ),
                      )
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 38,
                      height: 38,
                      margin: const EdgeInsets.fromLTRB(4, 0, 1, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: const Color(0xffcccccc))
                      ),
                      child: const Icon(Remix.add_line, color: Color(0xff555555), size: 18,),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: const Color(0xffcccccc))
                      ),
                      child: const Icon(Remix.subtract_line, color: Color(0xff555555), size: 18,),
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 55, 0, 8),
              child: const Text("결성 시 제출서류", style: WidgetUtils.h1Style,),
            ),
            // todo ZIP download button
            const Divider(thickness: 2, color: Color(0xff555555),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("1. 사업자등록증", style: headingStyle,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(54, 0, 8, 0),
                        width: 24,
                        height: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/pdf.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.pdf",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const Text("(123.4KB)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.14,
                            color: Color(0xff999999)
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size(120, 32),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xffcccccc)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("다운로드",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: -0.14,
                                color: Color(0xff333333)
                              ),
                            ),
                            Icon(Remix.download_line, color: Color(0xff333333), size: 15,)
                          ],
                        )
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("바로보기",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.search_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("2. 사업자등록증", style: headingStyle,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(54, 0, 8, 0),
                        width: 24,
                        height: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/pdf.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.pdf",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const Text("(123.4KB)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.14,
                            color: Color(0xff999999)
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("다운로드",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.download_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("바로보기",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.search_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 55, 0, 8),
              child: const Text("운용 중 제출서류", style: WidgetUtils.h1Style,),
            ),
            // todo ZIP download button
            const Divider(thickness: 2, color: Color(0xff555555),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("1. 사업자등록증", style: headingStyle,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(54, 0, 8, 0),
                        width: 24,
                        height: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/pdf.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.pdf",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const Text("(123.4KB)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.14,
                            color: Color(0xff999999)
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("다운로드",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.download_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("바로보기",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.search_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 23, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("2. 사업자등록증", style: headingStyle,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(54, 0, 8, 0),
                        width: 24,
                        height: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/images/pdf.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.pdf",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      const Text("(123.4KB)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.14,
                            color: Color(0xff999999)
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("다운로드",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.download_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(120, 32),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffcccccc)),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("바로보기",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              ),
                              Icon(Remix.search_line, color: Color(0xff333333), size: 15,)
                            ],
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
              child: WidgetUtils().buttonBar("목록", "저장", () => null, () => null),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", "조합원 관리"]
    );
  }

}