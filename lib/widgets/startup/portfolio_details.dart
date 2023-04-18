import 'package:flutter/material.dart';

abstract class PortfolioDocument {
  final DateTime createdAt;
  final String url;

  PortfolioDocument(this.createdAt, this.url);

  Widget toWidget();
}

/// 법인 등기부 등본 1건을 나타내는 클래스
class CorporationRegistration implements PortfolioDocument {
  @override
  DateTime createdAt;

  @override
  String url;

  CorporationRegistration(this.createdAt, this.url);

  @override
  Widget toWidget() {
    return Row(
      children: [
        Text(createdAt.toString()),
        Icon(Icons.download),
        Icon(Icons.upload)
      ],
    );
  }
}

/// 주주명부 1건을 나타내는 클래스
class ShareholderList implements PortfolioDocument {
  @override
  final DateTime createdAt;
  @override
  final String url;

  ShareholderList(this.createdAt, this.url);

  @override
  Widget toWidget() {
    return Row(
      children: [
        Text(createdAt.toString()),
        Icon(Icons.download),
        Icon(Icons.upload)
      ],
    );
  }
}

/// 후속투자 1건을 나타내는 클래스
class FollowingInvestment {
  final int value;
  final String step;
  final DateTime date;
  final String investedBy;

  FollowingInvestment(this.value, this.step, this.date, this.investedBy);

  Widget toWidget() {
    return Row(
      children: [
        Text(date.toString()),
        Text(investedBy),
        Text(value.toString()),
        Text(step),
      ],
    );
  }
}

/// 재무제표 1건 (1년 혹은 1분기 단위) 나타내는 클래스
class FinancialStatement {
  final int year;
  final int sales;
  final int businessProfits;

  FinancialStatement(this.year, this.sales, this.businessProfits);

  Widget toWidget() {
    return Row(
      children: [
        Text(year.toString()),
        Text(sales.toString()),
        Text(businessProfits.toString()),
      ],
    );
  }
}

/// 뉴스레터 1건을 나타내는 클래스
class NewsLetter implements PortfolioDocument {
  final String title;
  final String content;
  @override
  final String url;
  @override
  final DateTime createdAt;

  NewsLetter(this.title, this.content, this.url, this.createdAt);

  @override
  Widget toWidget() {
    return Row(
      children: [
        Text(title),
        Text(createdAt.toString()),
        const Icon(Icons.search),
      ],
    );
  }
}
