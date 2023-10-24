import 'dart:convert';

import 'package:angelnet/models/lp/fund_document_status.dart';
import 'package:angelnet/screens/lp/document_submit_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:http/http.dart' as http;

class FundDocumentSubmission {

  final int documentId;
  final String fundName;
  final String documentTitle;
  final FundDocumentStatus status;
  final String templateUrl;
  final String? url;
  final DateTime? submittedAt;
  final DateTime? reviewedAt;

  const FundDocumentSubmission({
    required this.documentId,
    required this.fundName,
    required this.documentTitle,
    required this.status,
    required this.templateUrl,
    required this.url,
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
          onPressed: () {
            // todo 양식 다운로드
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
          () {
            // todo download action
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("/assets/images/img.png"), // todo 확장자에 따라 변경
              fit: BoxFit.fitWidth
            )
          ),
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

  factory FundDocumentSubmission.fromJson(Map<String, dynamic> json) {
    return FundDocumentSubmission(
      documentId: json['documentId'],
      fundName: json['fundName'],
      documentTitle: json['documentTitle'],
      status: FundDocumentStatus.fromEnglish(json['status']),
      templateUrl: json['templateUrl'],
      url: json['url'],
      submittedAt: (json['submittedAt'] != null)? DateTime(json['submittedAt'][0], json['submittedAt'][1], json['submittedAt'][2], json['submittedAt'][3], json['submittedAt'][4], json['submittedAt'][5])
        : null,
      reviewedAt: (json['reviewedAt'] != null)? DateTime(json['reviewedAt'][0], json['reviewedAt'][1], json['reviewedAt'][2], json['reviewedAt'][3], json['reviewedAt'][4], json['reviewedAt'][5])
        : null,
    );
  }

}

Future<String> downloadRecentFile(int documentId) async {
  var response = await http.get(
    StringUtils().stringToUri("/document", params: {"documentId": documentId.toString()}),
    headers: await StringUtils().header()
  );

  return response.body;
}

Future<String> downloadTemplate(int documentId) async {
  var response = await http.get(
    StringUtils().stringToUri("/document/template", params: {"documentId": documentId.toString()}),
    headers: await StringUtils().header()
  );

  return response.body;
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