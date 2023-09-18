import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/widgets/core/pagination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/admin/group.dart';
import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../screen_frame.dart';

class ManageGroupScreen extends StatefulWidget {

  const ManageGroupScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageGroupScreenState();

}

class ManageGroupScreenState extends State<ManageGroupScreen> {
  final _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("그룹관리", style: WidgetUtils.titleStyle,),
            Container(
              width: 1280,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
              decoration: const BoxDecoration(
                color: Color(0xfff7faff),
                border: Border(top: BorderSide(color: Color(0xff1173f9), width: 2))
              ),
              child: Container(
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
                            controller: _groupNameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                hintText: "그룹명을 입력하세요",
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Color(0xffcccccc)),
                    ),
                    padding: const EdgeInsets.fromLTRB(28, 10, 27, 10),
                    fixedSize: const Size(127, 36)
                  ),
                  onPressed: () {}, // todo 그룹 생성 팝업
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: const Icon(Remix.folder_add_line, size: 16, color: Color(0xff333333),),
                      ),
                      const Text("그룹 생성",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.14,
                          color: Color(0xff333333)
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 31),
              width: 1280,
              child: DataTable(
                  dataRowMaxHeight: 62,
                  dataRowMinHeight: 62,
                  dataTextStyle: WidgetUtils.dataTableDataStyle,
                  headingTextStyle: WidgetUtils.dataTableHeadStyle,
                  border: const TableBorder(
                    top: BorderSide(color: Color(0xff555555), width: 2),
                    horizontalInside: BorderSide(color: Color(0xffdddddd)),
                    bottom: BorderSide(color: Color(0xffdddddd)),
                  ),
                  columns: const [
                    DataColumn(label: Text("번호")),
                    DataColumn(label: Text("그룹명")),
                    DataColumn(label: Text("그룹인원")),
                    DataColumn(label: Text("생성일")),
                    DataColumn(label: Text("기능")),
                  ],
                  rows: [
                    for (int i=0; i<10; i++) DataRow(cells: [
                      const DataCell(Text("101")),
                      const DataCell(Text("101")),
                      const DataCell(Text("101")),
                      const DataCell(Text("101")),
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
                      ))
                    ])
                  ]
              ),
            ),
            pagination(1),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["그룹관리"]
    );
    // return ScreenFrame(
    //     main: SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 20.0,),
    //           const Text(
    //             "그룹 관리",
    //             style: WidgetUtils.titleStyle,
    //           ),
    //           const SizedBox(height: 12.0,),
    //           FutureBuilder(
    //             future: fetchAllGroups(),
    //             builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
    //               if (snapshot.hasError) {
    //                 print(snapshot.error);
    //                 print(snapshot.stackTrace);
    //                 return WidgetUtils.errorPadding;
    //               } else if (snapshot.hasData == false) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 return makeDataTable(snapshot.data ?? List.empty());
    //               }
    //             }
    //           ),
    //           ElevatedButton(
    //               onPressed: () {
    //                 showModalBottomSheet(
    //                     context: context,
    //                     builder: (BuildContext context) {
    //                       return SingleChildScrollView(
    //                         child: Column(
    //                           children: [
    //                             TextField(
    //                               controller: _groupNameController,
    //                               decoration: const InputDecoration(
    //                                 labelText: "그룹명",
    //                                 border: OutlineInputBorder(),
    //                               ),
    //                             ),
    //                             ButtonBar(
    //                               children: [
    //                                 TextButton(
    //                                     onPressed: () {
    //                                       Navigator.pop(context);
    //                                     },
    //                                     child: const Text("취소하기")
    //                                 ),
    //                                 ElevatedButton(
    //                                     onPressed: () async {
    //                                       var response = await makeGroup(_groupNameController.text);
    //                                       if (response.statusCode == 200) {
    //                                         Fluttertoast.showToast(msg: "그룹이 생성되었습니다.");
    //                                         Navigator.pop(context);
    //                                       } else {
    //                                         Fluttertoast.showToast(msg: "그룹이 생성되지 않았습니다. 관리자에게 문의해 주세요.");
    //                                       }
    //                                       print(response.body);
    //                                     },
    //                                     child: const Text("추가하기")
    //                                 )
    //                               ],
    //                             )
    //                           ],
    //                         )
    //                       );
    //                 });
    //               },
    //               child: const Text("그룹 추가")
    //           )
    //         ],
    //       ),
    //     ),
    //     isAdmin: true
    // );
  }

}