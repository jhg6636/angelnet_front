import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/lp/fund_document_status.dart';
import '../../models/lp/fund_document_submission.dart';

class LpDocumentScreen extends StatefulWidget {

  const LpDocumentScreen({super.key});

  @override
  State<StatefulWidget> createState() => LpDocumentScreenState();

}

class LpDocumentScreenState extends State<LpDocumentScreen> {
  final statuses = ["전체"] + FundDocumentStatus.values.map((value) => value.korean).toList();
  var selectedStatus = "전체";

  @override
  Widget build(BuildContext context) {
    var myDocuments = getMyDocuments(null);
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("서류제출", style: WidgetUtils.titleStyle),
            Container(
              width: 1280,
              height: 83,
              margin: const EdgeInsets.fromLTRB(0, 24, 0, 26),
              alignment: Alignment.center,
              child: DottedBorder(
                color: const Color(0xffb5becc),
                dashPattern: const [3, 3],
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Remix.error_warning_fill, color: Color(0xff00958f), size: 27,),
                      const SizedBox(width: 4,),
                      FutureBuilder(
                        future: myDocuments,
                        builder: (BuildContext context, AsyncSnapshot<List<FundDocumentSubmission>> snapshot) {
                          const style = TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333)
                          );
                          if (snapshot.hasError) {
                            StringUtils().printError(snapshot);
                            return const CircularProgressIndicator();
                          } else if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          } else {
                            if (snapshot.data!.isEmpty) {
                              return const Text("모든 서류가 제출처리 되었습니다!", style: style,);
                            }
                            int needSubmissionCount = 0;
                            for (var document in snapshot.data!) {
                              if (document.status == FundDocumentStatus.notSubmitted) {
                                needSubmissionCount += 1;
                              }
                            }
                            return Text("총 $needSubmissionCount건의 서류제출이 필요합니다.", style: style);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("총 ", style: WidgetUtils.lightStyle,),
                    FutureBuilder(
                      future: myDocuments,
                      builder: (BuildContext context, AsyncSnapshot<List<FundDocumentSubmission>> snapshot) {
                        if (snapshot.hasError) {
                          StringUtils().printError(snapshot);
                          return const Text("0", style: WidgetUtils.boldStyle,);
                        } else if (!snapshot.hasData) {
                          return const Text("0", style: WidgetUtils.boldStyle,);
                        } else {
                          return Text(snapshot.data!.length.toString(), style: WidgetUtils.boldStyle,);
                        }
                      },
                    ),
                    const Text("건", style: WidgetUtils.lightStyle,),
                  ],
                ),
                Container(
                  height: 37,
                  padding: const EdgeInsets.fromLTRB(24, 0, 15, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: const Color(0xfff4f4f4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedStatus,
                      items: statuses.map((status) => DropdownMenuItem<String>(
                        value: status,
                        child: Text(status, style: WidgetUtils.semiBoldStyle),))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value ?? "전체";
                        });
                      }
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              width: 1280,
              child: FutureBuilder(
                future: myDocuments,
                builder: (BuildContext context, AsyncSnapshot<List<FundDocumentSubmission>> snapshot) {
                  if (snapshot.hasError) {
                    StringUtils().printError(snapshot);
                    return const Center(
                      child: Text("제출하실 서류가 존재하지 않습니다.", style: WidgetUtils.dataTableDataStyle),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("제출하실 서류가 존재하지 않습니다.", style: WidgetUtils.dataTableDataStyle),
                    );
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("제출하실 서류가 존재하지 않습니다.", style: WidgetUtils.dataTableDataStyle),
                      );
                    }
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text("번호")),
                        DataColumn(label: Text("조합명")),
                        DataColumn(label: Text("서류명")),
                        DataColumn(label: Text("상태")),
                        DataColumn(label: Text("양식 다운로드")),
                        DataColumn(label: Text("제출 서류")),
                        DataColumn(label: Text("제출 시간")),
                        DataColumn(label: Text("검토 시간")),
                      ],
                      rows: snapshot.data!.indexed.map((e) => e.$2.toDataRow(e.$1 + 1)).toList()
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      isAdmin: false,
      crumbs: const ["서류제출"]
    );
  }

}