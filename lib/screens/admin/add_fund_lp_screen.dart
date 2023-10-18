import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class AddFundLpFirstScreen extends StatefulWidget {

  final Fund fund;
  const AddFundLpFirstScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => AddFundLpFirstScreenState();

}

class AddFundLpFirstScreenState extends State<AddFundLpFirstScreen> {

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합원 추가", style: WidgetUtils.titleStyle,),
            Center(
              child: Container(
                width: 660,
                height: 320,
                padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("신규로 추가하실 조합원 이름을 입력해 주세요.",
                              style: WidgetUtils.dialogTitleStyle
                            ),
                            Text("이름 입력 후 다음 버튼을 클릭 시 조합원을 선택할 수 있습니다.",
                              style: WidgetUtils.dialogSubStyle
                            )
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff2f9ff),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Remix.file_copy_2_line, color: Color(0xff1badfb), size: 32,),
                        )
                      ],
                    ),
                    Container(
                      width: 560,
                      height: 48,
                      margin: const EdgeInsets.fromLTRB(0, 41, 0, 35),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "이름",
                          hintStyle: WidgetUtils.textInputHintStyle,
                        ),
                        style: WidgetUtils.textInputTextStyle,
                      ),
                    ),
                    WidgetUtils().buttonBar(
                      "취소",
                      "다음",
                      () {
                        Get.back();
                      },
                      () {
                        Get.to(AddFundLpSecondScreen(fund: widget.fund, lpName: nameController.text));
                      },
                      align: MainAxisAlignment.end
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", widget.fund.name, "조합원 추가"]
    );
  }

}


class AddFundLpSecondScreen extends StatefulWidget {

  final Fund fund;
  final String lpName;
  const AddFundLpSecondScreen({super.key, required this.fund, required this.lpName});

  @override
  State<StatefulWidget> createState() => AddFundLpSecondScreenState();

}

class AddFundLpSecondScreenState extends State<AddFundLpSecondScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합원 추가", style: WidgetUtils.titleStyle,),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                width: 660,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("아래 인원 중 추가하실 조합원을 선택해 주세요.", style: WidgetUtils.dialogTitleStyle),
                            Text("추가하고자 하는 인원 우측에 좌수를 입력하시면 조합원으로 추가됩니다.", style: WidgetUtils.dialogSubStyle)
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff2f9ff),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Remix.file_copy_2_line, color: Color(0xff1badfb), size: 32,),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", widget.fund.name, "조합원 추가"]
    )
  }

}