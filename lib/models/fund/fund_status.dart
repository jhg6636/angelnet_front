import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';

enum FundStatus {
  reviewing(
      korean: "조합검토기간",
      english: "REVIEWING",
      fullName: "조합검토기간",
      smallWidgetColor: Color(0xff8f40de),
      bigWidgetColor: Color(0xff1badfb)),
  accepting(
      korean: "참여신청",
      english: "ACCEPTING",
      fullName: "참여신청",
      smallWidgetColor: Color(0xff0361f9),
      bigWidgetColor: Color(0xff5992ef)),
  receivingDocuments(
      korean: "서류접수중",
      english: "RECEIVING_DOCUMENTS",
      fullName: "서류접수 및 입금확인",
      smallWidgetColor: Color(0xff43a3d6),
      bigWidgetColor: Color(0xff0361f9)),
  stockPayment(
      korean: "주금납입",
      english: "STOCK_PAYMENT",
      fullName: "주금 납입",
      smallWidgetColor: Color(0xff002997),
      bigWidgetColor: Color(0xff002997)),
  governmentProcess(
      korean: "중기부 승인 진행",
      english: "GOVERNMENT_PROCESS",
      fullName: "중소벤처기업부 등록승인",
      smallWidgetColor: Color(0xff43a3d6),
      bigWidgetColor: Color(0xff004cc6)),
  running(
      korean: "운용중",
      english: "RUNNING",
      fullName: "완료(출자증서 발급)",
      smallWidgetColor: Color(0xff04b45f),
      bigWidgetColor: Color(0xff00968f)),
  dissolved(
      korean: "해산",
      english: "DISSOLVED",
      fullName: "",
      smallWidgetColor: Color(0xff323c4e),
      bigWidgetColor: Color(0xffffffff));

  final String korean;
  final String english;
  final String fullName;
  final Color smallWidgetColor;
  final Color bigWidgetColor;

  const FundStatus(
      {required this.korean,
      required this.english,
      required this.fullName,
      required this.smallWidgetColor,
      required this.bigWidgetColor});

  static const statusTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.45,
      color: Colors.white);

  factory FundStatus.fromEnglish(String english) {
    switch (english) {
      case "REVIEWING":
        return FundStatus.reviewing;
      case "ACCEPTING":
        return FundStatus.accepting;
      case "RECEIVING_DOCUMENTS":
        return FundStatus.receivingDocuments;
      case "STOCK_PAYMENT":
        return FundStatus.stockPayment;
      case "RUNNING":
        return FundStatus.running;
      case "DISSOLVED":
        return FundStatus.dissolved;
      default:
        return FundStatus.reviewing;
    }
  }

  Widget toSmallWidget() {
    return Container(
      alignment: Alignment.center,
      width: 84,
      height: 28,
      color: smallWidgetColor,
      child: Text(
        korean,
        style: FundStatus.statusTextStyle,
      ),
    );
  }

  Widget toBigWidget() {
    return Container(
      alignment: Alignment.center,
      width: 186,
      height: 47,
      decoration: BoxDecoration(
          border: Border.all(color: bigWidgetColor),
          borderRadius: BorderRadius.circular(24)
      ),
      child: Text(fullName,
          style: TextStyle(
              fontFamily: StringUtils.pretendard,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: bigWidgetColor,
          )
      ),
    );
  }

  bool isRunning() => index >= running.index;

}
