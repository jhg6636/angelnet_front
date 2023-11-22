import 'package:angelnet/utils/ColorUtils.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

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
  static const dataTableHeadStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff222222),
  );
  static const dataTableDataStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff757575)
  );

  static const tableBorder = TableBorder(
    top: BorderSide(color: Color(0xff555555), width: 2),
    horizontalInside: BorderSide(color: Color(0xffdddddd)),
    bottom: BorderSide(color: Color(0xffdddddd)),
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

  static const dialogTitleStyle = TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: -0.48,
      color: Color(0xff222222)
  );
  static const lightStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff333333),
    fontWeight: FontWeight.w300,
  );
  static const regularStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff333333),
    fontWeight: FontWeight.w400,
  );
  static const semiBoldStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff333333),
    fontWeight: FontWeight.w600,
  );
  static const boldStyle = TextStyle(
    fontFamily: StringUtils.pretendard,
    fontSize: 16,
    letterSpacing: -0.16,
    color: Color(0xff333333),
    fontWeight: FontWeight.bold,
  );

  static const textInputHintStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    letterSpacing: -0.16,
    fontFamily: StringUtils.pretendard,
    color: Color(0xffaaaaaa),
  );
  static const textInputTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.16,
    fontFamily: StringUtils.pretendard,
    color: Color(0xff555555),
  );
  static const statusBoxWhiteStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: -0.45,
    fontFamily: StringUtils.pretendard,
    color: Colors.white
  );
  static const headingStyle = TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.w500,
      fontSize: 17,
      letterSpacing: -0.17,
      color: Color(0xff333333)
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

  Widget buttonBar(String button1, String button2, Function() action1, Function() action2, {MainAxisAlignment align = MainAxisAlignment.center}) {
    return ButtonBar(
      alignment: align,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xff222222), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            fixedSize: const Size(120, 50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.white
          ),
          onPressed: action1,
          child: Text(button1,
            style: const TextStyle(
              fontFamily: StringUtils.pretendard,
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: -0.34,
              color: Color(0xff222222)
            ),
          )
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            fixedSize: const Size(120, 50),
            backgroundColor: const Color(0xff222222),
            foregroundColor: const Color(0xff222222),
          ),
          onPressed: action2,
          child: Text(button2,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: StringUtils.pretendard,
              letterSpacing: -0.34,
              color: Colors.white
            ),
          )
        )
      ],
    );
  }

  static Widget errorMessage(String msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 15.98,
          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          // decoration: const BoxDecoration(
          //   shape: BoxShape.circle,
          //   color: Color(0xffffe834)
          // ),
          alignment: Alignment.center,
          child: const Icon(Remix.error_warning_fill, color: ColorUtils.negativeColor, size: 16,),
        ),
        Text(msg, style: const TextStyle(
          fontFamily: StringUtils.pretendard,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          letterSpacing: -0.15,
          color: ColorUtils.negativeColor,
        ),)
      ],
    );
  }

  static Widget okMessage(String msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 15.98,
          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          // decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Color(0xff01dfa5)
          // ),
          alignment: Alignment.center,
          child: const Icon(Remix.checkbox_circle_fill, color: ColorUtils.positiveColor, size: 16,),
        ),
        Text(msg, style: const TextStyle(
          fontFamily: StringUtils.pretendard,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          letterSpacing: -0.15,
          color: ColorUtils.positiveColor,
        ),)
      ],
    );
  }

  static Widget circleButtonFrame(Color color, IconButton button) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        // border: Border.all(color: )
      ),
      child: button
    );
  }

  static BoxDecoration textFieldBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(2),
    border: Border.all(color: const Color(0xffdddddd)),
  );

  Widget fileRowWithIcon(String url, int textSize, Function() downloadAction, bool fromServer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              child: const Icon(Remix.file_text_line, color: Color(0xff555555), size: 24,),
            ),
            Text((url.isEmpty)? "파일이 없습니다." : StringUtils.shorten(url, textSize),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: StringUtils.pretendard,
                letterSpacing: -0.16,
                color: Color(0xff555555),
              ),
            )
          ],
        ),
        if (url.isNotEmpty && fromServer) IconButton(
          onPressed: downloadAction,
          splashColor: Colors.transparent,
          splashRadius: 1,
          padding: const EdgeInsets.all(0),
          icon: const Icon(Remix.download_line, color: Color(0xff999999), size: 24,),
        )
      ],
    );
  }

  Widget dataTableCountRow(Future<List<dynamic>> future) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("총 ", style: WidgetUtils.lightStyle,),
        FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasError) {
              StringUtils().printError(snapshot);
              return const Text("0", style: WidgetUtils.boldStyle,);
            } else if (!snapshot.hasData) {
              return const Text("0", style: WidgetUtils.boldStyle,);
            } else {
              return Text(snapshot.data!.length.toString(), style: WidgetUtils.boldStyle,);
            }
          },
        ),
        const Text("건", style: WidgetUtils.lightStyle,),
      ],
    );
  }

  static Widget moreButton(Function() onTap) {
    return InkWell(
      onTap: onTap,
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
    );
  }

}