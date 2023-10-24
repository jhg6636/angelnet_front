import 'package:angelnet/models/lp/fund_document_submission.dart';
import 'package:angelnet/screens/lp/document_lp_screen.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class DocumentSubmitScreen extends StatefulWidget {

  final String documentTitle;
  final int documentId;

  const DocumentSubmitScreen({super.key, required this.documentTitle, required this.documentId});

  @override
  State<StatefulWidget> createState() => DocumentSubmitScreenState();

}

class DocumentSubmitScreenState extends State<DocumentSubmitScreen> {
  String? pickedFile;

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("서류제출", style: WidgetUtils.titleStyle,),
            Center(
              child:             Container(
                width: 662,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 44, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.documentTitle} 를 제출해 주세요.", style: WidgetUtils.dialogTitleStyle,),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: const Text("아래에서 양식 및 기존 파일 클릭 시 다운로드 할 수 있어요.\n제출 파일 옆 파일찾기를 통해 파일을 업로드할 수 있어요.",
                                  style: WidgetUtils.lightStyle,
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff2f9ff)
                            ),
                            child: const Icon(Remix.file_copy_2_line, color: Color(0xff1badfb), size: 32,),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      FutureBuilder(
                          future: downloadTemplate(widget.documentId),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasError) {
                              StringUtils().printError(snapshot);
                              return WidgetUtils().fileRowWithIcon("", 20);
                            } else if (!snapshot.hasData) {
                              return WidgetUtils().fileRowWithIcon("", 20);
                            } else {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("양식", style: WidgetUtils.semiBoldStyle,),
                                  Container(
                                    width: 490,
                                    margin: const EdgeInsets.fromLTRB(42, 0, 0, 0),
                                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(color: const Color(0xffdddddd))
                                    ),
                                    child: WidgetUtils().fileRowWithIcon(snapshot.data ?? "", 20),
                                  )
                                ],
                              );
                            }
                          }
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: FutureBuilder(
                          future: downloadRecentFile(widget.documentId),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasError) {
                              StringUtils().printError(snapshot);
                              return WidgetUtils().fileRowWithIcon("", 20);
                            } else if (!snapshot.hasData) {
                              return WidgetUtils().fileRowWithIcon("", 20);
                            } else if (snapshot.data != "") {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("기존 파일", style: WidgetUtils.semiBoldStyle,),
                                  Container(
                                    width: 490,
                                    margin: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(color: const Color(0xffdddddd))
                                    ),
                                    child: WidgetUtils().fileRowWithIcon(snapshot.data ?? "", 20),
                                  )
                                ],
                              );
                            } else {
                              return WidgetUtils().fileRowWithIcon("", 20);
                            }
                          },
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("제출 파일", style: WidgetUtils.semiBoldStyle,),
                          Container(
                              width: 360,
                              height: 48,
                              margin: const EdgeInsets.fromLTRB(11, 0, 10, 0),
                              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 14),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(color: const Color(0xffdddddd))
                              ),
                              child: pickedFile == null?
                              const Text("파일명", style: WidgetUtils.textInputHintStyle) :
                              WidgetUtils().fileRowWithIcon(pickedFile!, 15)
                          ),
                          FilledButton(
                              style: FilledButton.styleFrom(
                                  foregroundColor: const Color(0xff6c6f81),
                                  backgroundColor: const Color(0xff6c6f81),
                                  fixedSize: const Size(120, 48),
                                  alignment: Alignment.center,
                                  shape: const RoundedRectangleBorder()
                              ),
                              onPressed: () {
                                // todo File Picker open
                              },
                              child: const Text("파일찾기",
                                style: TextStyle(
                                  letterSpacing: -0.32,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: StringUtils.pretendard,
                                  color: Colors.white,
                                ),
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      WidgetUtils().buttonBar("취소", "저장", () => Get.back(),
                              () {
                            // todo upload API
                            Get.to(const LpDocumentScreen());
                          },
                          align: MainAxisAlignment.end
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      isAdmin: false,
      crumbs: ["서류제출", widget.documentTitle]
    );
  }

}