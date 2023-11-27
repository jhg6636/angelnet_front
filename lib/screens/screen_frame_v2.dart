import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/admin/manage_fund_screen.dart';
import 'package:angelnet/screens/admin/manage_group_screen.dart';
import 'package:angelnet/screens/admin/manage_user_screen.dart';
import 'package:angelnet/screens/lp/all_portfolio_screen.dart';
import 'package:angelnet/screens/lp/funding_fund_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/notification/notification_screen.dart';
import 'package:angelnet/screens/post/manage_post_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WidgetUtils().appBar(widget.isAdmin),
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