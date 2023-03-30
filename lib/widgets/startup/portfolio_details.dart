/// 법인 등기부 등본 1건을 나타내는 클래스
class CorporationRegistration {

  final DateTime createdAt;
  final String url;

  CorporationRegistration(this.createdAt, this.url);

}

/// 주주명부 1건을 나타내는 클래스
class ShareholderList {

  final DateTime createdAt;
  final int version;
  final String url;

  ShareholderList(this.createdAt, this.version, this.url);

}

/// 후속투자 1건을 나타내는 클래스
class FollowingInvestment {

  final int value;
  final String step;

  FollowingInvestment(this.value, this.step);

}

/// 재무제표 1건 (1년 혹은 1분기 단위) 나타내는 클래스
class FinancialStatement {

  final int year;
  final int sales;
  final int businessProfits;

  FinancialStatement(this.year, this.sales, this.businessProfits);

}

/// 뉴스레터 1건을 나타내는 클래스
class NewsLetter {

  final String title;
  final String content;

  NewsLetter(this.title, this.content);

}