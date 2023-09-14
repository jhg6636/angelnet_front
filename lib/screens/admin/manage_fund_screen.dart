import 'package:angelnet/widgets/core/pagination.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: const Text("페이지",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    const Text("1",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: const Text("/6",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.16,
                            color: Color(0xff333333),
                          ),
                        )
                    ),
                    const Text("총 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    ),
                    const Text("60",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
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
                        onPressed: () {},
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
              child: DataTable(
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
                  DataColumn(label: Text("기능")),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("183")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff43a3d6),
                      child: const Text("서류접수중", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("289")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff8f40de),
                      child: const Text("조합검토기간", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("183")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff323c4e),
                      child: const Text("해산", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("183")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff002997),
                      child: const Text("주금납입", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("183")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff0361f9),
                      child: const Text("참여신청", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text("101")),
                    const DataCell(Text("리벤처스 지역엔젤 투자조합")),
                    const DataCell(Text("소부장")),
                    const DataCell(Text("리벤처스")),
                    const DataCell(Text("183")),
                    DataCell(Container(
                      alignment: Alignment.center,
                      width: 84,
                      height: 28,
                      color: const Color(0xff04b45f),
                      child: const Text("운용중", style: statusTextStyle,),
                    )),
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
                            tooltip: "수정",
                            onPressed: () {},
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
                            // border: Border.all(color: )
                          ),
                          child: IconButton(
                            alignment: Alignment.center,
                            splashRadius: 18,
                            tooltip: "삭제",
                            onPressed: () {},
                            icon: const Icon(Remix.subtract_line, size: 14, color: Colors.white,),
                          ),
                        )
                      ],
                    )),
                  ]),
                ]
              ),
            ),
            pagination(1)
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

DataTable adminFundTable(List<Fund> funds) {
  return DataTable(columns: const [
    DataColumn(label: Text("번호")),
    DataColumn(label: Text("조합명")),
    DataColumn(label: Text("투자종목")),
    DataColumn(label: Text("총 결성금액")),
    DataColumn(label: Text("현재 참여금액")),
    DataColumn(label: Text("잔여 금액")),
    DataColumn(label: Text("현재 참여 인원")),
    DataColumn(label: Text("조합결성일")),
    DataColumn(label: Text("상태"))
  ], rows: funds.map<DataRow>((fund) => fund.toAdminDataRow()).toList());
}