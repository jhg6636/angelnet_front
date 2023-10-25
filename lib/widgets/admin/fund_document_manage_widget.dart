import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/fund/make_fund_document_screen.dart';
import 'package:angelnet/models/lp/fund_document_submission.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund_document.dart';

class FundDocumentManageWidget extends StatefulWidget {

  final Fund fund;

  const FundDocumentManageWidget({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundDocumentManageWidgetState();

}

class FundDocumentManageWidgetState extends State<FundDocumentManageWidget> {
  int? selectedFundDocumentId;

  @override
  Widget build(BuildContext context) {
    if (selectedFundDocumentId == null) {
      Future<List<FundDocument>> documents = getFundDocuments(widget.fund.id);
      return Container(
        width: 1280,
        margin: const EdgeInsets.fromLTRB(0, 17, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WidgetUtils().dataTableCountRow(documents),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Color(0xffcccccc)),
                        ),
                        padding: const EdgeInsets.fromLTRB(28, 10, 27, 10),
                        fixedSize: const Size(127, 36)),
                    onPressed: () {
                      Get.to(MakeFundDocumentScreen(fund: widget.fund));
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: const Icon(
                            Remix.file_add_line,
                            size: 16,
                            color: Color(0xff333333),
                          ),
                        ),
                        const Text(
                          "회원 편집",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.14,
                              color: Color(0xff333333)),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              width: 1280,
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: FutureBuilder(
                future: documents,
                builder: (BuildContext context, AsyncSnapshot<List<FundDocument>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    StringUtils().printError(snapshot);
                    return const Text("등록된 서류가 없습니다.", style: WidgetUtils.dataTableDataStyle,);
                  } else {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text("번호")),
                        DataColumn(label: Text("구분")),
                        DataColumn(label: Text("제목")),
                        DataColumn(label: Text("완료자 수")),
                        DataColumn(label: Text("리마인드")),
                        DataColumn(label: Text("파일")),
                        DataColumn(label: Text("제출서류 검토")),
                        DataColumn(label: Text("삭제")),
                      ],
                      rows: snapshot.data!.indexed.map((e) =>
                        e.$2.toDataRow(e.$1 + 1, context, () {
                          setState(() {
                            selectedFundDocumentId = e.$2.id;
                          });
                        })
                      ).toList()
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
    } else {
      Future<List<FundDocumentSubmission>> submissions = getFundSubmissions(widget.fund.id);
      return Container(
        width: 1280,
        margin: const EdgeInsets.fromLTRB(0, 33, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetUtils().dataTableCountRow(submissions),
            Container(
              width: 1280,
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 50),
              child: FutureBuilder(
                future: submissions,
                builder: (BuildContext context, AsyncSnapshot<List<FundDocumentSubmission>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    StringUtils().printError(snapshot);
                    return const Text("조합원이 존재하지 않습니다.", style: WidgetUtils.dataTableDataStyle,);
                  } else {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text("번호")),
                        DataColumn(label: Text("조합원")),
                        DataColumn(label: Text("상태")),
                        DataColumn(label: Text("파일")),
                        DataColumn(label: Text("제출서류 검토")),
                        DataColumn(label: Text("최종 제출 시간")),
                        DataColumn(label: Text("최종 검토 시간")),
                      ],
                      rows: snapshot.data!.indexed.map((e) =>
                        e.$2.toAdminDataRow(e.$1 + 1, context, () {
                          setState(() {});
                        })
                      ).toList(),
                    );
                  }
                },
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xff222222)),
                  borderRadius: BorderRadius.circular(5),
                )
              ),
              onPressed: () {
                setState(() {
                  selectedFundDocumentId = null;
                });
              },
              child: const Text("목록",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: StringUtils.pretendard,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.34,
                  color: Color(0xff222222)
                ),
              )
            )
          ],
        ),
      );
    }
  }

}