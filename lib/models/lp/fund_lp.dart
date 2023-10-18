import 'dart:convert';

import 'package:angelnet/models/lp/lp_status.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import 'package:http/http.dart' as http;

class FundLp {
  final int id;
  final String stringId;
  final String name;
  final String phone;
  final int cost;
  final int shares;
  final LpStatus status;
  final String? locUrl;
  final String? taxUrl;
  final DateTime? depositAt;

  const FundLp({
    required this.id,
    required this.stringId,
    required this.name,
    required this.phone,
    required this.cost,
    required this.shares,
    required this.status,
    required this.locUrl,
    required this.taxUrl,
    required this.depositAt
  });

  factory FundLp.fromJson(Map<String, dynamic> json) {
    return FundLp(
      id: json['id'],
      stringId: json['stringId'],
      name: json['name'],
      phone: json['phone'],
      cost: json['cost'],
      shares: json['shares'],
      status: LpStatus.fromEnglish(json['status']),
      locUrl: json['locUrl'],
      taxUrl: json['taxUrl'],
      depositAt: json['depositAt']
    );
  }

  DataRow toFundLpDataRow(int index) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(stringId)),
      DataCell(Text(name)),
      DataCell(Text(phone)),
      DataCell(Text("${StringUtils().currencyFormat(cost)}원 ($shares좌)")),
      DataCell(status.toFundLpWidget()),
      DataCell(locUrl == null?
        WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
          onPressed: () {  },
          icon: const Icon(Remix.upload_line, color: Color(0xff222222), size: 16,),
        )) :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
              onPressed: () {},
              icon: const Icon(Remix.download_line, color: Color(0xff222222), size: 16,))
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                  onPressed: () {},
                  icon: const Icon(Remix.edit_2_line, color: Color(0xff222222), size: 14,))
              ),
            )
          ],
        )
      ),
      DataCell(
        taxUrl == null?
          WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
            onPressed: () {  },
            icon: const Icon(Remix.upload_line, color: Color(0xff222222), size: 16,),
          )) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                  onPressed: () {},
                  icon: const Icon(Remix.download_line, color: Color(0xff222222), size: 16,))
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                    onPressed: () {},
                    icon: const Icon(Remix.edit_2_line, color: Color(0xff222222), size: 14,))
                ),
              )
            ],
          )
      ),
      DataCell(
        depositAt == null? Text(DateFormat('yyyy-MM-dd hh:mm').format(depositAt!)) : Container(
          width: 84,
          height: 28,
          color: const Color(0xfff4f4f4),
          child: const Text("확인",
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: 15,
              fontFamily: StringUtils.pretendard,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.45
            ),
          ),
        )
      ),
      DataCell(WidgetUtils.circleButtonFrame(const Color(0xfff5a9a9), IconButton(
        onPressed: () {},
        icon: const Icon(Remix.close_line, color: Colors.white, size: 24,)
      ))),
    ]);
  }
}

Future<List<FundLp>> fetchFundLps(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri("/fund/lp", params: {'fundId': fundId.toString()}),
    headers: await StringUtils().header()
  );

  return jsonDecode(utf8.decode(response.bodyBytes)).map((json) => FundLp.fromJson(json)).toList();
}