import 'dart:ui';

import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

enum FundDocumentStatus {
  accepted(
    korean: "승인",
    english: "ACCEPTED",
    statusColor: Color(0xff04b45f)
  ),
  rejected(
    korean: "반려",
    english: "REJECTED",
    statusColor: Color(0xfff5a9a9)
  ),
  notSubmitted(
    korean: "미제출",
    english: "NOT_SUBMITTED",
    statusColor: Color(0xff333333)
  ),
  reviewing(
    korean: "검토",
    english: "REVIEWING",
    statusColor: Color(0xfff4f4f4)
  );

  final String korean;
  final String english;
  final Color statusColor;

  const FundDocumentStatus(
    {
      required this.korean,
      required this.english,
      required this.statusColor
    }
  );

  factory FundDocumentStatus.fromEnglish(String english) {
    switch (english) {
      case "ACCEPTED":
        return FundDocumentStatus.accepted;
      case "REJECTED":
        return FundDocumentStatus.rejected;
      case "NOT_SUBMITTED":
        return FundDocumentStatus.notSubmitted;
      case "REVIEWING":
        return FundDocumentStatus.reviewing;
      default:
        return FundDocumentStatus.notSubmitted;
    }
  }

  factory FundDocumentStatus.fromKorean(String korean) {
    switch (korean) {
      case "승인":
        return FundDocumentStatus.accepted;
      case "반려":
        return FundDocumentStatus.rejected;
      case "미제출":
        return FundDocumentStatus.notSubmitted;
      case "검토":
        return FundDocumentStatus.reviewing;
      default:
        return FundDocumentStatus.notSubmitted;
    }
  }

  Widget statusWidget() {
    return Container(
      width: 84,
      height: 28,
      alignment: Alignment.center,
      color: statusColor,
      child: Text(korean,
        style: TextStyle(
          fontFamily: StringUtils.pretendard,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.45,
          color: this == FundDocumentStatus.reviewing? const Color(0xff999999) : Colors.white
        ),
      ),
    );
  }

  Widget dataTableDocumentButtonWidget(Function()? downloadAction, Function()? uploadAction) {
    switch (this) {
      case FundDocumentStatus.accepted:
      case FundDocumentStatus.reviewing:
        return Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xfff2f2f2),
            // border: Border.all(color: )
          ),
          child: IconButton(
            alignment: Alignment.center,
            splashRadius: 18,
            tooltip: "다운로드",
            onPressed: downloadAction,
            icon: const Icon(
              Remix.download_line,
              size: 16,
              color: Color(0xff333333),
            ),
          ),
        );
      case FundDocumentStatus.rejected:
        return Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "다운로드",
                onPressed: downloadAction,
                icon: const Icon(
                  Remix.download_line,
                  size: 16,
                  color: Color(0xff333333),
                ),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.actionColor,
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "업로드",
                onPressed: uploadAction,
                icon: const Icon(
                  Remix.upload_line,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      case FundDocumentStatus.notSubmitted:
        return Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.actionColor,
            // border: Border.all(color: )
          ),
          child: IconButton(
            alignment: Alignment.center,
            splashRadius: 18,
            tooltip: "업로드",
            onPressed: uploadAction,
            icon: const Icon(
              Remix.upload_line,
              size: 16,
              color: Colors.white,
            ),
          ),
        );
    }
  }
}