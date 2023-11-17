import 'dart:convert';

import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/models/lp/fund_document_status.dart';
import 'package:angelnet/screens/lp/document_submit_screen.dart';
import 'package:angelnet/utils/ColorUtils.dart';
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
  final String userName;
  final String fundName;
  final String documentTitle;
  final FundDocumentStatus status;
  final DateTime? submittedAt;
  final DateTime? reviewedAt;

  const FundDocumentSubmission({
    required this.id,
    required this.documentId,
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
            download(file.id);
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
            var file = await getRecentFileMetadata(documentId, FileTarget.fundDocumentSubmission);
            download(file.id);
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

  DataRow toAdminDataRow(int index, BuildContext context, Function() setState) {
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
                var file = await getRecentFileMetadata(documentId, FileTarget.fundDocumentSubmission);
                download(file.id);
              },
              icon: const Icon(
                Remix.download_2_line,
                size: 14,
                color: Color(0xff333333),
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
                color: (status == FundDocumentStatus.accepted)? ColorUtils.green : const Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "승인",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          width: 660,
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
                  size: 24,
                  color: (status == FundDocumentStatus.accepted)? ColorUtils.green : const Color(0xff999999),
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
                color: (status == FundDocumentStatus.rejected)? ColorUtils.negativeColor : const Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "반려",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        final reasonController = TextEditingController();
                        return AlertDialog(
                            content: Container(
                              width: 660,
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
                                          child: const Icon(Remix.close_line, color: Colors.white, size: 24,),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 560,
                                      margin: const EdgeInsets.symmetric(vertical: 15),
                                      padding: const EdgeInsets.all(15),
                                      decoration: WidgetUtils.textFieldBoxDecoration,
                                      child: TextField(
                                        controller: reasonController,
                                        decoration: const InputDecoration(
                                          hintText: "사유",
                                          hintStyle: WidgetUtils.textInputHintStyle,
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
                                              await review(id!, false, reasonController.text);
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
                icon: const Icon(
                  Remix.close_line,
                  size: 14,
                  color: Color(0xff333333),
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

  factory FundDocumentSubmission.fromJson(Map<String, dynamic> json) {
    return FundDocumentSubmission(
      id: json['id'],
      documentId: json['documentId'],
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

Future<List<FundDocumentSubmission>> getMyDocuments() async {
  var response = await http.get(
    StringUtils().stringToUri("/my-document"),
    headers: await StringUtils().header()
  );

  print(response.body);
  // if (response.body.isEmpty) return <FundDocumentSubmission>[];

  return jsonDecode(utf8.decode(response.bodyBytes)).map<FundDocumentSubmission>((json) => FundDocumentSubmission.fromJson(json)).toList();
}

Future<List<FundDocumentSubmission>> getFundSubmissions(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri("/fund/document/submission", params: {'fundId': fundId.toString()}),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map<FundDocumentSubmission>((json) => FundDocumentSubmission.fromJson(json)).toList();
}

Future<http.Response> submit(int fileId) async {
  return await http.post(
    StringUtils().stringToUri("/fund/document/submission"),
    body: jsonEncode({"fileId": fileId}),
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