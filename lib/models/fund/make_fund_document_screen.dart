import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/fund/fund_document_type.dart';
import 'package:angelnet/screens/admin/fund_detail_admin_screen.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class MakeFundDocumentScreen extends StatefulWidget {

  final Fund fund;

  const MakeFundDocumentScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => MakeFundDocumentScreenState();

}

class MakeFundDocumentScreenState extends State<MakeFundDocumentScreen> {
  List<String> documentTypes = FundDocumentType.values.map((value) => value.korean).toList();
  String selectedDocumentType = "결성";
  final titleController = TextEditingController();
  String? selectedFileName;

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("서류 추가", style: WidgetUtils.titleStyle,),
            Center(
              child: Container(
                width: 660,
                margin: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffdddddd)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("신규로 추가하실 서류 정보를 입력해 주세요.", style: WidgetUtils.dialogTitleStyle,),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: const Text("아래 정보를 모두 입력한 후 저장 버튼을 눌러 주세요. (파일 추후 수정 가능)", style: WidgetUtils.lightStyle,),
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
                          alignment: Alignment.center,
                          child: const Icon(Remix.file_copy_2_line, color: Color(0xff1badfb), size: 24,),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 27, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("구분", style: WidgetUtils.semiBoldStyle,),
                          Container(
                            height: 37,
                            margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                            padding: const EdgeInsets.fromLTRB(24, 9, 16, 9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: const Color(0xff0361f9),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedDocumentType,
                                items: documentTypes.map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: StringUtils.pretendard
                                    ),
                                  ),
                                )).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) selectedDocumentType = value;
                                  });
                                },
                                iconEnabledColor: Colors.white,
                                iconDisabledColor: Colors.grey,
                                dropdownColor: const Color(0xff0361f9),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: StringUtils.pretendard
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 560,
                      // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: WidgetUtils.textFieldBoxDecoration,
                      child: TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                          border: InputBorder.none,
                          hintText: "제목",
                          hintStyle: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontSize: 16,
                            letterSpacing: -0.16,
                            color: Color(0xffaaaaaa),
                            fontWeight: FontWeight.w300,
                          )
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 430,
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          decoration: WidgetUtils.textFieldBoxDecoration,
                          padding: const EdgeInsets.all(15),
                          child: (selectedFileName == null)? const Text("파일명",
                            style: TextStyle(
                              fontFamily: StringUtils.pretendard,
                              fontSize: 16,
                              letterSpacing: -0.16,
                              color: Color(0xffaaaaaa),
                              fontWeight: FontWeight.w300,
                            )
                          ) : Text(selectedFileName!, style: WidgetUtils.regularStyle,)
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            foregroundColor: ColorUtils.actionColor,
                            backgroundColor: ColorUtils.actionColor,
                            fixedSize: const Size(120, 48),
                            shape: const RoundedRectangleBorder()
                          ),
                          onPressed: () {
                            // todo File Picker
                          },
                          child: const Text("파일찾기",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.32,
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                      child: WidgetUtils().buttonBar("취소", "저장", () {
                          Get.back();
                        }, () {
                          // todo post api
                          Get.to(FundDetailAdminScreen(fund: widget.fund));
                        },
                        align: MainAxisAlignment.end
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", widget.fund.name, "서류 생성"]
    );
  }

}