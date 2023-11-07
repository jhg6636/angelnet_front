import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {

  final bool isAdmin;

  const NotificationScreen({super.key, required this.isAdmin});

  @override
  State<StatefulWidget> createState() => NotificationScreenState();

}

class NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("알림",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                  color: Color(0xff111111),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 100),
                child: const Center(
                  child: Text("알림이 없습니다.", style: WidgetUtils.dataTableDataStyle,),
                ),
              )
              // if (widget.isAdmin) Container(
              //     margin: const EdgeInsets.fromLTRB(0, 30, 0, 29),
              //     child: Row(
              //       children: [
              //         Flexible(
              //             child: InkWell(
              //                 child: ClipPath(
              //                     clipper: CustomBorderClipper(),
              //                     child: Container(
              //                         width: 640,
              //                         height: 62,
              //                         decoration: const BoxDecoration(
              //                             color: Colors.white,
              //                             border: Border(
              //                               top: BorderSide(color: Color(0xff1173f9), width: 2),
              //                               left: BorderSide(color: Color(0xff1173f9), width: 2),
              //                               right: BorderSide(color: Color(0xff1173f9), width: 2),
              //                             )
              //                         ),
              //                         child: const Center(
              //                           child: Text("받은 알림함",
              //                             style: TextStyle(
              //                                 fontFamily: StringUtils.pretendard,
              //                                 fontSize: 17,
              //                                 fontWeight: FontWeight.w600,
              //                                 color: Color(0xff1173f9),
              //                                 letterSpacing: -0.17
              //                             ),
              //                           ),
              //                         )
              //                     )
              //                 )
              //             )
              //         ),
              //         Flexible(
              //             child: InkWell(
              //               onTap: () {
              //                 // Get.to(const FindPwScreen());
              //               },
              //               child: Container(
              //                   width: 640,
              //                   height: 62,
              //                   decoration: const BoxDecoration(
              //                       color: Color(0xfff9f9f9),
              //                       border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
              //                   ),
              //                   child: const Center(
              //                     child: Text("알림보내기",
              //                       style: TextStyle(
              //                           fontFamily: StringUtils.pretendard,
              //                           fontSize: 17,
              //                           fontWeight: FontWeight.w400,
              //                           color: Color(0xff282728),
              //                           letterSpacing: -0.17
              //                       ),
              //                     ),
              //                   )
              //               ),
              //             )
              //         )
              //       ],
              //     )
              // ),
              // if (widget.isAdmin) Container(
              //   padding: const EdgeInsets.fromLTRB(270, 30, 270, 18),
              //   color: const Color(0xfff7faff),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         height: 42,
              //         color: Colors.white,
              //         child: Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.fromLTRB(12, 12, 47, 11),
              //               child: const Text("그룹명",
              //                 style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w400,
              //                     fontFamily: StringUtils.pretendard,
              //                     letterSpacing: -0.16,
              //                     color: Color(0xff333333)
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               padding: const EdgeInsets.fromLTRB(0, 15, 12, 18),
              //               child: const Icon(CupertinoIcons.arrowtriangle_down_fill, color: Color(0xff333333), size: 12,),
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(
              //         height: 42,
              //         margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //         color: Colors.white,
              //         child: Row(
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.fromLTRB(12, 12, 47, 11),
              //               child: const Text("조합명",
              //                 style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w400,
              //                     fontFamily: StringUtils.pretendard,
              //                     letterSpacing: -0.16,
              //                     color: Color(0xff333333)
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               padding: const EdgeInsets.fromLTRB(0, 15, 12, 18),
              //               child: const Icon(CupertinoIcons.arrowtriangle_down_fill, color: Color(0xff333333), size: 12,),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //           width: 320,
              //           height: 42,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(2),
              //             color: Colors.white,
              //           ),
              //           child: Row(
              //             children: [
              //               Flexible(
              //                   flex: 29,
              //                   child: TextField(
              //                     controller: searchTextController,
              //                     textAlignVertical: TextAlignVertical.bottom,
              //                     decoration: const InputDecoration(
              //                         border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              //                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              //                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              //                         hintText: "이름을 입력하세요",
              //                         hintStyle: TextStyle(
              //                             fontFamily: StringUtils.pretendard,
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.w400,
              //                             color: Color(0xff757575),
              //                             letterSpacing: -0.16
              //                         )
              //                     ),
              //                   )
              //               ),
              //               Flexible(
              //                   flex: 3,
              //                   child: InkWell(
              //                     onTap: () {},
              //                     child: Container(
              //                       width: 20.31,
              //                       height: 20.31,
              //                       decoration: const BoxDecoration(
              //                           image: DecorationImage(
              //                             image: AssetImage('lib/assets/images/search_icon.png'),
              //                             fit: BoxFit.fill,
              //                           )
              //                       ),
              //                     ),
              //                   )
              //               )
              //             ],
              //           )
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.fromLTRB(0, 21, 0, 0),
              //   child: const Divider(thickness: 2, color: Color(0xff555555),)
              // ),
              // Container(
              //   height: 543,
              //   margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // todo 알림 class에 widget을 만들 수 있게 해둔다
              //       Container(
              //         margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              //         decoration: const BoxDecoration(
              //           border: Border(left: BorderSide(color: Color(0x33002997)))
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Container(
              //                       width: 6,
              //                       height: 6,
              //                       transform: Matrix4.translationValues(-3, 0, 0),
              //                       decoration: const BoxDecoration(
              //                         shape: BoxShape.circle,
              //                         color: Color(0xff0361f9),
              //                       ),
              //                     ),
              //                     if (widget.isAdmin) Container(
              //                       margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //                       child: const Text("김철수(kimcs3937)",
              //                         style: TextStyle(
              //                           fontFamily: StringUtils.pretendard,
              //                           fontWeight: FontWeight.w500,
              //                           fontSize: 16,
              //                           letterSpacing: -0.16,
              //                           color: Color(0xff333333),
              //                         ),
              //                       ),
              //                     ),
              //                     if (widget.isAdmin) const Text("|",
              //                       style: TextStyle(
              //                         fontSize: 10,
              //                         color: Color(0x4d707070)
              //                       ),
              //                     ),
              //                     Container(
              //                       margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              //                       child: const Text("2023.05.05 11:12:31",
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.w600,
              //                           fontSize: 16,
              //                           fontFamily: StringUtils.pretendard,
              //                           color: Color(0xff1173f9),
              //                           letterSpacing: -0.32
              //                         ),
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //                 Container(
              //                   margin: const EdgeInsets.fromLTRB(16, 12, 0, 0),
              //                   child: const Text("'김철수' 조합원님이 서류를 제출하셨습니다.",
              //                     style: TextStyle(
              //                       fontFamily: StringUtils.pretendard,
              //                       fontSize: 19,
              //                       fontWeight: FontWeight.w600,
              //                       color: Color(0xff333333),
              //                     )
              //                   ),
              //                 )
              //               ],
              //             ),
              //             Container(
              //               margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Container(
              //                         width: 6,
              //                         height: 6,
              //                         transform: Matrix4.translationValues(-3, 0, 0),
              //                         decoration: const BoxDecoration(
              //                           shape: BoxShape.circle,
              //                           color: Color(0xff0361f9),
              //                         ),
              //                       ),
              //                       if (widget.isAdmin) Container(
              //                         margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //                         child: const Text("김철수(kimcs3937)",
              //                           style: TextStyle(
              //                             fontFamily: StringUtils.pretendard,
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: 16,
              //                             letterSpacing: -0.16,
              //                             color: Color(0xff333333),
              //                           ),
              //                         ),
              //                       ),
              //                       if (widget.isAdmin) const Text("|",
              //                         style: TextStyle(
              //                             fontSize: 10,
              //                             color: Color(0x4d707070)
              //                         ),
              //                       ),
              //                       Container(
              //                         margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              //                         child: const Text("2023.05.05 11:12:31",
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 16,
              //                               fontFamily: StringUtils.pretendard,
              //                               color: Color(0xff1173f9),
              //                               letterSpacing: -0.32
              //                           ),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   Container(
              //                     margin: const EdgeInsets.fromLTRB(16, 12, 0, 60),
              //                     child: const Text("서류제출이 시작되었습니다.",
              //                         style: TextStyle(
              //                           fontFamily: StringUtils.pretendard,
              //                           fontSize: 19,
              //                           fontWeight: FontWeight.w600,
              //                           color: Color(0xff333333),
              //                         )
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: 520,
              //         height: 342,
              //         margin: const EdgeInsets.fromLTRB(0, 0, 11, 0),
              //         decoration: BoxDecoration(
              //           image: const DecorationImage(
              //             image: AssetImage('lib/assets/images/lp_notification_image.png'),
              //             fit: BoxFit.cover,
              //           ),
              //           borderRadius: BorderRadius.circular(5)
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          )
        ),
        isAdmin: widget.isAdmin, crumbs: const ["마이페이지", "알림"],
      );
  }

}