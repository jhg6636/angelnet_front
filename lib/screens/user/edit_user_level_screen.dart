import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:reorderables/reorderables.dart';

class EditUserLevelScreen extends StatefulWidget {

  const EditUserLevelScreen({super.key});

  @override
  State<StatefulWidget> createState() => EditUserLevelScreenState();

}

class EditUserLevelScreenState extends State<EditUserLevelScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("등급 설정", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("일반 등급", style: WidgetUtils.h1Style,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text("드래그 & 드랍으로 순위를 조정할 수 있습니다. 등급명 클릭 시 수정 가능합니다.", style: WidgetUtils.lightStyle,),
                      )
                    ],
                  ),
                  WidgetUtils.buttonFrame(
                    Remix.file_add_line,
                    "등급 생성",
                    () => null
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xff333333), thickness: 2,),
            DataTable(
              columns: [
                DataColumn(label: Text("순위")),
                DataColumn(label: Text("조정")),
                DataColumn(label: Text("등급명")),
                DataColumn(label: Text("삭제")),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text("1")
                    ),
                    DataCell(
                      Row(
                        children: [
                          WidgetUtils.circleButtonFrame(
                            const Color(0xffdddddd),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Remix.arrow_up_line, color: Color(0xff555555), size: 24,)
                            )
                          ),
                          const SizedBox(width: 8,),
                          WidgetUtils.circleButtonFrame(
                              const Color(0xffdddddd),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Remix.arrow_down_line, color: Color(0xff555555), size: 24,)
                              )
                          ),
                        ],
                      )
                    ),
                    DataCell(
                      TextField(
                        controller: TextEditingController(text: "VIP"),
                        decoration: InputDecoration(),
                      )
                    ),
                    DataCell(
                      WidgetUtils.circleButtonFrame(
                        ColorUtils.negativeColor,
                        IconButton(onPressed: () {}, icon: Icon(Remix.close_line, color: Colors.white, size: 24,))
                      )
                    )
                  ]
                )
              ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("특수 등급", style: WidgetUtils.h1Style,),
                  WidgetUtils.buttonFrame(
                      Remix.file_add_line,
                      "등급 생성",
                          () => null
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xff333333), thickness: 2,),
            DataTable(
              columns: const [
                DataColumn(label: Text("등급명")),
                DataColumn(label: Text("삭제")),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text("서울대병원")),
                    DataCell(WidgetUtils.circleButtonFrame(ColorUtils.negativeColor, IconButton(onPressed: () {}, icon: Icon(Remix.close_line, color: Colors.white, size: 24,))))
                  ]
                )
              ]
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["회원관리", "등급 설정"]
    );
  }

}