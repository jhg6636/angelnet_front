import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/common/user_level.dart';

class EditUserLevelScreen extends StatefulWidget {

  const EditUserLevelScreen({super.key});

  @override
  State<StatefulWidget> createState() => EditUserLevelScreenState();

}

class EditUserLevelScreenState extends State<EditUserLevelScreen> {

  var generalLevels = [];
  var specialLevels = [];

  var newLevels = [];
  var changingLevels = [];
  var deletingLevels = [];

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
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: const Text("순위 및 등급명 수정 가능합니다.", style: WidgetUtils.lightStyle,),
                      )
                    ],
                  ),
                  WidgetUtils.buttonFrame(
                    Remix.file_add_line,
                    "등급 생성",
                    () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          var levelController = TextEditingController();
                          return Dialog(
                            child: Container(
                              width: 660,
                              height: 310,
                              padding: const EdgeInsets.fromLTRB(50, 29, 50, 40),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffdddddd))
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("신규로 생성하실 등급명을 입력해주세요.",
                                              style: TextStyle(
                                                fontFamily: StringUtils.pretendard,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                letterSpacing: -0.48,
                                                color: Color(0xff111111),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                              child: const Text("등급명을 입력한 후 저장버튼을 눌러주세요",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: StringUtils.pretendard,
                                                    letterSpacing: -0.16,
                                                    color: Color(0xff767676)
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xfff2f9ff),
                                        ),
                                        child: const Icon(Remix.group_line, color: Color(0xff1badfb), size: 32,),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                    width: 560,
                                    height: 48,
                                    child: TextField(
                                      controller: levelController,
                                      style: const TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        letterSpacing: -0.16,
                                        color: Color(0xff333333),
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "그룹명",
                                        hintStyle: const TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                          letterSpacing: -0.16,
                                          color: Color(0xffaaaaaa),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Color(0xffdddddd)),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetUtils().buttonBar(
                                      "취소",
                                      "저장",
                                      () {
                                        Navigator.pop(context);
                                      },
                                      () async {
                                        Navigator.pop(context);
                                        makeUserLevel(levelController.text, false);
                                        setState(() {});
                                      },
                                      align: MainAxisAlignment.end),
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    }
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xff333333), thickness: 2,),
            FutureBuilder(
              future: getAllUserLevels(),
              builder: (BuildContext context, AsyncSnapshot<List<UserLevel>> snapshot) {
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(child: Text("등급이 없습니다.", style: WidgetUtils.dataTableDataStyle,));
                } else {
                  generalLevels.addAll(snapshot.data ?? []);
                  return SizedBox(
                    width: 1080,
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text("순위")),
                          DataColumn(label: Text("등급명")),
                          DataColumn(label: Text("저장")),
                          DataColumn(label: Text("삭제")),
                        ],
                        rows: snapshot
                            .data!
                            .where((userLevel) => userLevel.priority > -1)
                            .map((userLevel) => userLevel.generalLevelDataRow(context, setState))
                            .toList(),
                    ),
                  );
                }
              }
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
                      () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              var levelController = TextEditingController();
                              return Dialog(
                                child: Container(
                                  width: 660,
                                  height: 310,
                                  padding: const EdgeInsets.fromLTRB(50, 29, 50, 40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: const Color(0xffdddddd))
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 22),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("신규로 생성하실 등급명을 입력해주세요.",
                                                  style: TextStyle(
                                                    fontFamily: StringUtils.pretendard,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    letterSpacing: -0.48,
                                                    color: Color(0xff111111),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: const Text("등급명을 입력한 후 저장버튼을 눌러주세요",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w300,
                                                        fontFamily: StringUtils.pretendard,
                                                        letterSpacing: -0.16,
                                                        color: Color(0xff767676)
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            height: 60,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xfff2f9ff),
                                            ),
                                            child: const Icon(Remix.group_line, color: Color(0xff1badfb), size: 32,),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        width: 560,
                                        height: 48,
                                        child: TextField(
                                          controller: levelController,
                                          style: const TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            letterSpacing: -0.16,
                                            color: Color(0xff333333),
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "그룹명",
                                            hintStyle: const TextStyle(
                                              fontFamily: StringUtils.pretendard,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                              letterSpacing: -0.16,
                                              color: Color(0xffaaaaaa),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Color(0xffdddddd)),
                                                borderRadius: BorderRadius.circular(2)
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Color(0xffdddddd)),
                                                borderRadius: BorderRadius.circular(2)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Color(0xffdddddd)),
                                                borderRadius: BorderRadius.circular(2)
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Color(0xffdddddd)),
                                                borderRadius: BorderRadius.circular(2)
                                            ),
                                          ),
                                        ),
                                      ),
                                      WidgetUtils().buttonBar(
                                          "취소",
                                          "저장",
                                          () {
                                            Navigator.pop(context);
                                          },
                                          () async {
                                            Navigator.pop(context);
                                            makeUserLevel(levelController.text, true);
                                            setState(() {});
                                          },
                                          align: MainAxisAlignment.end
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xff333333), thickness: 2,),
            FutureBuilder(
              future: getAllUserLevels(),
              builder: (BuildContext context, AsyncSnapshot<List<UserLevel>> snapshot) {
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(child: Text("등급이 존재하지 않습니다.", style: WidgetUtils.dataTableDataStyle,),);
                } else {
                  return SizedBox(
                    width: 1080,
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text("등급명")),
                          DataColumn(label: Text("저장")),
                          DataColumn(label: Text("삭제")),
                        ],
                        rows: snapshot
                            .data!
                            .where((userLevel) => userLevel.priority == -1)
                            .map((userLevel) => userLevel.specialLevelDataRow(context, setState))
                            .toList()
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["회원관리", "등급 설정"]
    );
  }

}