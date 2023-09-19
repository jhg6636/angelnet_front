import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/common/post.dart';
import '../not_developed_screen.dart';

class PostViewScreen extends StatefulWidget {

  final String bulletinName;
  final Post post;
  final bool isAdmin;

  const PostViewScreen({
    super.key,
    required this.bulletinName,
    required this.post,
    required this.isAdmin,
  });

  @override
  State<StatefulWidget> createState() => PostViewScreenState();

}

class PostViewScreenState extends State<PostViewScreen> {

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
              margin: const EdgeInsets.fromLTRB(0, 21, 0, 24),
              child: const Divider(thickness: 2, color: Color(0xff555555),),
            ),
            const Center(
              child: Text("홈페이지 이용과 관련하여 필수적인 공지사항을 안내드립니다.",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.28,
                  color: Color(0xff191919),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 19, 0, 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("작성일",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.15,
                      color: Color(0xff333333),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: const Text("2023-04-01",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.15,
                        color: Color(0xff757575)
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text("|",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xffaaaaaa)
                      ),
                    ),
                  ),
                  const Text("작성자",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.15,
                      color: Color(0xff333333),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: const Text("홍길동",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.15,
                          color: Color(0xff757575)
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text("|",
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffaaaaaa)
                      ),
                    ),
                  ),
                  const Text("조회수",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.15,
                      color: Color(0xff333333),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: const Text("515",
                      style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.15,
                          color: Color(0xff757575)
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 42, 0, 0),
              padding: const EdgeInsets.symmetric(horizontal: 200),
              child: Text(widget.post.body,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: StringUtils.pretendard,
                  letterSpacing: -0.18,
                  color: Color(0xff333333),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 61, 40, 40),
              padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 30,),
              color: const Color(0xfff6f6f6),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 24,
                            height: 20,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/assets/images/pdf.png'),
                                fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                            child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.pdf",
                              style: TextStyle(
                                fontFamily: StringUtils.pretendard,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                letterSpacing: -0.16,
                                color: Color(0xff333333)
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
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton(
                              style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.fromLTRB(14, 8, 13.6, 8),
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Color(0xffcccccc))
                                  )
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("다운로드",
                                    style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.14,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                  Container(
                                    width: 10.8,
                                    height: 11.4,
                                    margin: const EdgeInsets.fromLTRB(33.6, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('lib/assets/images/download_icon.png'),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  )
                                ],
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                            child: FilledButton(
                                style: FilledButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.fromLTRB(12, 8, 11.81, 8),
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(color: Color(0xffcccccc))
                                    )
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("바로보기",
                                      style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: -0.14,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    Container(
                                      width: 12.19,
                                      height: 12.19,
                                      margin: const EdgeInsets.fromLTRB(36, 0, 0, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('lib/assets/images/search_icon.png'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    )
                                  ],
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 24,
                              height: 20,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/images/img.png'),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                              child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.png",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: -0.16,
                                    color: Color(0xff333333)
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
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton(
                                style: FilledButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.fromLTRB(14, 8, 13.6, 8),
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(color: Color(0xffcccccc))
                                    )
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("다운로드",
                                      style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: -0.14,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    Container(
                                      width: 10.8,
                                      height: 11.4,
                                      margin: const EdgeInsets.fromLTRB(33.6, 0, 0, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('lib/assets/images/download_icon.png'),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                              child: FilledButton(
                                  style: FilledButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.fromLTRB(12, 8, 11.81, 8),
                                      shape: const RoundedRectangleBorder(
                                          side: BorderSide(color: Color(0xffcccccc))
                                      )
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("바로보기",
                                        style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          letterSpacing: -0.14,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                      Container(
                                        width: 12.19,
                                        height: 12.19,
                                        margin: const EdgeInsets.fromLTRB(36, 0, 0, 0),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('lib/assets/images/search_icon.png'),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.isAdmin) OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Color(0xff222222)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                        fixedSize: const Size(120, 50)
                    ),
                    onPressed: () {},
                    child: const Text("수정",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.34,
                        color: Color(0xff222222)
                      ),
                    )
                  ),
                  if (widget.isAdmin) Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 2, color: Color(0xff222222)),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            fixedSize: const Size(120, 50)
                        ),
                        onPressed: () {},
                        child: const Text("삭제",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.34,
                              color: Color(0xff222222)
                          ),
                        )
                    )
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff222222),
                      foregroundColor: const Color(0xff222222),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      fixedSize: const Size(120, 50)
                      // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45)
                    ),
                    onPressed: () {},
                    child: const Text("목록",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: -0.34,
                        color: Colors.white
                      ),
                    )
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 11),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Remix.arrow_up_s_line, color: Color(0xff333333),),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                          child: const Text("이전글",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333)
                            ),
                          ),
                        ),
                        const Text("이전글이 없습니다.",
                          style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xff666666)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xffe6e6e6),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 11),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Remix.arrow_down_s_line, color: Color(0xff333333),),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 40, 0),
                          child: const Text("다음글",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.16,
                                color: Color(0xff333333)
                            ),
                          ),
                        ),
                        const Text("사업계획서 정오표 및 첨부파일 송부",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: -0.16,
                              color: Color(0xff666666)
                          ),
                        )
                      ],
                    ),
                    const Text("2023-03-03",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff666666)
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xffe6e6e6),),
          ],
        ),
      ),
      isAdmin: widget.isAdmin,
      crumbs: const ["게시판", "게시글"]
    );
  }

}