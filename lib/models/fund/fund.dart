import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

import 'package:angelnet/screens/admin/manage_fund_screen.dart';
import 'package:angelnet/screens/lp/fund_detail_screen.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../screens/admin/fund_detail_admin_screen.dart';
import '../../utils/StringUtils.dart';
import 'fund_status.dart';
import 'fund_type.dart';

class Fund {
  int id;
  String name;
  String startupName;
  String mainProduct;
  String managerName;
  DateTime startAt;
  FundType type;
  DateTime? dissolvedAt;
  double? margin;
  int cost;
  int costPerShare;
  int currentFundedCost;
  int currentMemberCount;
  int minimumShare;
  int totalShare;
  int totalMember;
  FundStatus status;
  DateTime payAt;
  int value;
  String? recommender;
  String? groupName;
  String? memo;
  String? irUrl;
  String? fundIdDocumentUrl;
  String? ruleUrl;
  String? etcUrl;
  bool isFunding;

  Fund({
    required this.id,
    required this.name,
    required this.startupName,
    required this.mainProduct,
    required this.managerName,
    required this.startAt,
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
    required this.recommender,
    required this.groupName,
    required this.memo,
    required this.irUrl,
    required this.fundIdDocumentUrl,
    required this.ruleUrl,
    required this.etcUrl,
    required this.isFunding,
  });

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      id: json['id'] as int,
      name: json['name'] as String,
      startupName: json['startupName'] as String,
      mainProduct: json['mainProduct'] as String,
      managerName: json['manager'] as String,
      startAt:
          DateTime(json['startAt'][0], json['startAt'][1], json['startAt'][2]),
      type: FundType.fromEnglish(json['type']),
      dissolvedAt: null,
      margin: null,
      cost: json['cost'] as int,
      costPerShare: json['costPerShare'] as int,
      currentFundedCost: json['currentFundedCost'] as int,
      currentMemberCount: json['currentMemberCount'] as int,
      status: FundStatus.fromEnglish(json['status']),
      payAt: DateTime(json['payAt'][0], json['payAt'][1], json['payAt'][2]),
      totalMember: json['totalMember'] as int,
      minimumShare: json['minimumShare'] as int,
      totalShare: json['totalShare'] as int,
      value: json['value'] as int,
      recommender: json['recommender'] as String?,
      groupName: json['groupName'] as String?,
      memo: json['memo'] as String?,
      irUrl: null,
      fundIdDocumentUrl: null,
      ruleUrl: null,
      etcUrl: null,
      isFunding: true,
    );
  }

  DataRow toAdminDataRow(int index, BuildContext context) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(name)),
      DataCell(Text(startupName)),
      DataCell(Text(managerName)),
      DataCell(Text(currentMemberCount.toString())),
      DataCell(status.toSmallWidget()),
      DataCell(
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff2f2f2),
                  // border: Border.all(color: )
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  splashRadius: 18,
                  tooltip: "수정",
                  onPressed: () {
                    Get.to(FundDetailAdminScreen(fund: this));
                  },
                  icon: const Icon(Remix.edit_2_line, size: 14, color: Color(0xff333333),),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff5a9a9),
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  splashRadius: 18,
                  tooltip: "삭제",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertWidget().deleteWidget(context, () async {
                            var response = await deleteFund(id);
                            print(response.body);
                            Navigator.pop(context);
                            Get.to(const ManageFundScreen());
                            // todo setState 혹은 새로고침 버튼 만들어야 함
                          });
                        }
                    );
                  },
                  icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                ),
              )
            ],
          )
      ),
    ]);
  }

  DataRow toAllPortfolioRow() {
    return DataRow(cells: [
      DataCell(Text(name)),
      DataCell(Text(startupName)),
      DataCell(Text(managerName)),
      DataCell(Text(DateFormat('yyyy-MM-dd').format(startAt))),
      DataCell(Text(type.korean)),
      DataCell(Text((dissolvedAt == null)? "-" : DateFormat('yyyy-MM-dd').format(dissolvedAt!))),
      // DataCell(Text(margin.toString())),
    ]);
  }

  DataTable toBasicTable() {
    return DataTable(columns: const [
      DataColumn(label: Text("")),
      DataColumn(label: Text("")),
    ], rows: [
      DataRow(cells: [
        const DataCell(Text("결성 금액")),
        DataCell(Text(cost.toString()))
      ]),
      DataRow(cells: [
        const DataCell(Text("1좌당 금액")),
        DataCell(Text(costPerShare.toString()))
      ]),
      DataRow(
          cells: [const DataCell(Text("투자 종목")), DataCell(Text(startupName))]),
      DataRow(
          cells: [const DataCell(Text("투자 형태")), DataCell(Text(type.korean))]),
      DataRow(
          cells: [const DataCell(Text("상태")), DataCell(Text(status.korean))]),
      DataRow(cells: [
        const DataCell(Text("조합 결성일")),
        DataCell(Text(DateFormat('yyyy-MM-dd').format(startAt)))
      ]),
      DataRow(cells: [
        const DataCell(Text("주금 납입일")),
        DataCell(Text(DateFormat('yyyy-MM-dd').format(payAt)))
      ]),
      DataRow(
          cells: [const DataCell(Text("담당자")), DataCell(Text(managerName))]),
    ]);
  }

  String toPostRequest() {
    return jsonEncode({
      'name': name,
      'startupName': startupName,
      'mainProduct': mainProduct,
      'manager': managerName,
      'type': type.english,
      'cost': cost,
      'costPerShare': costPerShare,
      'minimumShare': minimumShare,
      'totalShare': totalShare,
      'totalMember': totalMember,
      'status': status.english,
      'startAt': DateFormat('yyyy-MM-dd').format(startAt),
      'payAt': DateFormat('yyyy-MM-dd').format(payAt),
      'value': value,
      'recommender': recommender,
      'groupName': groupName,
      'memo': memo,
    });
  }

  String toPutRequest() {
    return jsonEncode({
      'fundId': id,
      'name': name,
      'startupName': startupName,
      'mainProduct': mainProduct,
      'manager': managerName,
      'type': type.english,
      'cost': cost,
      'costPerShare': costPerShare,
      'minimumShare': minimumShare,
      'totalShare': totalShare,
      'totalMember': totalMember,
      'status': status.english,
      'startAt': DateFormat('yyyy-MM-dd').format(startAt),
      'payAt': DateFormat('yyyy-MM-dd').format(payAt),
      'value': value,
      'recommender': recommender,
      'groupName': groupName,
      'memo': memo,
    });
  }

  Widget fundingFundContainer() => InkWell(
    onTap: () {
      Get.to(FundDetailScreen(fund: this,));
    },
    child: Container(
      padding: const EdgeInsets.fromLTRB(20, 27, 4, 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "참여가능 인원 ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      color: Color(0xff333333),
                      letterSpacing: -0.15,
                    ),
                  ),
                  Text(
                    (totalMember - currentMemberCount).toString(),
                    style: const TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.15,
                      color: Color(0xff0361f9),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "|",
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffdddddd)),
                      )),
                  const Text(
                    "참여좌수 ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      color: Color(0xff333333),
                      letterSpacing: -0.15,
                    ),
                  ),
                  Text(
                    (currentFundedCost / costPerShare).toString(),
                    style: const TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.15,
                      color: Color(0xff0361f9),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "|",
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffdddddd)),
                      )),
                  const Text(
                    "남은좌수 ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      color: Color(0xff333333),
                      letterSpacing: -0.15,
                    ),
                  ),
                  Text(
                    (totalShare - (currentFundedCost / costPerShare))
                        .toString(),
                    style: const TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.15,
                      color: Color(0xff0361f9),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "|",
                        style:
                        TextStyle(fontSize: 12, color: Color(0xffdddddd)),
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.22,
                    color: Color(0xff191919),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        "주요제품",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: -0.15,
                          color: Color(0xff333333),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            "|",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffdddddd)),
                          )),
                      Text(
                        mainProduct,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.15,
                            color: Color(0xff757575)),
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                  child: Row(
                    children: [
                      const Text(
                        "결성금액",
                        style: TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: -0.15,
                          color: Color(0xff333333),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            "|",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffdddddd)),
                          )),
                      Text(
                        StringUtils().currencyFormat(cost),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.15,
                            color: Color(0xff000000)),
                      ),
                      const Text(
                        "원",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.15,
                            color: Color(0xff757575)),
                      )
                    ],
                  ))
            ],
          ),
          status.toBigWidget(),
        ],
      ),
    ),
  );
}

Future<List<Fund>> fetchMyFunds() async {
  var response = await http.get(StringUtils().stringToUri('lp/my-fund'),
      headers: await StringUtils().header());

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));

  print(responseBody);

  var result = responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
  return result;
}

Future<List<Fund>> fetchAllFunds() async {
  var response = await http.get(
    StringUtils().stringToUri('admin/fund'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  print(responseBody);

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<List<Fund>> searchFunds() async {
  var response = await http.get(
    StringUtils().stringToUri('/lp/fund'),
    headers: await StringUtils().header(),
  );

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  print(response.statusCode);
  // print(response.body);
  print(responseBody);

  return responseBody.map<Fund>((json) => Fund.fromJson(json)).toList();
}

Future<http.Response> joinFund(int fundId, int stockCount, {int? userId}) async {
  return await http.post(
    StringUtils().stringToUri('lp/fund'),
    headers: await StringUtils().header(),
    body: jsonEncode({"fundId": fundId.toString(), "stockCounts": stockCount, "userId": userId}),
  );
}

Future<http.Response> unjoinFund(int fundId, int? userId) async {
  return await http.delete(
    StringUtils()
        .stringToUri('lp/fund', params: {"fundId": fundId, "userId": userId}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> checkDeposit(int lpId) async {
  return await http.post(StringUtils().stringToUri('admin/deposit'),
      headers: await StringUtils().header(), body: jsonEncode({"lpId": lpId}));
}

Future<http.Response> uncheckDeposit(int lpId) async {
  return await http.delete(
    StringUtils().stringToUri('admin/deposit', params: {"lpId": lpId}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> makeFund(Fund fund) async {
  print(fund.toPostRequest());
  return await http.post(
    StringUtils().stringToUri('admin/fund'),
    headers: await StringUtils().header(),
    body: fund.toPostRequest(),
  );
}

Future<http.Response> editFund(Fund fund) async {
  print(fund.toPutRequest());
  return await http.put(
    StringUtils().stringToUri('admin/fund'),
    headers: await StringUtils().header(),
    body: fund.toPutRequest(),
  );
}

Future<http.Response> changeIsFunding(Fund fund, bool isFunding) async {
  return await http.put(StringUtils().stringToUri('admin/is-funding'),
      headers: await StringUtils().header(),
      body: jsonEncode({"fundId": fund.id, "isFunding": isFunding}));
}

Future<http.Response> deleteFund(int id) async {
  return await http.delete(
    StringUtils().stringToUri('/fund', params: {"fundId": id.toString()}),
    headers: await StringUtils().header()
  );
}

Future<Fund> getFundByLpId(int lpId) async {
  var response = await http.get(
    StringUtils().stringToUri('/fund', params: {"lpId": lpId.toString()}),
    headers: await StringUtils().header()
  );

  print(response.body);

  return Fund.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}

Future<bool> isExistingFundName(String name) async {
  var response = await http.get(
      StringUtils().stringToUri('/check-fund-name', params: {'fundName': name}),
      headers: await StringUtils().header()
  );
  return bool.parse(response.body);
}
