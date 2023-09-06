import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'StringUtils.dart';

/**
 * 프리텐다드 글꼴
 * 100 : Thin
 * 200 : Extralight
 * 300 : Light
 * 400 : Regular
 * 500 : Medium
 * 600 : Semibold
 * 700 : Bold
 * 800 : Extrabold
 * 900 : Black
 */

class WidgetUtils {

  static const mobileWidth = 900;

  static const errorPadding = Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("무엇인가 잘못됨"),
  );

  final appBar = AppBar(
    title: const Text(
      "AngelNet", style: TextStyle(fontSize: 36.0, fontFamily: 'Sriracha'),),
    centerTitle: true,
  );

  static const pretendard = TextStyle(
      fontFamily: "Pretendard", fontSize: 17.0, fontWeight: FontWeight.w400);

  static const h1Deprecated = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500);
  static const h1Style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.2,
      color: Color(0xff333333)
  );

  static const smallPadding = EdgeInsets.all(32.0);

  static const drawerWidth = 300.0;

  static const drawerButtonStyle = TextStyle(fontSize: 24.0);

  static const titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 50,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.1,
      color: Color(0xff111111)
  );

  static Widget fnb = Container(
    height: 204,
    padding: const EdgeInsets.fromLTRB(320, 0, 0, 0),
    color: const Color(0xff272E39),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("개인정보처리방침",
              style: TextStyle(
                  color: Color(0xff1BADFB),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Pretendard",
                  letterSpacing: -0.32
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: const Text("|",
                style: TextStyle(
                  color: Color(0x1affffff),
                ),
              ),
            ),
            const Text("이메일무단수집거부",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Pretendard",
                  letterSpacing: -0.32
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            children: [
              const Text("대전본사",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.32
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("대전 유성구 대학로 99 충남대학교, 대전 팁스타운 506호",
                      style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.32
                      )
                  )
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                  child: const Text("TEL",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.32
                      )
                  )
              ),
              const Text(" 042-710-7177",
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32
                  )
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("FAX",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.32
                      )
                  )
              ),
              const Text(" 0507-0307-2001",
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.32
                  )
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            children: [
              const Text("서울지사",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.32
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("서울 강남구 역삼로 165 해성빌딩 팁스타운S1 5층 D호실",
                      style: TextStyle(
                          color: Color(0xff999999),
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.32
                      )
                  )
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: const Text("Copyright 2023 Angelnet. All Rights Reserved.",
            style: TextStyle(
                color: Color(0xff999999),
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Pretendard",
                letterSpacing: -0.32
            ),
          ),
        )
      ],
    ),
  );

  Widget futureBuilderWidget(AsyncSnapshot<dynamic> snapshot, Widget widget) {
    if (snapshot.hasError) {
      return errorPadding;
    } else if (!snapshot.hasData) {
      return const CircularProgressIndicator();
    } else {
      return widget;
    }
  }

  Widget wrapAsDualScrollWidget(Widget widget) {
    final vertical = ScrollController();
    final horizontal = ScrollController();
    return Scrollbar(
        controller: vertical,
        child: SingleChildScrollView(
          controller: vertical,
          child: Scrollbar(
            controller: horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: horizontal,
              child: widget,
            ),
          ),
        )
    );
  }

  bool isMobile(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width < mobileWidth;
  }

}