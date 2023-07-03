import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/FileUtils.dart';
import '../../utils/StringUtils.dart';

class LimitedPartner {

  final int id;
  final String stringId;
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
        id: json['lpId'] as int,
        stringId: json['stringId'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        cost: json['cost'] as int,
        stockCount: json['stocks'] as int,
        locUrl: json['locUrl'],
        taxDeductionUrl: json['taxDeductionUrl'],
        depositAt: json['depositAt'],
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

Future<List<LimitedPartner>> fetchLpInFund(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri('admin/lp-in-fund', params: {"fundId": fundId.toString()}),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  print(responseBody);

  return responseBody.map<LimitedPartner>((json) => LimitedPartner.fromJson(json)).toList();
}