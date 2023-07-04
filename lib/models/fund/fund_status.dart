enum FundStatus {
  reviewRequested(korean: "검토 요청", english: "REVIEW_REQUESTED"),
  reviewing(korean: "조합 검토 기간", english: "REVIEWING"),
  accepting(korean: "참여 신청", english: "ACCEPTING"),
  receivingDocumentsAndMoney(korean: "서류접수 및 입금확인", english: "RECEIVING_DOCUMENTS_AND_MONEY"),
  stockPayment(korean: "주금 납입", english: "STOCK_PAYMENT"),
  complete(korean: "완료 (출자증서 발급)", english: "COMPLETE"),
  dissolved(korean: "해산", english: "DISSOLVED");

  final String korean;
  final String english;

  const FundStatus({required this.korean, required this.english});

  factory FundStatus.fromEnglish(String english) {
    switch (english) {
      case "REVIEW_REQUESTED":
        return FundStatus.reviewRequested;
      case "REVIEWING":
        return FundStatus.reviewing;
      case "ACCEPTING":
        return FundStatus.accepting;
      case "RECEIVING_DOCUMENTS_AND_MONEY":
        return FundStatus.receivingDocumentsAndMoney;
      case "STOCK_PAYMENT":
        return FundStatus.stockPayment;
      case "COMPLETE":
        return FundStatus.complete;
      case "DISSOLVED":
        return FundStatus.dissolved;
      default:
        return FundStatus.reviewRequested;
    }
  }

}