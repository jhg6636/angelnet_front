enum FundType {
  commonShare(korean: "보통주", english: "COMMON_SHARE"),
  rcps(korean: "RCPS", english: "RCPS"), // 상환전환우선주
  cps(korean: "CPS", english: "CPS"),
  safe(korean: "Safe(조건부지분인수)", english: "SAFE"),
  cb(korean: "전환사채 (CB)", english: "CB"),
  bw(korean: "신주인수권부사채 (BW)", english: "BW");

  final String korean;
  final String english;
  const FundType({required this.korean, required this.english});

  factory FundType.fromKorean(String korean) {
    switch (korean) {
      case "보통주":
        return FundType.commonShare;
      case "RCPS":
        return FundType.rcps;
      case "CPS":
        return FundType.cps;
      case "Safe(조건부지분인수)":
        return FundType.safe;
      case "전환사채 (CB)":
        return FundType.cb;
      case "신주인수권부사채 (BW)":
        return FundType.bw;
      default:
        return FundType.commonShare;
    }
  }

  factory FundType.fromEnglish(String english) {
    switch (english) {
      case "COMMON_SHARE":
        return FundType.commonShare;
      case "CPS":
        return FundType.cps;
      case "RCPS":
        return FundType.rcps;
      case "SAFE":
        return FundType.safe;
      case "CB":
        return FundType.cb;
      case "BW":
        return FundType.bw;
      default:
        return FundType.commonShare;
    }
  }
}