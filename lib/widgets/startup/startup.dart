import 'package:backoffice_front/widgets/startup/portfolio_details.dart';

class Startup {
  final int id;
  final String name;
  final String ceoName;
  final List<CorporationRegistration> corporationRegistrations;
  final List<ShareholderList> shareholderLists;

  // final List<FollowingInvestment> followingInvestments;
  // final List<FinancialStatement> financialStatements;
  final List<NewsLetter> newsLetters;

  Startup(
    this.id,
    this.name,
    this.ceoName,
    this.corporationRegistrations,
    this.shareholderLists,
    // this.followingInvestments,
    // this.financialStatements,
    this.newsLetters,
  );
}
