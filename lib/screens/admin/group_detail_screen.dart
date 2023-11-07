import 'package:angelnet/models/admin/group.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/custom_border_clipper.dart';
import 'package:angelnet/widgets/admin/group_fund_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/admin/group_member_widget.dart';

class GroupDetailScreen extends StatefulWidget {
  final Group group;

  const GroupDetailScreen({super.key, required this.group});

  // const GroupDetailScreen({super.key, required this.group});

  @override
  State<StatefulWidget> createState() => GroupDetailScreenState();
}

class GroupDetailScreenState extends State<GroupDetailScreen> {
  var selectedMenu = '회원관리';

  // late Future<List<User>> users;

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
        main: Container(
          margin: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "그룹관리",
                style: WidgetUtils.titleStyle,
              ),
              const SizedBox(height: 30,),
              Row(children: [
                Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMenu = '회원관리';
                        });
                      },
                      child: (selectedMenu == '회원관리')
                          ? ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  height: 62,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                        left: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                        right: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                      )),
                                  child: const Center(
                                    child: Text(
                                      "회원관리",
                                      style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1173f9),
                                          letterSpacing: -0.17),
                                    ),
                                  )))
                          : Container(
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff9f9f9),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff1173f9), width: 2))),
                              child: const Center(
                                child: Text("회원관리",
                                    style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff282728),
                                        letterSpacing: -0.17)),
                              )),
                    )),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMenu = '노출 조합 관리';
                        });
                      },
                      child: (selectedMenu == '노출 조합 관리')
                          ? ClipPath(
                              clipper: CustomBorderClipper(),
                              child: Container(
                                  height: 62,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        top: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                        left: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                        right: BorderSide(
                                            color: Color(0xff1173f9), width: 2),
                                      )),
                                  child: const Center(
                                    child: Text(
                                      "노출 조합 관리",
                                      style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1173f9),
                                          letterSpacing: -0.17),
                                    ),
                                  )))
                          : Container(
                              height: 62,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff9f9f9),
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xff1173f9), width: 2))),
                              child: const Center(
                                child: Text("노출 조합 관리",
                                    style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff282728),
                                        letterSpacing: -0.17)),
                              )),
                    )),
              ]),
              if (selectedMenu == '회원관리')
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                  child: GroupMemberWidget(group: widget.group,),
                ),
              if (selectedMenu == '노출 조합 관리')
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                  child: GroupFundWidget(group: widget.group,),
                )
            ],
          ),
        ),
        isAdmin: true,
        crumbs: ["그룹관리", widget.group.name]);
    // users = fetchUsersInGroup(widget.group.id);
    //
    // return ScreenFrame(
    //     main: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Wrap(
    //             alignment: WrapAlignment.center,
    //             children: [
    //               Text("${widget.group.name} 그룹", style: WidgetUtils.titleStyle,),
    //               ButtonBar(
    //                 children: [
    //                   OutlinedButton.icon(
    //                     onPressed: () {
    //                       deleteGroup(widget.group.id);
    //                     },
    //                     icon: const Icon(Icons.delete),
    //                     label: const Text("그룹 삭제"),
    //                   ),
    //                   OutlinedButton.icon(
    //                     onPressed: () {
    //                       TextEditingController nameController = TextEditingController();
    //                     // TODO 변경 팝업 -> API 연결
    //                       showModalBottomSheet(
    //                           context: context,
    //                           builder: (BuildContext context) {
    //                             return Column(
    //                               children: [
    //                                 TextField(
    //                                   controller: nameController,
    //                                   decoration: const InputDecoration(labelText: "그룹명"),
    //                                 ),
    //                                 FilledButton(
    //                                   onPressed: () {
    //
    //                                   },
    //                                   child: const Text("변경하기")
    //                                 )
    //                               ],
    //                             );
    //                           }
    //                       );
    //                     },
    //                     icon: const Icon(Icons.edit),
    //                     label: const Text("그룹명 변경")
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //           Wrap(
    //             children: [
    //               const Text("멤버 보기", style: WidgetUtils.h1Deprecated,),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   showModalBottomSheet(context: context, builder: (context) {
    //                     return SingleChildScrollView(
    //                       child: GroupEditMemberWidget(groupId: widget.group.id),
    //                     );
    //                   });
    //                 },
    //                 child: const Text("멤버 편집")
    //               )
    //             ],
    //           ),
    //           FutureBuilder(
    //             future: users,
    //             builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
    //               if (snapshot.hasError) {
    //                 print(snapshot.error);
    //                 print(snapshot.stackTrace);
    //                 return WidgetUtils.errorPadding;
    //               } else if (snapshot.hasData == false) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 return makeGroupMemberDataTable(snapshot.data ?? List.empty());
    //               }
    //             }
    //           ),
    //         ],
    //       ),
    //     ),
    //     isAdmin: true
    // );
  }
}
