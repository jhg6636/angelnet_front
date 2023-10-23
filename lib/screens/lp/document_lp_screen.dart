import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class LpDocumentScreen extends StatefulWidget {

  const LpDocumentScreen({super.key});

  @override
  State<StatefulWidget> createState() => LpDocumentScreenState();

}

class LpDocumentScreenState extends State<LpDocumentScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("서류제출", style: WidgetUtils.titleStyle),
            Container(
              width: 1280,
              height: 83,
              margin: const EdgeInsets.fromLTRB(0, 24, 0, 26),
              alignment: Alignment.center,
              child: DottedBorder(
                color: const Color(0xffb5becc),
                dashPattern: const [3, 3],
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.error_warning_fill, color: Color(0xff00958f), size: 27,),
                      SizedBox(width: 2,),
                      Text("총 N건의 서류제출이 필요합니다.",
                          style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333)
                          )
                      )
                    ],
                  ),
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("총 ", style: WidgetUtils.regularStyle,),
                    Text("N", style: WidgetUtils.boldStyle,),
                    Text("건", style: WidgetUtils.regularStyle,),
                  ],
                ),
                Container(
                  height: 37,
                  padding: const EdgeInsets.fromLTRB(24, 0, 15, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: const Color(0xfff4f4f4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: [],
                      onChanged: (value) {
                        
                      }
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8,)
          ],
        ),
      ),
      isAdmin: false,
      crumbs: const ["서류제출"]
    );
  }

}