import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class EditFundVisibilityScreen extends StatefulWidget {

  final Fund fund;

  const EditFundVisibilityScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => EditFundVisibilityScreenState();

}

class EditFundVisibilityScreenState extends State<EditFundVisibilityScreen> {

  var selectedLevel = "VIP";
  var strategy = "UPPER";

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합 보기 권한 설정", style: WidgetUtils.titleStyle,),
            Center(
              child: Container(
                width: 660,
                margin: const EdgeInsets.symmetric(vertical: 55),
                padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(2)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${widget.fund.name} 을 볼 수 있는 권한 설정", style: WidgetUtils.dialogTitleStyle,),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: const Text("아래 정보를 입력해 주세요.\n회원별 등급은 회원관리 페이지에서 설정 가능합니다.", style: WidgetUtils.lightStyle,),
                            )
                          ],
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xfff2f9ff)
                          ),
                          child: const Center(
                            child: Icon(Remix.file_copy_2_line, color: Color(0xff1badfb), size: 32,),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("회원등급", style: WidgetUtils.regularStyle,),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: const Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedLevel,
                                  dropdownColor: const Color(0xfff4f4f4),
                                  focusColor: const Color(0xfff4f4f4),
                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                  items: const [
                                    DropdownMenuItem(value: "VIP", child: Text("VIP")),
                                    DropdownMenuItem(value: "최우수", child: Text("최우수")),
                                    DropdownMenuItem(value: "우수", child: Text("우수")),
                                    DropdownMenuItem(value: "일반", child: Text("일반")),
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedLevel = value ?? "VIP";
                                    });
                                  },
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: const Color(0xff505050),
                          splashRadius: 1,
                          value: "UPPER",
                          groupValue: strategy,
                          onChanged: (value) {
                            setState(() {
                              strategy = "UPPER";
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(6, 0, 20, 0),
                          child: const Text("보다 높은 등급의 모든 회원이", style: WidgetUtils.boldStyle),
                        ),
                        Radio(
                          activeColor: const Color(0xff505050),
                          splashRadius: 1,
                          value: "EXACT",
                          groupValue: strategy,
                          onChanged: (value) {
                            setState(() {
                              strategy = "EXACT";
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: const Text("등급의 회원만", style: WidgetUtils.boldStyle),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 32),
                      alignment: Alignment.centerLeft,
                      child: const Text("볼 수 있게 설정합니다.", style: WidgetUtils.regularStyle),
                    ),
                    WidgetUtils().buttonBar("취소", "저장",
                            () => Get.back(),
                            () {
                              // todo post API
                              Get.back();
                            },
                      align: MainAxisAlignment.end
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", widget.fund.name, "조합 보기 권한 설정"]
    );
  }

}