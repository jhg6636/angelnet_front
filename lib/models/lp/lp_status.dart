import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';

enum LpStatus {
  waiting(
    korean: "참여대기",
    english: "WAITING",
    enabledColor: Color(0xfff4f4f4),
    joinedFundComment: "조합 참여 대기 중입니다."
  ),
  fundDocumentSubmit(
      korean: "서류접수",
      english: "FUND_DOCUMENT_SUBMIT",
      enabledColor: Color(0xff1badfb),
      joinedFundComment: "조합 결성이 진행 중입니다."),
  beforeDeposit(
      korean: "입금대기",
      english: "BEFORE_DEPOSIT",
      enabledColor: Color(0xff5992ef),
      joinedFundComment: "조합 결성이 진행 중입니다."),
  completeDeposit(
      korean: "입금확인",
      english: "COMPLETE_DEPOSIT",
      enabledColor: Color(0xff0361f9),
      joinedFundComment: "조합 결성이 진행 중입니다."),
  governmentApproval(
      korean: "중기부 승인 진행",
      english: "GOVERNMENT_APPROVAL",
      enabledColor: Color(0xff004cc6),
      joinedFundComment: "중기부 승인이 진행 중입니다."),
  payment(
      korean: "주금납입",
      english: "PAYMENT",
      enabledColor: Color(0xff002997),
      joinedFundComment: "조합 결성이 진행 중입니다.");

  final String korean;
  final String english;
  final Color enabledColor;
  final String joinedFundComment;

  const LpStatus(
      {required this.korean,
      required this.english,
      required this.enabledColor,
      required this.joinedFundComment});

  factory LpStatus.fromEnglish(String english) {
    switch (english) {
      case "FUND_DOCUMENT_SUBMIT":
        return LpStatus.fundDocumentSubmit;
      case "BEFORE_DEPOSIT":
        return LpStatus.beforeDeposit;
      case "COMPLETE_DEPOSIT":
        return LpStatus.completeDeposit;
      case "GOVERNMENT_APPROVAL":
        return LpStatus.governmentApproval;
      case "PAYMENT":
        return LpStatus.payment;
      default:
        return LpStatus.fundDocumentSubmit;
    }
  }

  Widget imageWidget() {
    switch (this) {
      case LpStatus.waiting:
        return Container();
      case LpStatus.fundDocumentSubmit:
        return Container(
          width: 50.83,
          height: 44.62,
          margin: const EdgeInsets.fromLTRB(0, 23, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_1.png'),
                  fit: BoxFit.cover)),
        );
      case LpStatus.beforeDeposit:
        return Container(
          width: 48.62,
          height: 44.84,
          margin: const EdgeInsets.fromLTRB(0, 22.75, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_2.png'),
                  fit: BoxFit.cover)),
        );
      case LpStatus.completeDeposit:
        return Container(
          width: 39,
          height: 46.01,
          margin: const EdgeInsets.fromLTRB(0, 21.61, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_3.png'),
                  fit: BoxFit.cover)),
        );
      case LpStatus.governmentApproval:
        return Container(
          width: 48.54,
          height: 42.41,
          margin: const EdgeInsets.fromLTRB(0, 23.76, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_4.png'),
                  fit: BoxFit.cover)),
        );
      case LpStatus.payment:
        return Container(
          width: 33.46,
          height: 45.21,
          margin: const EdgeInsets.fromLTRB(0, 22.41, 0, 0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/fund_image_5.png'),
                  fit: BoxFit.cover)),
        );
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

  Widget toFundLpWidget() {
    if (this == LpStatus.waiting) {
      return Container(
        width: 84,
        height: 28,
        color: const Color(0xfff4f4f4),
        child: const Center(
          child: Text("대기",
            style: TextStyle(
              color: Color(0xff999999),
              fontWeight: FontWeight.w400,
              fontFamily: StringUtils.pretendard,
              fontSize: 15,
              letterSpacing: -0.45
            ),
          ),
        ),
      );
    }
    return Container(
      width: 84,
      height: 28,
      color: const Color(0xff04b45f),
      child: const Center(
        child: Text("참여",
          style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontFamily: StringUtils.pretendard,
              fontSize: 15,
              letterSpacing: -0.45
          ),
        ),
      ),
    );
  }
}
