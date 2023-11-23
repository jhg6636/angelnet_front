import 'dart:convert';

import 'package:angelnet/models/fund/fund_document_type.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remixicon/remixicon.dart';

class FundDocument {

  final int id;
  final FundDocumentType type;
  final String title;
  final int acceptedMembers;
  final int totalMembers;
  final String? url;

  const FundDocument({
    required this.id,
    required this.type,
    required this.title,
    required this.acceptedMembers,
    required this.totalMembers,
    required this.url});

  factory FundDocument.fromJson(Map<String, dynamic> json) {
    return FundDocument(
      id: json['id'],
      type: FundDocumentType.fromEnglish(json['type']),
      title: json['title'],
      acceptedMembers: json['acceptedMembers'],
      totalMembers: json['totalMembers'],
      url: json['url']
    );
  }

  DataRow toDataRow(int index, BuildContext context, Function() setState) {
    return DataRow(
      cells: [
        DataCell(Text(index.toString())),
        DataCell(
          Container(
            width: 84,
            height: 28,
            color: type.adminStatusColor,
            alignment: Alignment.center,
            child: Center(child: Text(type.korean, style: WidgetUtils.statusBoxWhiteStyle,)),
          )
        ),
        DataCell(Text(title)),
        DataCell((acceptedMembers == totalMembers && totalMembers > 0)? Container(
          width: 84,
          height: 28,
          color: ColorUtils.green,
          child: const Center(child: Text("완료", style: WidgetUtils.statusBoxWhiteStyle,)),
        ) : Text("$acceptedMembers/$totalMembers")),
        DataCell((acceptedMembers == totalMembers)? const Text("-") :
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff0361f9),
              // border: Border.all(color: )
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              // tooltip: "오전 10시 알림이 발송됩니다.",
              onPressed: () {
                // todo 알림 발송 예약
                // 일단은 즉시 알림 발송
              },
              icon: const Icon(
                Remix.notification_2_line,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        DataCell(Row(
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
                tooltip: "양식 다운로드",
                onPressed: () {
                  // todo 양식 다운로드 api
                },
                icon: const Icon(
                  Remix.download_line,
                  size: 16,
                  color: Color(0xff333333),
                ),
              ),
            ),
            const SizedBox(width: 28,),
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff2f2f2),
                // border: Border.all(color: )
              ),
              child: IconButton(
                alignment: Alignment.center,
                splashRadius: 18,
                tooltip: "양식 업로드",
                onPressed: () {
                  // todo 양식 업로드 api
                },
                icon: const Icon(
                  Remix.upload_line,
                  size: 16,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ],
        )),
        DataCell(
          (type != FundDocumentType.information)? Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.actionColor,
              // border: Border.all(color: )
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "제출서류 검토",
              onPressed: setState,
              icon: const Icon(
                Remix.arrow_right_line,
                size: 16,
                color: Colors.white,
              ),
            ),
          ) : const Text("-"),
        ),
        DataCell(
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.negativeColor,
              // border: Border.all(color: )
            ),
            child: IconButton(
              alignment: Alignment.center,
              splashRadius: 18,
              tooltip: "삭제",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertWidget().deleteWidget(context, () {
                      // todo 삭제 api
                    });
                  }
                );
              },
              icon: const Icon(
                Remix.close_line,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]
    );
  }

}

Future<List<FundDocument>> getFundDocuments(int fundId) async {
  var response = await http.get(
    StringUtils().stringToUri("/fund/document", params: {'fundId': fundId.toString()}),
    headers: await StringUtils().header(),
  );
  print(response.body);

  return jsonDecode(utf8.decode(response.bodyBytes)).map<FundDocument>((json) => FundDocument.fromJson(json)).toList();
}

Future<int> postFundDocument(int fundId, String title, FundDocumentType type) async {
  var response = await http.post(
    StringUtils().stringToUri('/fund/document'),
    body: jsonEncode({"fundId": fundId.toString(), "title": title, "type": type.english}),
    headers: await StringUtils().header(),
  );

  return int.parse(response.body);
}