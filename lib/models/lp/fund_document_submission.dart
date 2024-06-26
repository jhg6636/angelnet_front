import 'dart:convert';
import 'dart:typed_data';

import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/models/fund/fund_document_type.dart';
import 'package:angelnet/models/lp/fund_document_status.dart';
import 'package:angelnet/screens/lp/document_submit_screen.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/FileUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../file/file.dart';

class FundDocumentSubmission {

  final int? id;
  final int documentId;
  final int lpId;
  final String userName;
  final String fundName;
  final String documentTitle;
  final FundDocumentStatus status;
  final DateTime? submittedAt;
  final DateTime? reviewedAt;

  const FundDocumentSubmission({
    required this.id,
    required this.documentId,
    required this.lpId,
    required this.userName,
    required this.fundName,
    required this.documentTitle,
    required this.status,
    required this.submittedAt,
    required this.reviewedAt,
  });

  DataRow toDataRow(int index) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(fundName)),
      DataCell(Text(documentTitle)),
      DataCell(status.statusWidget()),
      DataCell(Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xfff2f2f2),
          // border: Border.all(color: )
        ),
        child: IconButton(
          alignment: Alignment.center,
          splashRadius: 18,
          tooltip: "양식 다운로드",
          onPressed: () async {
            var file = await getTemplateFileMetadata(documentId);
            download(file.id, documentTitle);
          },
          icon: const Icon(
            Remix.download_line,
            size: 16,
            color: Color(0xff333333),
          ),
        ),
      )),
      DataCell(
        status.dataTableDocumentButtonWidget(
          () async {
            print(id);
            var file = await getSubmissionFileMetadata(id ?? -1);
            download(file.id, "${userName}_제출_$documentTitle");
          },
          () {
            Get.to(DocumentSubmitScreen(documentId: documentId, documentTitle: documentTitle,));
          }
        )
      ),
      DataCell(
        Text(submittedAt == null? "-" : DateFormat("yyyy-MM-dd hh:mm:ss").format(submittedAt!)),
      ),
      DataCell(
        Text(reviewedAt == null? "-" : DateFormat("yyyy-MM-dd hh:mm:ss").format(reviewedAt!))
      )
    ]);
  }

  Widget toTextWidgetWithIcon() {
    return Row(
      children: [
        Container(
          width: 30,
          margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
          child: const Icon(Remix.file_text_line, color: Color(0xff333333), size: 24,),
        ),
        Text(documentTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: StringUtils.pretendard,
            letterSpacing: -0.16,
            color: Color(0xff555555),
          ),
        )
      ],
    );
  }

  DataRow toAdminDataRow(int index, BuildContext context, Function(Function ()) setState) {
    return DataRow(
      cells: [
        DataCell(Text(index.toString())),
        DataCell(Text(userName)),
        DataCell(status.statusWidget()),
        DataCell((status == FundDocumentStatus.notSubmitted)? const Text("-") :
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff2f2f2),
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "다운로드",
              onPressed: () async {
                var file = await getSubmissionFileMetadata(id ?? -1);
                download(file.id, "${userName}_제출_$documentTitle");
              },
              icon: const Icon(
                Remix.download_line,
                size: 18,
                color: Color(0xff555555),
              ),
            ),
          )
        ),
        DataCell(Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (status == FundDocumentStatus.accepted || status == FundDocumentStatus.reviewing)?
                  ColorUtils.green : const Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "승인",
                onPressed: (status == FundDocumentStatus.notSubmitted)? null : () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          width: 660,
                          height: 300,
                          padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("제출하신 서류를 승인합니다.", style: WidgetUtils.dialogTitleStyle),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: const Text("추후 승인 여부는 수정하실 수 있습니다.", style: WidgetUtils.lightStyle),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff04b45f),
                                        shape: BoxShape.circle
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(Remix.check_line, color: Colors.white, size: 28,),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 75,),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: ColorUtils.green, width: 2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          fixedSize: const Size(120, 50),
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.white
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("취소",
                                        style: TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            letterSpacing: -0.34,
                                            color: ColorUtils.green
                                        ),
                                      )
                                  ),
                                  FilledButton(
                                      style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        fixedSize: const Size(120, 50),
                                        backgroundColor: ColorUtils.green,
                                        foregroundColor: ColorUtils.green,
                                      ),
                                      onPressed: () async {
                                        await review(id!, true, null);
                                        Navigator.pop(context);
                                        setState;
                                      },
                                      child: const Text("승인",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: StringUtils.pretendard,
                                            letterSpacing: -0.34,
                                            color: Colors.white
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ]
                          ),
                        )
                      );
                    }
                  );
                },
                icon: Icon(
                  Remix.check_line,
                  size: 20,
                  color: (status == FundDocumentStatus.accepted || status == FundDocumentStatus.reviewing)?
                    Colors.white : const Color(0xff999999),
                ),
              ),
            ),
            const SizedBox(width: 28,),
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (status == FundDocumentStatus.rejected || status == FundDocumentStatus.reviewing)?
                  ColorUtils.negativeColor : const Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "반려",
                onPressed: (status == FundDocumentStatus.notSubmitted)? null : () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        final reasonController = TextEditingController();
                        return AlertDialog(
                            content: Container(
                              width: 660,
                              height: 300,
                              padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
                              child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text("제출하신 서류를 반려합니다.", style: WidgetUtils.dialogTitleStyle),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                              child: const Text("추후 승인 여부는 수정하실 수 있습니다. 하단에 사유를 기입해 주세요.", style: WidgetUtils.lightStyle),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              color: ColorUtils.negativeColor,
                                              shape: BoxShape.circle
                                          ),
                                          alignment: Alignment.center,
                                          child: const Icon(Remix.close_line, color: Colors.white, size: 30,),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 560,
                                      margin: const EdgeInsets.symmetric(vertical: 15),
                                      child: TextField(
                                        controller: reasonController,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(15),
                                          hintText: "사유",
                                          hintStyle: WidgetUtils.textInputHintStyle,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: ColorUtils.negativeColor)
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: ColorUtils.negativeColor)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: ColorUtils.negativeColor)
                                          ),
                                        ),
                                        style: WidgetUtils.regularStyle,
                                      ),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.center,
                                      children: [
                                        OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                side: const BorderSide(color: ColorUtils.negativeColor, width: 2),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                fixedSize: const Size(120, 50),
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.white
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("취소",
                                              style: TextStyle(
                                                  fontFamily: StringUtils.pretendard,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  letterSpacing: -0.34,
                                                  color: ColorUtils.green
                                              ),
                                            )
                                        ),
                                        FilledButton(
                                            style: FilledButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              fixedSize: const Size(120, 50),
                                              backgroundColor: ColorUtils.negativeColor,
                                              foregroundColor: ColorUtils.negativeColor,
                                            ),
                                            onPressed: () async {
                                              var response = await review(id!, false, reasonController.text);
                                              print(response.body);
                                              Navigator.pop(context);
                                              setState;
                                            },
                                            child: const Text("반려",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: StringUtils.pretendard,
                                                  letterSpacing: -0.34,
                                                  color: Colors.white
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ]
                              ),
                            )
                        );
                      }
                  );
                },
                icon: Center(
                  child: Icon(
                    Remix.close_line,
                    size: 20,
                    color: (status == FundDocumentStatus.reviewing || status == FundDocumentStatus.rejected)?
                    Colors.white : const Color(0xff999999),
                  )
                ),
              ),
            )
          ],
        )),
        DataCell((submittedAt != null)? Text(DateFormat('yyyy-MM-dd hh:mm').format(submittedAt!)) : const Text("-")),
        DataCell((reviewedAt != null)? Text(DateFormat('yyyy-MM-dd hh:mm').format(reviewedAt!)) : const Text("-")),
      ]
    );
  }

  Widget toJoinedFundLpContainer() {
    return Container(
        padding: const EdgeInsets.fromLTRB(19, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(documentTitle,
              style: const TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                  letterSpacing: -0.17
              ),
            ),
            Row(
              children: [
                if (status != FundDocumentStatus.accepted) Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff002997),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  alignment: Alignment.center,
                  child: const Text(
                    "1",
                    style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                if (status != FundDocumentStatus.accepted) FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff6c6f81),
                      foregroundColor: const Color(0xff6c6f81),
                      fixedSize: const Size(180, 38),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                  ),
                  onPressed: () async {
                    var file = await getTemplateFileMetadata(documentId);
                    download(file.id, documentTitle);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Remix.download_2_line, size: 16, color: Colors.white,),
                      Container(
                        margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: const Text(
                          "양식 파일 다운로드",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.32,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (status != FundDocumentStatus.accepted) Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff002997),
                  ),
                  margin: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  alignment: Alignment.center,
                  child: const Text(
                    "2",
                    style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                if (status != FundDocumentStatus.accepted) FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xff6c6f81),
                        foregroundColor: const Color(0xff6c6f81),
                        fixedSize: const Size(90, 38),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                    ),
                    onPressed: () async {
                      var pickedFile = await FileUtils().pickAnyFile();
                      var response = await submit(documentId);
                      upload(
                        pickedFile?.files.first.bytes ?? Uint8List(0),
                        File(
                          id: -1,
                          name: "${userName}_제출_$documentTitle.${pickedFile?.files.first.extension ?? ""}",
                          targetId: int.parse(response.body),
                          targetType: FileTarget.fundDocumentSubmission
                        )
                      );
                    },
                    child: Text(
                      status == FundDocumentStatus.notSubmitted? "파일찾기" : "파일변경",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.32,
                        color: Colors.white,
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: status.statusWidget(),
                ),
              ],
            ),
          ],
        )
    );
  }

  factory FundDocumentSubmission.fromJson(Map<String, dynamic> json) {
    return FundDocumentSubmission(
      id: json['id'],
      documentId: json['documentId'],
      lpId: json['lpId'],
      userName: json['userName'],
      fundName: json['fundName'],
      documentTitle: json['documentTitle'],
      status: FundDocumentStatus.fromEnglish(json['status']),
      submittedAt: (json['submittedAt'] != null)? DateTime(json['submittedAt'][0], json['submittedAt'][1], json['submittedAt'][2], json['submittedAt'][3], json['submittedAt'][4], json['submittedAt'][5])
        : null,
      reviewedAt: (json['reviewedAt'] != null)? DateTime(json['reviewedAt'][0], json['reviewedAt'][1], json['reviewedAt'][2], json['reviewedAt'][3], json['reviewedAt'][4], json['reviewedAt'][5])
        : null,
    );
  }

}

Future<List<FundDocumentSubmission>> getMyDocuments(FundDocumentType? type) async {
  var response = await http.get(
    StringUtils().stringToUri("/my-document", params: (type == null)? null : {"type": type.english}),
    headers: await StringUtils().header()
  );

  print(response.body);
  // if (response.body.isEmpty) return <FundDocumentSubmission>[];

  return jsonDecode(utf8.decode(response.bodyBytes)).map<FundDocumentSubmission>((json) => FundDocumentSubmission.fromJson(json)).toList();
}

Future<List<FundDocumentSubmission>> getFundDocumentSubmissions(int documentId) async {
  var response = await http.get(
    StringUtils().stringToUri("/fund/document/submission", params: {'documentId': documentId.toString()}),
    headers: await StringUtils().header()
  );

  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes)).map<FundDocumentSubmission>((json) => FundDocumentSubmission.fromJson(json)).toList();
}

Future<http.Response> submit(int documentId) async {
  return await http.post(
    StringUtils().stringToUri("/fund/document/submission"),
    body: documentId.toString(),
    headers: await StringUtils().header()
  );
}

Future<http.Response> review(int submissionId, bool isAccepted, String? reason) async {
  return await http.post(
    StringUtils().stringToUri("/fund/document/submission/review"),
    body: jsonEncode({"submissionId": submissionId, "result": isAccepted, "reason": reason}),
    headers: await StringUtils().header(),
  );
}