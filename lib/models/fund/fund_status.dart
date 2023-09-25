import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FundStatus {
  reviewing(korean: "조합검토기간", english: "REVIEWING", smallWidgetColor: Color(0xff8f40de)),
  accepting(korean: "참여신청", english: "ACCEPTING", smallWidgetColor: Color(0xff0361f9)),
  receivingDocuments(korean: "서류접수중", english: "RECEIVING_DOCUMENTS", smallWidgetColor: Color(0xff43a3d6)),
  stockPayment(korean: "주금납입", english: "STOCK_PAYMENT", smallWidgetColor: Color(0xff002997)),
  stockPaymentComplete(korean: "주금납입완료", english: "STOCK_PAYMENT_COMPLETE", smallWidgetColor: Color(0xff002997)),
  governmentProcess(korean: "중기부 승인 진행", english: "GOVERNMENT_PROCESS", smallWidgetColor: Color(0xff43a3d6)),
  running(korean: "운용중", english: "RUNNING", smallWidgetColor: Color(0xff04b45f)),
  dissolved(korean: "해산", english: "DISSOLVED", smallWidgetColor: Color(0xff323c4e));

  final String korean;
  final String english;
  final Color smallWidgetColor;

  const FundStatus({required this.korean, required this.english, required this.smallWidgetColor});

  static const statusTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.45,
      color: Colors.white
  );

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
      case "COMPLETE":
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
      child: Text(korean, style: FundStatus.statusTextStyle,),
    );
  }

}