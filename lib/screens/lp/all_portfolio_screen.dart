import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/widgets/core/pagination.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class AllPortfolioScreen extends StatefulWidget {
  const AllPortfolioScreen({super.key});

  @override
  State<StatefulWidget> createState() => AllPortfolioScreenState();

}

class AllPortfolioScreenState extends State<AllPortfolioScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
        main: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("전체 포트폴리오", style: WidgetUtils.titleStyle,),
              Container(
                width: 1280,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: FutureBuilder(
                  future: fetchAllFunds(),
                  builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                    if (snapshot.hasError || !snapshot.hasData) {
                      StringUtils().printError(snapshot);
                      return const CircularProgressIndicator();
                    } else {
                      return getDataTable(snapshot.data!);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        isAdmin: false,
        crumbs: ['전체 포트폴리오']
    );
  }

}

DataTable getDataTable(List<Fund> funds) => DataTable(
    headingTextStyle: const TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: -0.16,
      color: Color(0xff222222)
    ),
    dataTextStyle: const TextStyle(
        fontFamily: StringUtils.pretendard,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: -0.16,
        color: Color(0xff757575)
    ),
    border: const TableBorder(
      top: BorderSide(width: 2, color: Color(0xff333333)),
      horizontalInside: BorderSide(color: Color(0xffe6e6e6))
    ),
    columns: const [
      DataColumn(label: Text("조합명")),
      DataColumn(label: Text("투자종목")),
      DataColumn(label: Text("업무집행조합원")),
      DataColumn(label: Text("조합결성일")),
      DataColumn(label: Text("투자형태")),
      DataColumn(label: Text("해산일")),
      // DataColumn(label: Text("해산방식")),
    ],
    rows: funds.map<DataRow>((fund) => fund.toAllPortfolioRow()).toList(),
  );