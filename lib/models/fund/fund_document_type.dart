import 'dart:ui';

import 'package:angelnet/utils/ColorUtils.dart';

enum FundDocumentType {
  funding(
    korean: "결성",
    english: "FUNDING",
    adminStatusColor: ColorUtils.step1Color,
  ),
  running(
    korean: "운용",
    english: "RUNNING",
    adminStatusColor: ColorUtils.step3Color,
  ),
  exiting(
    korean: "해산",
    english: "EXITING",
    adminStatusColor: ColorUtils.step5Color,
  ),
  ir(
    korean: "회사소개서",
    english: "IR",
    adminStatusColor: Color(0xff333333),
  ),;

  final String korean;
  final String english;
  final Color adminStatusColor;

  const FundDocumentType({required this.korean, required this.english, required this.adminStatusColor});

  factory FundDocumentType.fromEnglish(String english) {
    switch (english) {
      case "FUNDING":
        return FundDocumentType.funding;
      case "RUNNING":
        return FundDocumentType.running;
      case "EXITING":
        return FundDocumentType.exiting;
      case "IR":
        return FundDocumentType.ir;
      default:
        throw Exception();
    }
  }
}