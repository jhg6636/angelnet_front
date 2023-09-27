import 'package:angelnet/widgets/core/pagination.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/fund/fund.dart';
import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/lp/fund_form.dart';
import '../screen_frame.dart';
import '../screen_frame_v2.dart';

class ManageFundScreen extends StatefulWidget {
  const ManageFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageFundScreenState();
}

class ManageFundScreenState extends State<ManageFundScreen> {
  final searchTextController = TextEditingController();

  final List<String> _fundStatusFilterOptions = [
    "READY",
    "FUNDING",
    "COMPLETE"
  ];

  // final List<String> _selectedFundStatuses = [];
  var selectedStatus = "진행상태";
  final statuses = ["진행상태", "참여신청", "서류접수중", "조합검토기간", "주금납입", "해산", "운용중"];
  var searchOption = "전체";
  final searchOptions = ["전체", "조합명", "투자종목", "담당자"];
  static const statusTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: StringUtils.pretendard,
    letterSpacing: -0.45,
    color: Colors.white
  );

  // late Future<List<Fund>> funds;

  @override
  Widget build(BuildContext context) {
    var funds = fetchAllFunds();
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합현황", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
              decoration: const BoxDecoration(
                color: Color(0xfff7faff),
                border: Border(top: BorderSide(color: Color(0xff1173f9), width: 2))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.white,
                      height: 42,
                      child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                        value: selectedStatus,
                        items: statuses
                            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          selectedStatus = value ?? "진행상태";
                        }),
                      ))
                  ),
                  Container(
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 42,
                      child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                        value: searchOption,
                        items: searchOptions
                            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          searchOption = value ?? "전체";
                        }),
                      ))
                  ),
                  Container(
                      width: 320,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 29,
                              child: TextField(
                                controller: searchTextController,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    hintText: "검색어를 입력하세요",
                                    hintStyle: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff757575),
                                        letterSpacing: -0.16
                                    )
                                ),
                              )
                          ),
                          Flexible(
                              flex: 3,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 9.69, 0),
                                  width: 20.31,
                                  height: 20.31,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('lib/assets/images/search_icon.png'),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                              )
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("총 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    ),
                    FutureBuilder(
                      future: funds,
                      builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                        if (snapshot.hasError) {
                          StringUtils().printError(snapshot);
                          return const Text("0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          );
                        } else if (!snapshot.hasData) {
                          return const Text("0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          );
                        } else {
                          return Text((snapshot.data?.length ?? 0).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.16,
                                color: Color(0xff333333),
                              )
                          )
                        }
                      },
                    ),
                    const Text("건",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 131,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Color(0xffcccccc)),
                                borderRadius: BorderRadius.circular(50)
                            )
                        ),
                        onPressed: () {
                          Get.to(FundForm(isMaking: true, fund: null))
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: const Icon(Remix.folder_add_line, size: 16, color: Color(0xff333333),),
                              ),
                              const Text("신규 조합 생성",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.14,
                                    color: Color(0xff333333)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 1280,
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 31),
              child: FutureBuilder(
                future: funds,
                builder: (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
                  if (snapshot.hasError) {
                    StringUtils().printError(snapshot);
                    return const CircularProgressIndicator();
                  } else if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return adminFundTable(snapshot.data ?? [], context);
                  }
                },
              )
            ),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["조합현황"],
    );
    // funds = fetchAllFunds();
    // return ScreenFrame(
    //   main: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       const SizedBox(height: 36.0),
    //       const Text(
    //         "조합 관리",
    //         style: WidgetUtils.titleStyle,
    //       ),
    //       const SizedBox(height: 36.0),
    //       Wrap(
    //         children: [
    //           Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: SizedBox(
    //                 width: 350.0,
    //                 child: TextField(
    //                   controller: _nameSearchController,
    //                   decoration: const InputDecoration(
    //                     labelText: "조합명",
    //                     border: OutlineInputBorder(),
    //                   ),
    //                 ),
    //               )),
    //           Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: SizedBox(
    //                 width: 350.0,
    //                 child: TextField(
    //                   controller: _startupNameSearchController,
    //                   decoration: const InputDecoration(
    //                     labelText: "투자종목",
    //                     border: OutlineInputBorder(),
    //                   ),
    //                 ),
    //               )),
    //           const Padding(
    //               padding: EdgeInsets.all(10.0), child: Text("상태 (복수 선택 가능)")),
    //           Wrap(
    //               crossAxisAlignment: WrapCrossAlignment.end,
    //               children: _fundStatusFilterOptions.map((option) {
    //                 return Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 5.0),
    //                     child: FilterChip(
    //                         label: Text(option),
    //                         selected: _selectedFundStatuses.contains(option),
    //                         onSelected: (bool selected) {
    //                           setState(() {
    //                             if (selected) {
    //                               _selectedFundStatuses.add(option);
    //                             } else {
    //                               _selectedFundStatuses.remove(option);
    //                             }
    //                           });
    //                         }));
    //               }).toList()),
    //         ],
    //       ),
    //       ButtonBar(
    //         alignment: MainAxisAlignment.center,
    //         children: [
    //           FilledButton.icon(
    //             onPressed: () {
    //               setState(() {
    //                 funds = fetchAllFunds();
    //               });
    //             },
    //             icon: const Icon(Icons.search),
    //             label: const Text("검색"),
    //           ),
    //           FilledButton.icon(
    //             onPressed: () {
    //               showModalBottomSheet(
    //                   context: context,
    //                   builder: (BuildContext context) {
    //                     return const FundForm(isMaking: true, fund: null);
    //                   });
    //               setState(() {
    //                 funds = fetchAllFunds();
    //               });
    //             },
    //             icon: const Icon(Icons.add),
    //             label: const Text("조합 생성"),
    //           ),
    //         ],
    //       ),
    //       FutureBuilder<List<Fund>>(
    //         future: funds,
    //         builder:
    //             (BuildContext context, AsyncSnapshot<List<Fund>> snapshot) {
    //               ScrollController vertical = ScrollController();
    //               ScrollController horizontal = ScrollController();
    //               if (snapshot.hasError) {
    //                 print(snapshot.error);
    //                 print(snapshot.stackTrace);
    //                 return WidgetUtils.errorPadding;
    //               } else if (snapshot.hasData == false) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 return Scrollbar(
    //                   controller: vertical,
    //                   child: SingleChildScrollView(
    //                     controller: vertical,
    //                     child: Scrollbar(
    //                       controller: horizontal,
    //                       child: SingleChildScrollView(
    //                         scrollDirection: Axis.horizontal,
    //                         controller: horizontal,
    //                         child: adminFundTable(snapshot.data ?? List.empty()),
    //                       ),
    //                     ),
    //                   )
    //                 );
    //               }
    //         },
    //       ),
    //     ],
    //   ),
    //   isAdmin: true,
    // );
  }
}

DataTable adminFundTable(List<Fund> funds, BuildContext context) {
  return DataTable(
    border: const TableBorder(
        top: BorderSide(color: Color(0xff333333), width: 2),
        horizontalInside: BorderSide(color: Color(0xffe6e6e6)),
        bottom: BorderSide(color: Color(0xffe6e6e6))
    ),
    headingTextStyle: WidgetUtils.dataTableHeadStyle,
    dataTextStyle: WidgetUtils.dataTableDataStyle,
    dataRowMinHeight: 62,
    dataRowMaxHeight: 62,
    columns: const [
      DataColumn(label: Text("번호")),
      DataColumn(label: Text("조합명")),
      DataColumn(label: Text("투자종목")),
      DataColumn(label: Text("담당자")),
      DataColumn(label: Text("참여인원")),
      DataColumn(label: Text("진행상태")),
      DataColumn(label: Text("기능"))
    ],
    rows: funds.indexed.map<DataRow>((e) => e.$2.toAdminDataRow(e.$1 + 1, context)).toList());
}