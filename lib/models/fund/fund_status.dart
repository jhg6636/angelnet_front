import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';

enum FundStatus {
  reviewing(
      korean: "조합검토기간",
      english: "REVIEWING",
      fullName: "조합검토기간",
      smallWidgetColor: Color(0xff8f40de),
      bigWidgetColor: Color(0xff1badfb),
      enabledColor: Color(0xfff4f4f4),
      joinedFundComment: "조합 결성 대기 중입니다."
  ),
  accepting(
      korean: "참여신청",
      english: "ACCEPTING",
      fullName: "참여신청",
      smallWidgetColor: Color(0xff0361f9),
      bigWidgetColor: Color(0xff5992ef),
      enabledColor: Color(0xff1badfb),
      joinedFundComment: "조합 결성이 진행 중입니다.",
  ),
  receivingDocuments(
      korean: "서류접수중",
      english: "RECEIVING_DOCUMENTS",
      fullName: "서류접수 및 입금확인",
      smallWidgetColor: Color(0xff43a3d6),
      bigWidgetColor: Color(0xff0361f9),
      enabledColor: Color(0xff5992ef),
      joinedFundComment: "조합 결성이 진행 중입니다.",
  ),
  stockPayment(
      korean: "주금납입",
      english: "STOCK_PAYMENT",
      fullName: "주금 납입",
      smallWidgetColor: Color(0xff002997),
      bigWidgetColor: Color(0xff002997),
      enabledColor: Color(0xff0361f9),
      joinedFundComment: "조합 결성이 진행 중입니다.",
  ),
  governmentProcess(
      korean: "중기부 승인 진행",
      english: "GOVERNMENT_PROCESS",
      fullName: "중소벤처기업부 등록승인",
      smallWidgetColor: Color(0xff43a3d6),
      bigWidgetColor: Color(0xff004cc6),
      enabledColor: Color(0xff004cc6),
      joinedFundComment: "중기부 승인이 진행 중입니다."
  ),
  running(
      korean: "운용중",
      english: "RUNNING",
      fullName: "완료(출자증서 발급)",
      smallWidgetColor: Color(0xff04b45f),
      bigWidgetColor: Color(0xff00968f),
      enabledColor: Color(0xff002997),
      joinedFundComment: "조합 결성이 완료되었습니다."
  ),
  dissolved(
      korean: "해산",
      english: "DISSOLVED",
      fullName: "",
      smallWidgetColor: Color(0xff323c4e),
      bigWidgetColor: Color(0xffffffff),
      enabledColor: Color(0xfff4f4f4),
      joinedFundComment: "조합이 해산되었습니다."
  );

  final String korean;
  final String english;
  final String fullName;
  final Color smallWidgetColor;
  final Color bigWidgetColor;
  final Color enabledColor;
  final String joinedFundComment;

  const FundStatus(
      {
        required this.korean,
        required this.english,
        required this.fullName,
        required this.smallWidgetColor,
        required this.bigWidgetColor,
        required this.enabledColor,
        required this.joinedFundComment
      }
  );

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

  factory FundStatus.fromKorean(String korean) {
    switch (korean) {
      case "조합검토기간":
        return FundStatus.reviewing;
      case "참여신청":
        return FundStatus.accepting;
      case "서류접수중":
        return FundStatus.receivingDocuments;
      case "주금납입":
        return FundStatus.stockPayment;
      case "중기부 승인 진행":
        return FundStatus.governmentProcess;
      case "운용중":
        return FundStatus.running;
      case "해산":
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

  Widget imageWidget() {
    switch (this) {
      case FundStatus.accepting:
        return Container(
          width: 50.83,
          height: 44.62,
          margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_1.png'),
                  fit: BoxFit.cover)),
        );
      case FundStatus.receivingDocuments:
        return Container(
          width: 48.62,
          height: 44.84,
          margin: const EdgeInsets.fromLTRB(0, 22.75, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_2.png'),
                  fit: BoxFit.cover)),
        );
      case FundStatus.stockPayment:
        return Container(
          width: 39,
          height: 46.01,
          margin: const EdgeInsets.fromLTRB(0, 21.61, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_3.png'),
                  fit: BoxFit.cover)),
        );
      case FundStatus.governmentProcess:
        return Container(
          width: 48.54,
          height: 42.41,
          margin: const EdgeInsets.fromLTRB(0, 23.76, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_4.png'),
                  fit: BoxFit.cover)),
        );
      case FundStatus.running:
        return Container(
          width: 33.46,
          height: 45.21,
          margin: const EdgeInsets.fromLTRB(0, 22.41, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_5.png'),
                  fit: BoxFit.cover)),
        );
      default:
        return Container();
    }
  }

  Widget toEnabledWidget() {
    return Container(
        width: 200,
        height: 210,
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xffdddddd))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 88,
              height: 33,
              decoration: BoxDecoration(
                color: enabledColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "STEP 0$index",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: StringUtils.pretendard),
              ),
            ),
            imageWidget(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 28.38, 0, 0),
              child: Text(
                korean,
                style: const TextStyle(
                    fontFamily: StringUtils.pretendard,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111111)),
              ),
            )
          ],
        ));
  }

  Widget toDisabledWidget() {
    return Container(
        width: 200,
        height: 210,
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 34),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xffdddddd))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 88,
              height: 33,
              decoration: BoxDecoration(
                color: const Color(0xffb5becc),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "STEP 0$index",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: StringUtils.pretendard),
              ),
            ),
            imageWidget(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 28.38, 0, 0),
              child: Text(
                korean,
                style: const TextStyle(
                    fontFamily: StringUtils.pretendard,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff434343)),
              ),
            )
          ],
        ));
  }

  bool isRunning() => index >= running.index;

}
