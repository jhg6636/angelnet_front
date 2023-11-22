import 'dart:typed_data';

import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/models/lp/fund_document_submission.dart';
import 'package:angelnet/screens/lp/document_lp_screen.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/FileUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/file/file.dart';

class DocumentSubmitScreen extends StatefulWidget {
  final String documentTitle;
  final int documentId;

  const DocumentSubmitScreen(
      {super.key, required this.documentTitle, required this.documentId});

  @override
  State<StatefulWidget> createState() => DocumentSubmitScreenState();
}

class DocumentSubmitScreenState extends State<DocumentSubmitScreen> {
  PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
        main: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "서류제출",
                style: WidgetUtils.titleStyle,
              ),
              Center(
                child: Container(
                  width: 662,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 44, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
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
                                Text(
                                  "${widget.documentTitle} 를(을) 제출해 주세요.",
                                  style: WidgetUtils.dialogTitleStyle,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text(
                                    "아래에서 양식 및 기존 파일 클릭 시 다운로드 할 수 있어요.\n제출 파일 옆 파일찾기를 통해 파일을 업로드할 수 있어요.",
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
                                  color: Color(0xfff2f9ff)),
                              child: const Icon(
                                Remix.file_copy_2_line,
                                color: Color(0xff1badfb),
                                size: 32,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                            future: getTemplateFileMetadata(widget.documentId),
                            builder: (BuildContext context,
                                AsyncSnapshot<File> snapshot) {
                              if (snapshot.hasError) {
                                StringUtils().printError(snapshot);
                                return Container();
                              } else if (!snapshot.hasData) {
                                return Container();
                              } else {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "양식",
                                      style: WidgetUtils.semiBoldStyle,
                                    ),
                                    Container(
                                      width: 490,
                                      height: 48,
                                      margin: const EdgeInsets.fromLTRB(
                                          42, 0, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: const Color(0xffdddddd))),
                                      child: WidgetUtils().fileRowWithIcon(
                                          snapshot.data!.name, 60, () async {
                                        saveByteArrayAsFile(
                                            await downloadByteArray(
                                                snapshot.data!.id),
                                            snapshot.data!.name);
                                      }, true),
                                    )
                                  ],
                                );
                              }
                            }),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: FutureBuilder(
                            future: getRecentFileMetadata(widget.documentId,
                                FileTarget.fundDocumentSubmission),
                            builder: (BuildContext context,
                                AsyncSnapshot<File> snapshot) {
                              if (snapshot.hasError) {
                                StringUtils().printError(snapshot);
                                return Container();
                              } else if (!snapshot.hasData) {
                                return Container();
                              } else {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "기존 파일",
                                      style: WidgetUtils.semiBoldStyle,
                                    ),
                                    Container(
                                      width: 490,
                                      margin: const EdgeInsets.fromLTRB(
                                          11, 0, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 9),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: const Color(0xffdddddd))),
                                      child: WidgetUtils().fileRowWithIcon(
                                          snapshot.data!.name, 60, () async {
                                        saveByteArrayAsFile(
                                            await downloadByteArray(
                                                snapshot.data!.id),
                                            snapshot.data!.name);
                                      }, true),
                                    )
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "제출 파일",
                              style: WidgetUtils.semiBoldStyle,
                            ),
                            Container(
                                width: 360,
                                height: 48,
                                margin: const EdgeInsets.fromLTRB(11, 0, 10, 0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 14),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: const Color(0xffdddddd))),
                                child: pickedFile == null
                                    ? const Text("파일명",
                                        style: WidgetUtils.textInputHintStyle)
                                    : WidgetUtils().fileRowWithIcon(
                                        pickedFile!.name, 50, () {}, false)),
                            FilledButton(
                                style: FilledButton.styleFrom(
                                    foregroundColor: const Color(0xff6c6f81),
                                    backgroundColor: const Color(0xff6c6f81),
                                    fixedSize: const Size(120, 48),
                                    alignment: Alignment.center,
                                    shape: const RoundedRectangleBorder()),
                                onPressed: () async {
                                  var filePickResult =
                                  await FileUtils().pickAnyFile();
                                  pickedFile =
                                      filePickResult?.files.firstOrNull;
                                  setState(() {});
                                },
                                child: Text(
                                  (pickedFile == null) ? "파일찾기" : "파일변경",
                                  style: const TextStyle(
                                    letterSpacing: -0.32,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: StringUtils.pretendard,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(height: 15),
                        WidgetUtils().buttonBar("취소", "저장", () => Get.back(),
                            () async {
                          var submissionResponse = await submit(widget.documentId);
                          upload(
                            pickedFile?.bytes ?? Uint8List(0),
                            File(
                              id: -1,
                              name: pickedFile?.name ?? "temp.${pickedFile?.extension}",
                              targetType: FileTarget.fundDocumentSubmission,
                              targetId: int.parse(submissionResponse.body),
                            ),
                          );
                          // todo upload API
                          Get.to(const LpDocumentScreen());
                        }, align: MainAxisAlignment.end)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isAdmin: false,
        crumbs: ["서류제출", widget.documentTitle]);
  }
}
