import 'package:angelnet/models/lp/fund_document_status.dart';
import 'package:angelnet/screens/lp/document_submit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

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

}