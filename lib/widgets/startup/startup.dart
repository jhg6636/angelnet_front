import 'package:backoffice_front/widgets/startup/portfolio_details.dart';
import 'package:flutter/cupertino.dart';

class Startup {

  final int idx;
  final String name;
  final String ceoName;
  final CorporationRegistration corporationRegistration;
  final ShareholderList shareholderList;
  final List<FollowingInvestment> followingInvestments;
  final List<FinancialStatement> financialStatements;
  final List<NewsLetter> newsLetters;

  Startup(
      this.idx,
      this.name,
      this.ceoName,
      this.corporationRegistration,
      this.shareholderList,
      this.followingInvestments,
      this.financialStatements,
      this.newsLetters,
  );

}