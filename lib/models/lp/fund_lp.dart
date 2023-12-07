import 'dart:convert';
import 'dart:typed_data';

import 'package:angelnet/models/file/file.dart';
import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/models/lp/lp_document_type.dart';
import 'package:angelnet/models/lp/lp_status.dart';
import 'package:angelnet/utils/FileUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class FundLp {
  final int id;
  final String stringId;
  final String name;
  final String phone;
  final int cost;
  final int shares;
  final LpStatus status;
  final DateTime? depositAt;

  const FundLp({
    required this.id,
    required this.stringId,
    required this.name,
    required this.phone,
    required this.cost,
    required this.shares,
    required this.status,
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
      depositAt: (json['depositAt'] == null)? null : DateTime(json['depositAt'][0], json['depositAt'][1], json['depositAt'][2], json['depositAt'][3], json['depositAt'][4], json['depositAt'][5])
    );
  }

  DataRow toFundLpDataRow(int index, BuildContext context, Function setState) {
    return DataRow(cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(stringId)),
      DataCell(Text(name)),
      DataCell(Text(phone)),
      DataCell(Text("${StringUtils().currencyFormat(cost)}원 ($shares좌)")),
      DataCell(status.toFundLpWidget()),
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
              onPressed: () async {
                var file = await getLpDocumentFileMetadata(id, LpDocumentType.loc);
                download(file.id, "${name}_출자증서");
              },
              splashRadius: 4.0,
              tooltip: "다운로드",
              icon: const Icon(Remix.download_line, color: Color(0xff222222), size: 16,))
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                  onPressed: () async {
                    var pickedFile = await FileUtils().pickAnyFile();
                    var lpDocumentId = await uploadLpDocument(id, LpDocumentType.loc);
                    File file = File(
                      id: -1,
                      name: "${name}_출자증서.${pickedFile?.files.first.extension ?? ""}",
                      targetId: lpDocumentId,
                      targetType: FileTarget.lpDocument
                    );
                    upload(pickedFile?.files.first.bytes ?? Uint8List(0), file);
                  },
                  splashRadius: 4.0,
                  tooltip: "업로드 / 파일 수정",
                  icon: const Icon(Remix.upload_line, color: Color(0xff222222), size: 14,))
              ),
            )
          ],
        )
      ),
      DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                  onPressed: () async {
                    var file = await getLpDocumentFileMetadata(id, LpDocumentType.loc);
                    download(file.id, "${name}_소득공제");
                  },
                  splashRadius: 4.0,
                  tooltip: "다운로드",
                  icon: const Icon(Remix.download_line, color: Color(0xff222222), size: 16,))
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: WidgetUtils.circleButtonFrame(const Color(0xfff2f2f2), IconButton(
                    onPressed: () async {
                      var pickedFile = await FileUtils().pickAnyFile();
                      var lpDocumentId = await uploadLpDocument(id, LpDocumentType.tax);
                      File file = File(
                          id: -1,
                          name: "${name}_소득공제.${pickedFile?.files.first.extension ?? ""}",
                          targetId: lpDocumentId,
                          targetType: FileTarget.lpDocument
                      );
                      upload(pickedFile?.files.first.bytes ?? Uint8List(0), file);
                    },
                    splashRadius: 4.0,
                    tooltip: "업로드 / 파일 수정 (파일이 2개 이상일 경우 압축 파일로 올려 주세요)",
                    icon: const Icon(Remix.upload_line, color: Color(0xff222222), size: 14,))
                ),
              )
            ],
          )
      ),
      DataCell(
        depositAt != null? Container(
            width: 84,
            height: 28,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                unCheckDeposit(id);
                setState;
              },
              child: Text(DateFormat('yyyy-MM-dd hh:mm').format(depositAt!), style: WidgetUtils.dataTableDataStyle,)
            )
          ) : Container(
          width: 84,
          height: 28,
          alignment: Alignment.center,
          color: const Color(0xfff4f4f4),
          child: TextButton(
            onPressed: () async {
              checkDeposit(id);
              setState;
            },
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
        )
      ),
      DataCell(WidgetUtils.circleButtonFrame(const Color(0xfff5a9a9), IconButton(
        tooltip: "삭제",
        padding: const EdgeInsets.all(0),
        splashRadius: 4.0,
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return CustomAlertWidget().deleteWidget(context, () => null);
            }
          );
        },
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

  var responseBody = jsonDecode(utf8.decode(response.bodyBytes));
  return responseBody.map<FundLp>((json) => FundLp.fromJson(json)).toList();
}

Future<DateTime> checkDeposit(int lpId) async {
  var response = await http.post(
    StringUtils().stringToUri("/lp/deposit"),
    body: lpId.toString(),
    headers: await StringUtils().header(),
  );
  var dateTimeList = jsonDecode(utf8.decode(response.bodyBytes));

  return DateTime(dateTimeList[0], dateTimeList[1], dateTimeList[2], dateTimeList[3], dateTimeList[4], dateTimeList[5]);
}

Future<http.Response> unCheckDeposit(int lpId) async {
  return await http.put(
    StringUtils().stringToUri("lp/deposit"),
    body: lpId.toString(),
    headers: await StringUtils().header()
  );
}

Future<int> uploadLpDocument(int lpId, LpDocumentType type) async {
  var response = await http.post(
    StringUtils().stringToUri("/lp/document"),
    body: jsonEncode({"lpId": lpId, "type": type.english}),
    headers: await StringUtils().header()
  );

  return int.parse(response.body);
}