import 'dart:convert';
import 'dart:core';

import 'package:backoffice_front/models/startup/startup.dart';
import 'package:backoffice_front/screens/admin/fund_detail_screen.dart';
import 'package:backoffice_front/screens/lp/fund_detail_lp_screen.dart';
import 'package:backoffice_front/screens/startup/startup_screen.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Fund {
  int id;
  String name;
  String startupName;
  String mainProduct;
  String managerName;
  DateTime createdAt;
  String type;
  DateTime? dissolvedAt;
  double? margin;
  int cost;
  int costPerShare;
  int currentFundedCost;
  int currentMemberCount;
  int minimumShare;
  int totalShare;
  int totalMember;
  String status;
  DateTime payAt;
  int value;
  String recommenderOrGroupName;

  Fund(
      {
        required this.id,
        required this.name,
        required this.startupName,
        required this.mainProduct,
        required this.managerName,
        required this.createdAt,
        required this.type,
        required this.dissolvedAt,
        required this.margin,
        required this.cost,
        required this.costPerShare,
        required this.currentFundedCost,
        required this.currentMemberCount,
        required this.totalMember,
        required this.minimumShare,
        required this.totalShare,
        required this.status,
        required this.payAt,
        required this.value,
        required this.recommenderOrGroupName,
      }
  );

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
        id: json['id'] as int,
        name: json['name'] as String,
        startupName: "",
        mainProduct: "",
        managerName: "",
        createdAt: DateTime.parse(json['createdAt'] as String),
        type: "",
        dissolvedAt: null,
        margin: null,
        cost: json['cost'] as int,
        costPerShare: 0,
        currentFundedCost: 0,
        currentMemberCount: 0,
        status: "READY",
        payAt: DateTime.now(),
        totalMember: 0,
        minimumShare: 0,
        totalShare: 0,
        value: 0,
        recommenderOrGroupName: "",
    );
  }

  DataRow toAdminDataRow() {
    return DataRow(
        cells: [
          DataCell(Text(id.toString())),
          DataCell(TextButton(
            onPressed: () {
              Get.to(FundDetailAdminScreen(fund: this));
            },
            child: Text(name),
          )),
          DataCell(Text(startupName)
              // FutureBuilder<Startup>(
              //   future: fetchStartup(startupName),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     if (snapshot.hasError) {
              //       return WidgetUtils.errorPadding;
              //     } else {
              //       return TextButton(
              //           onPressed: () {
              //             Get.to(StartupScreen(startup: snapshot.data));
              //           },
              //           child: Text(startupName)
              //       );
              //     }
              //   }
              // )
          ),
          DataCell(Text(cost.toString())),
          DataCell(Text(currentFundedCost.toString())),
          DataCell(Text((cost-currentFundedCost).toString())),
          DataCell(Text(currentMemberCount.toString())),
          DataCell(Text(DateFormat('yyyy-MM-dd').format(createdAt))),
          DataCell(Text(status)),
        ]
    );
  }

  DataRow toFundingFundDataRow() {
    return DataRow(
        cells: [
          DataCell(Text(name)),
          DataCell(Text(startupName)),
          DataCell(Text(mainProduct)),
          DataCell(Text(cost.toString())),
          DataCell(Text((currentFundedCost/costPerShare).toString())),
          DataCell(Text(((cost - currentFundedCost)/costPerShare).toString())),
          DataCell(Text((49-currentMemberCount).toString())),
          DataCell(
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(FundDetailLpScreen(fund: this));
                  // var response = await joinFund(id);
                  // if (response.statusCode == 200) {
                  //   Fluttertoast.showToast(msg: "조합에 참여하셨습니다. 마이페이지에서 확인해 보세요.");
                  // } else {
                  //   Fluttertoast.showToast(msg: "조합에 참여하지 못했습니다.");
                  // }
                },
                icon: const Icon(Icons.search),
                label: const Text("자세히 보기"),
              )
          ),
        ]
    );
  }

  DataRow toAllPortfolioRow() {
    return DataRow(cells: [
      DataCell(Text(name)),
      DataCell(Text(startupName)),
      DataCell(Text(managerName)),
      DataCell(Text(createdAt.toString())),
      DataCell(Text(type)),
      DataCell(Text(dissolvedAt.toString())),
      DataCell(Text(margin.toString())),
    ]);
  }

  DataTable toBasicTable() {
    return DataTable(
        columns: const [
          DataColumn(label: Text("")),
          DataColumn(label: Text("내용")),
        ],
        rows: [
          DataRow(cells: [const DataCell(Text("결성 금액")), DataCell(Text(cost.toString()))]),
          DataRow(cells: [const DataCell(Text("1좌당 금액")), DataCell(Text(costPerShare.toString()))]),
          DataRow(cells: [const DataCell(Text("투자 종목")), DataCell(Text(startupName))]),
          DataRow(cells: [const DataCell(Text("투자 형태")), DataCell(Text(type))]),
          DataRow(cells: [const DataCell(Text("상태")), DataCell(Text(status))]),
          DataRow(cells: [const DataCell(Text("조합 결성일")), DataCell(Text(createdAt.toString()))]),
          DataRow(cells: [const DataCell(Text("주금 납입일")), DataCell(Text(payAt.toString()))]),
          DataRow(cells: [const DataCell(Text("담당자")), DataCell(Text(managerName))]),
        ]
    );
  }

  String toPostRequest() {
    return jsonEncode({

    });
  }

}

Future<List<Fund>> fetchMyFunds() async {
  var response = await http.get(
      StringUtils().stringToUri('lp/my-fund'),
      headers: await StringUtils().header()
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  var result = responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
  return result;
}

Future<List<Fund>> fetchAllFunds() async {
  var response = await http.get(
    StringUtils().stringToUri('admin/funds'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  print(responseBody);

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<List<Fund>> searchFunds(String status) async {
  var response = await http.get(
    StringUtils().stringToUri('/lp/fund'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<http.Response> joinFund(int fundId, int stockCount) async {
  return await http.post(
    StringUtils().stringToUri('lp/fund'),
    headers: await StringUtils().header(),
    body: jsonEncode({"fundId": fundId.toString(), "stockCounts": stockCount}),
  );
}

Future<http.Response> unjoinFund(int fundId, int? userId) async {
  return await http.delete(
    StringUtils().stringToUri('lp/fund', params: {"fundId": fundId, "userId": userId}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> checkDeposit(int lpId) async {
  return await http.post(
    StringUtils().stringToUri('admin/deposit'),
    headers: await StringUtils().header(),
    body: jsonEncode({"lpId": lpId})
  );
}

Future<http.Response> uncheckDeposit(int lpId) async {
  return await http.delete(
    StringUtils().stringToUri('admin/deposit', params: {"lpId": lpId}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> makeFund(Fund fund) async {
  return await http.post(
    StringUtils().stringToUri('admin/fund'),
    headers: await StringUtils().header(),
    body: fund.toPostRequest(),
  );
}

Future<http.Response> editFund(Fund fund) async {
  return await http.put(
    StringUtils().stringToUri('admin/fund'),
    headers: await StringUtils().header(),
    body: fund.toPostRequest(),
  );
}