import 'dart:convert';

import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/screens/lp/joined_fund_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../utils/FileUtils.dart';
import '../../utils/StringUtils.dart';
import '../fund/fund_status.dart';
import 'lp_status.dart';

class LimitedPartner {

  final int id;
  final int cost;
  final int stockCount;
  final DateTime startAt;
  final String fundName;
  final String startupName;
  final FundStatus fundStatus;
  final LpStatus status;

  const LimitedPartner({
    required this.id,
    required this.cost,
    required this.stockCount,
    required this.startAt,
    required this.fundName,
    required this.startupName,
    required this.fundStatus,
    required this.status,
  });

  factory LimitedPartner.fromJson(Map<String, dynamic> json) {
    return LimitedPartner(
        id: json['id'] as int,
        cost: json['cost'] as int,
        stockCount: json['stockCount'] as int,
        startAt: DateTime(json['startAt'][0], json['startAt'][1], json['startAt'][2]),
        fundName: json['fundName'],
        startupName: json['startupName'],
        fundStatus: FundStatus.fromEnglish(json['fundStatus']),
        status: LpStatus.fromEnglish(json['status'])
    );
  }

  DataRow toDataRow(int index) {
    return DataRow(
        cells: [
          DataCell(Text(index.toString())),
          DataCell(Text(cost.toString())),
          DataCell(Text(stockCount.toString())),
          DataCell(
              OutlinedButton(
                onPressed: () { // todo 삭제 api
                },
                child: const Text("삭제"),
              )
          ),
        ]
    );
  }

  DataRow toJoinedFundRow(int index) {
    return DataRow(
        cells: [
          DataCell(Text(index.toString())),
          DataCell(Text(fundName)),
          DataCell(Text(startupName)),
          DataCell(Text(cost.toString())),
          DataCell(Text(fundStatus.korean)),
        ]
    );
  }

  DataRow toLpMyPageRow(int index) {
    return DataRow(
        cells: [
          DataCell(Text(index.toString())),
          DataCell(
              TextButton(
                onPressed: () {
                  Get.to(LpJoinedFundScreen(lp: this,));
                },
                child: Text(fundName,
                  style: WidgetUtils.dataTableDataStyle.apply(
                    decoration: TextDecoration.underline
                  ),
                ),
              )
          ),
          DataCell(Text(startupName)),
          DataCell(Text(StringUtils().currencyFormat(cost))),
          DataCell(Text(DateFormat('yyyy-MM-dd').format(startAt!))),
          DataCell(fundStatus.toSmallWidget()),
        ]
    );
  }

}

// Future<List<LimitedPartner>> fetchLpInFund(int fundId) async {
//   var response = await http.get(
//     StringUtils().stringToUri('admin/lp-in-fund', params: {"fundId": fundId.toString()}),
//     headers: await StringUtils().header(),
//   );
//
//   var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
//   print(responseBody);
//
//   return responseBody.map<LimitedPartner>((json) => LimitedPartner.fromJson(json)).toList();
// }

Future<List<LimitedPartner>> fetchMine() async {
  var response = await http.get(
    StringUtils().stringToUri('lp/my-fund'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  print(responseBody);

  return responseBody.map<LimitedPartner>((json) => LimitedPartner.fromJson(json)).toList();
}