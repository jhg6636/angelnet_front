import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/screens/bulletin/post_edit_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund.dart';

class FundPostManageWidget extends StatefulWidget {

  final Fund fund;
  const FundPostManageWidget({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundPostManageWidgetState();

}

class FundPostManageWidgetState extends State<FundPostManageWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("총 ", style: WidgetUtils.regularStyle,),
                FutureBuilder(
                  future: fetchPostsInFund(widget.fund.id),
                  builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      StringUtils().printError(snapshot);
                      return const Text("0", style: WidgetUtils.semiBoldStyle,);
                    } else {
                      return Text((snapshot.data?.length ?? 0).toString(), style: WidgetUtils.semiBoldStyle,);
                    }
                  },
                ),
                const Text("건", style: WidgetUtils.regularStyle,),
              ],
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Color(0xffcccccc)),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 10, 13, 10),
                    fixedSize: const Size(127, 36)),
                onPressed: () {
                  Get.to(const PostEditScreen());
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: const Icon(
                        Remix.edit_line,
                        size: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                    const Text(
                      "공지사항 작성",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.14,
                          color: Color(0xff333333)),
                    )
                  ],
                )
            )
          ],
        ),
        Container(
          width: 1280,
          margin: const EdgeInsets.fromLTRB(0, 17, 0, 30),
          child: FutureBuilder(
            future: fetchPostsInFund(widget.fund.id),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                StringUtils().printError(snapshot);
                return const Center(
                  child: Text("공지사항이 없습니다.", style: WidgetUtils.dataTableDataStyle,),
                );
              } else {
                return DataTable(
                  columns: const [
                    DataColumn(label: Text("번호")),
                    DataColumn(label: Text("제목")),
                    DataColumn(label: Text("작성자")),
                    DataColumn(label: Text("작성일")),
                    DataColumn(label: Text("기능")),
                  ],
                  rows: snapshot.data!.indexed.map((e) => e.$2.toFundDataRow(e.$1 + 1)).toList()
                );
              }
            },
          ),
        )
      ],
    );
  }

}