import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';
import '../../utils/custom_border_clipper.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => SendNotificationScreenState();
}

class SendNotificationScreenState extends State<SendNotificationScreen> {
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
        main: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "알림",
                style: WidgetUtils.titleStyle,
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    children: [
                      Flexible(
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 640,
                                  height: 62,
                                  decoration: const BoxDecoration(
                                      color: Color(0xfff9f9f9),
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                      )),
                                  child: const Center(
                                    child: Text(
                                      "받은 알림함",
                                      style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff282728),
                                          letterSpacing: -0.17),
                                    ),
                                  )))),
                      Flexible(
                          child: InkWell(
                            onTap: () {},
                            child: ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  width: 640,
                                  height: 62,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xff1173f9), width: 2),
                                          left: BorderSide(
                                              color: Color(0xff1173f9), width: 2),
                                          right: BorderSide(
                                              color: Color(0xff1173f9), width: 2))),
                                  child: const Center(
                                    child: Text(
                                      "알림보내기",
                                      style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1173f9),
                                          letterSpacing: -0.17),
                                    ),
                                  )
                              ),
                            ),
                          )
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 35, 0, 20),
                padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "받는이",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.38,
                              color: Color(0xff002997),
                            ),
                          ),
                          Container(
                            height: 36,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            padding: const EdgeInsets.fromLTRB(17, 0, 14, 0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Color(0xffcccccc)),
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10)
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: const Icon(Remix.user_add_line, color: Color(0xff333333), size: 16,),
                                  ),
                                  const Text("조합원 추가",
                                    style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.14,
                                      color: Color(0xff333333),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1100,
                      child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffdddddd)),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          margin: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                          padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("김철수(kimcs3937)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: StringUtils.pretendard,
                                        letterSpacing: -0.16,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xfff2f2f2)
                                        ),
                                        child: const Icon(Remix.close_line,
                                          size: 14,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                                  child: Row(
                                    children: [
                                      const Text("홍길동(honggildong1994)",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringUtils.pretendard,
                                          letterSpacing: -0.16,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {},
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                          padding: const EdgeInsets.all(3),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xfff2f2f2)
                                          ),
                                          child: const Icon(Remix.close_line,
                                            size: 14,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                                  child: Row(
                                    children: [
                                      const Text("한이랑(han2938)",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringUtils.pretendard,
                                          letterSpacing: -0.16,
                                          color: Color(0xff333333),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {},
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                          padding: const EdgeInsets.all(3),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xfff2f2f2)
                                          ),
                                          child: const Icon(Remix.close_line,
                                            size: 14,
                                            color: Color(0xff696969),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ),
                  ],
                ),
              ),
              const DottedLine(dashLength: 3, dashGapLength: 3, dashColor: Color(0xffdddddd),),
              Container(
                padding: const EdgeInsets.fromLTRB(98, 0, 0, 0),
                // margin: const EdgeInsets.fromLTRB(0, 35, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("내용",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.38,
                          color: Color(0xff002997),
                        ),
                      ),
                    ),
                    Container(
                        width: 929,
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffdddddd)),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        margin: const EdgeInsets.fromLTRB(92, 20, 0, 50),
                        padding: const EdgeInsets.fromLTRB(30, 20, 48, 20),
                        child: SingleChildScrollView(
                          child: TextField(
                            controller: bodyController,
                            maxLines: null,
                            style: const TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: -0.16,
                              color: Color(0xff555555)
                            ),
                            decoration: const InputDecoration(
                              hintText: "내용을 입력하세요",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                letterSpacing: -0.16,
                                color: Color(0x80555555),
                                fontWeight: FontWeight.w400,
                                fontFamily: StringUtils.pretendard
                              ),
                              border: InputBorder.none
                            ),
                          )
                        )
                    )
                  ],
                ),
              ),
              WidgetUtils().buttonBar("취소", "보내기", () {}, () {})
            ],
          ),
        ),
        isAdmin: true,
        crumbs: ['알림']);
  }
}
