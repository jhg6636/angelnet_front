import 'dart:convert';

import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FinancialStatement {
  final int year;
  final int sales;
  final int businessProfits;

  FinancialStatement({
    required this.year,
    required this.sales,
    required this.businessProfits,
  });

  factory FinancialStatement.fromJson(Map<String, dynamic> json) {
    return FinancialStatement(
        year: json['year'] as int,
        sales: json['sales'] as int,
        businessProfits: json['businessProfits'] as int,
    );
  }

  DataRow toDataRow() {
    return DataRow(cells: [
      DataCell(Text(year.toString())),
      DataCell(Text(sales.toString())),
      DataCell(Text(businessProfits.toString())),
    ]);
  }
}

Future<List<FinancialStatement>> fetchFinancialStatements(int startupId) async {
  var response = await http.get(
    StringUtils().stringToUri("portfolio/financial-statement", params: {"startupId": startupId.toString()},),
    headers: await StringUtils().header(),
  );
  print(response.statusCode);

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));


  return responseBody.map<FinancialStatement>((json) => FinancialStatement.fromJson(json)).toList();
}