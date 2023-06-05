import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/FileUtils.dart';
import '../../utils/StringUtils.dart';

class LimitedPartner {

  final int id;
  final String stringId;
  final String fundName;
  final String name;
  final String phone;
  final int cost;
  final int stockCount;
  final String? locUrl;
  final String? taxDeductionUrl;
  final DateTime? depositAt;

  LimitedPartner({
    required this.id,
    required this.stringId,
    required this.fundName,
    required this.name,
    required this.phone,
    required this.cost,
    required this.stockCount,
    required this.locUrl,
    required this.taxDeductionUrl,
    required this.depositAt,
  });

  factory LimitedPartner.fromJson(Map<String, dynamic> json) {
    return LimitedPartner(
        id: json['id'] as int,
        stringId: json['stringId'] as String,
        fundName: json['fundName'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        cost: json['cost'] as int,
        stockCount: json['stockCount'] as int,
        locUrl: json['locUrl'] as String,
        taxDeductionUrl: json['taxDeductionUrl'] as String,
        depositAt: json['depositAt'] as DateTime,
    );
  }

  DataRow toDataRow(int index) {
    DataCell locCell;
    DataCell taxDeductionCell;
    DataCell depositAtCell;
    if (locUrl == null) {
      locCell = const DataCell(Text("X"));
    } else {
      locCell = DataCell(
        TextButton.icon(
            onPressed: () {
              FileUtils().downloadFile(locUrl!!);
            },
            icon: const Icon(Icons.download),
            label: const Text("다운로드")
        )
      );
    }
    
    if (taxDeductionUrl == null) {
      taxDeductionCell = const DataCell(Text("X"));
    } else {
      taxDeductionCell = DataCell(
        TextButton.icon(
          onPressed: () {
            FileUtils().downloadFile(taxDeductionUrl!!);
          },
          icon: const Icon(Icons.download),
          label: const Text("다운로드")
        )
      );
    }
    
    if (depositAt == null) {
      depositAtCell = DataCell(OutlinedButton(onPressed: () {}, child: const Text("입금확인")));
    } else {
      depositAtCell = DataCell(Text(depositAt.toString()));
    }
    
    return DataRow(
        cells: [
          DataCell(Text(index.toString())),
          DataCell(Text(stringId)),
          DataCell(Text(name)),
          DataCell(Text(phone)),
          DataCell(Text(cost.toString())),
          DataCell(Text(stockCount.toString())),
          locCell,
          taxDeductionCell,
          depositAtCell,
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

}

Future<List<LimitedPartner>> fetchLps(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri('lp/fund', params: {'fundId': fundId}),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  return responseBody.map<LimitedPartner>((json) => LimitedPartner.fromJson(json)).toList();
}