import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/admin/manage_fund_screen.dart';
import 'package:angelnet/screens/admin/manage_group_screen.dart';
import 'package:angelnet/screens/admin/manage_user_screen.dart';
import 'package:angelnet/screens/bulletin/bulletin_screen.dart';
import 'package:angelnet/screens/lp/all_portfolio_screen.dart';
import 'package:angelnet/screens/lp/funding_fund_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/notification/notification_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:printing/printing.dart';
import 'package:remixicon/remixicon.dart';
import 'package:share_plus/share_plus.dart';

import 'bulletin/manage_bulletin_screen.dart';

class ScreenFrameV2 extends StatefulWidget {

  final Widget main;
  final bool isAdmin;
  final List<String> crumbs;

  const ScreenFrameV2({super.key, required this.main, required this.isAdmin, required this.crumbs});

  @override
  State<StatefulWidget> createState() => ScreenFrameV2State();

}

class ScreenFrameV2State extends State<ScreenFrameV2> {

  final pw.Document pdf = pw.Document();
  final globalKey = GlobalKey();

  Future<void> printPage() async {
    RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List imageBytes = byteData!.buffer.asUint8List();

    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(pdfImage),
        ),
      ),
    );

    Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

  Widget breadCrumbRow(List<String> crumbs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BreadCrumb(
            divider: const Icon(Icons.chevron_right, color: Color(0xff767676), size: 16,),
            items: [
              BreadCrumbItem(
                  content: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xff0361f9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.home_5_fill, size: 16, color: Colors.white,),
                  )
              )
            ]
                + crumbs.sublist(0, crumbs.length - 1).map<BreadCrumbItem>(
                        (value) => BreadCrumbItem(
                        content: Text(value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color(0xff767676),
                              letterSpacing: -0.45
                          ),
                        )
                    )
                ).toList()
                + [BreadCrumbItem(content: Text(crumbs.last, style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xff111111),
                  letterSpacing: -0.45
                )))]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Share.share("text");
                },
                splashRadius: 16.0,
                icon: const Icon(Remix.share_line, size: 24, color: Color(0xff999999),)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: IconButton(
                  onPressed: () async {
                    await printPage();
                  },
                  splashRadius: 16.0,
                  icon: const Icon(Remix.printer_line, size: 24, color: Color(0xff999999),)
              ),
            )
          ],
        )
      ],
    );
  }

  AppBar appBar(bool isAdmin) => AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shadowColor: Colors.transparent,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    if (widget.isAdmin) {
                      Get.to(const ManageUserScreen());
                    } else {
                      Get.to(LpMyPage(user: User.fromJson(await getMyInfo())));
                    }
                  },
                  child: Container(
                    width: 154,
                    height: 52,
                    margin: const EdgeInsets.fromLTRB(108, 0, 0, 0),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/logo.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(58, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(isAdmin? const ManageUserScreen() : const FundingFundScreen());
                      },
                      child: Text(isAdmin? "회원관리" : "결성중인 조합",
                        style: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                        ),
                      ),
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(isAdmin? const ManageFundScreen() : const ManagePostScreen(isAdmin: false,));
                      },
                      child: Text(isAdmin? "조합현황" : "게시판",
                        style: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                        ),
                      )
                    )
                ),
                if (isAdmin) Container(
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ManageGroupScreen());
                      },
                      child: const Text("그룹관리",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                        ),
                      ),
                    )
                ),
                if (isAdmin) Container(
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ManagePostScreen(isAdmin: true,));
                      },
                      child: const Text("공지사항 관리",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                        ),
                      )
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Get.to(isAdmin? const NotificationScreen(isAdmin: true) : const AllPortfolioScreen());
                      },
                      child: Text(isAdmin? "알림" : "전체 포트폴리오",
                        style: const TextStyle(
                          color: Color(0xff333333),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: StringUtils.pretendard,
                        ),
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isAdmin) Container(
                  width: 58,
                  height: 26,
                  margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdddddd))
                  ),
                  child: const Text("관리자",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.15,
                        color: Color(0xff767676)
                    ),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    focusNode: FocusNode(skipTraversal: true),
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    onChanged: (value) {  },
                    items: [
                      DropdownMenuItem(
                        value: "Info",
                        child: FutureBuilder(
                          future: getMyInfo(),
                          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            if (snapshot.hasError) {
                              print("error");
                              print(snapshot.error);
                              print(snapshot.stackTrace);
                              return const CircularProgressIndicator();
                            } else if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: const Color(0xff0361f9),
                                      radius: 15.0,
                                      child: Text(
                                        snapshot.data!["name"].toString()[0],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: StringUtils.pretendard,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.4
                                        ),
                                      ),
                                    ),
                                    Text("${snapshot.data!["name"]} 님",
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: StringUtils.pretendard,
                                          letterSpacing: -0.4,
                                          color: Color(0xff555555),
                                        )
                                    ),
                                  ],
                                );
                            }
                          },
                        ),
                      ),
                      if (!widget.isAdmin) DropdownMenuItem(
                        onTap: () async {
                          Get.to(LpMyPage(user: User.fromMyInfoJson(await getMyInfo())));
                        },
                        value: "MyPage",
                        child: TextButton(
                          onPressed: () async {
                            Get.to(LpMyPage(user: User.fromMyInfoJson(await getMyInfo())));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("마이페이지",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    letterSpacing: -0.3,
                                    color: Color(0xff0361F9)
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: const Icon(Remix.user_line, color: Color(0xff0361f9),),
                              )
                            ],
                          )
                        ),
                      ),
                      DropdownMenuItem(
                        onTap: () async {
                          // todo logout
                          Get.to(const HomeScreen());
                        },
                        value: "LogOut",
                        child: TextButton(
                          onPressed: () async {
                            // todo logout
                            Get.to(const HomeScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("로그아웃",
                                style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    letterSpacing: -0.3,
                                    color: Color(0xff0361F9)
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: const Icon(Remix.logout_box_line, color: Color(0xff0361f9),),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FutureBuilder(
                          future: getMyInfo(),
                          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return Align(
                                alignment: Alignment.centerRight,
                                child: Text(snapshot.data!['name'],
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                    letterSpacing: -0.16,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: StringUtils.pretendard,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        // Container(
                        //     margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        //     // child: const Icon(Icons.arrow_drop_down, color: Color(0xff000000)),
                        //     child: Transform(
                        //         transform: Matrix4.diagonal3Values(1.5, 1.0, 1.0),
                        //         child: const Text("▾",
                        //           style: TextStyle(color: Colors.black, fontSize: 20),
                        //         )
                        //     )
                        // ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(NotificationScreen(isAdmin: widget.isAdmin));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(37, 0, 80, 0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Badge(
                      backgroundColor: Colors.transparent,
                      offset: Offset(9, -9),
                      label: Icon(Icons.circle, color: Color(0xff0361f9), size: 6), // todo 알림 없으면 null
                      child: Icon(Remix.notification_2_line, size: 24, color: Color(0xff333333),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(widget.isAdmin),
      body: RepaintBoundary(
        // child: WidgetUtils().wrapAsDualScrollWidget(
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         padding: const EdgeInsets.fromLTRB(320, 67, 321, 24),
        //         child: breadCrumbRow(widget.crumbs),
        //       ),
        //       widget.main,
        //       const SizedBox(height: 100,),
        //       WidgetUtils.fnb
        //     ]
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(320, 67, 321, 24),
                  child: breadCrumbRow(widget.crumbs),
                ),
                widget.main,
                const SizedBox(height: 100,),
                WidgetUtils.fnb
              ]
          ),
        )
      )
    );
  }

}