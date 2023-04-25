import 'dart:convert';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:backoffice_front/widgets/startup/portfolio_details.dart';
import 'package:http/http.dart' as http;

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

  factory Startup.fromJson(Map<String, dynamic> json) {
    return Startup(
        json['id'] as int,
        json['name'],
        json['ceoName'],
        List.empty(),
        List.empty(),
        List.empty()
    );
  }
}

Future<Startup> fetchStartup(String name) async {
  var response = await http.get(
    StringUtils().stringToUri('/portfolio/startup', params: {"startupName": name}),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  return Startup.fromJson(responseBody);
}