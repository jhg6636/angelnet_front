import 'package:angelnet/models/admin/group.dart';
import 'package:angelnet/screens/admin/manage_group_screen.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class MakeGroupScreen extends StatefulWidget {

  const MakeGroupScreen({super.key});

  @override
  State<StatefulWidget> createState() => MakeGroupScreenState();

}

class MakeGroupScreenState extends State<MakeGroupScreen> {

  final groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(320, 0, 0, 50),
            child: const Text("그룹관리", style: WidgetUtils.titleStyle,),
          ),
          Center(
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
                            const Text("신규로 생성하실 그룹명을 입력해주세요.",
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
                              child: const Text("그룹명을 입력한 후 저장버튼을 눌러주세요",
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
                      controller: groupNameController,
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
                        Get.to(const ManageGroupScreen());
                      },
                      () async {
                        await makeGroup(groupNameController.text);
                        Get.to(const ManageGroupScreen());
                      },
                      align: MainAxisAlignment.end),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
      isAdmin: true,
      crumbs: const ["그룹관리", "그룹 생성"]
    );
  }

}