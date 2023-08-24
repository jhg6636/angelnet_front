import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:printing/printing.dart';
import 'package:remixicon/remixicon.dart';
import 'package:share_plus/share_plus.dart';

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
    var crumbItems = [];
    for (int i=0; i<crumbs.length-1; i++) {

    }
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

  AppBar lpAppBar() => AppBar(
    toolbarHeight: 201,
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shadowColor: Colors.transparent,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
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
                Container(
                    height: 23,
                    margin: const EdgeInsets.fromLTRB(58, 0, 0, 0),
                    child: const Text("결성중인 조합",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                Container(
                    height: 23,
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: const Text("게시판",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                Container(
                    height: 23,
                    margin: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: const Text("전체 포트폴리오",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // todo 이거로 변경
                // FutureBuilder(
                //   future: getMyInfo(),
                //   builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                //     if (snapshot.hasData && !snapshot.hasError) {
                //       return snapshot.data!['name'];
                //     }
                //   },
                // )
                Container(
                    height: 23,
                    margin: const EdgeInsets.fromLTRB(58, 0, 0, 0),
                    child: const Text("플랜아이",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  // child: const Icon(Icons.arrow_drop_down, color: Color(0xff000000)),
                  child: Transform(
                    transform: Matrix4.diagonal3Values(1.5, 1.0, 1.0),
                    child: const Text("▾",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(37, 0, 80, 0),
                  child: const Badge(
                    backgroundColor: Colors.transparent,
                    offset: Offset(9, -9),
                    label: Icon(Icons.circle, color: Color(0xff0361f9), size: 6), // todo 알림 없으면 null
                    child: Icon(Remix.notification_2_line, size: 24, color: Color(0xff333333),),
                  ),
                )

              ],
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Container(
          padding: const EdgeInsets.fromLTRB(320, 67, 321, 0),
          child: breadCrumbRow(widget.crumbs),
        )
      ],
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (!widget.isAdmin) ? lpAppBar() : AppBar(title: const Text("angelnet"),),
      body: RepaintBoundary(
        child: Column(
          children: [
            Center(child: widget.main),
            WidgetUtils.fnb
          ]
        )
      )
    );
  }

}