import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetUtils {

  static const mobileWidth = 900;

  static const errorPadding = Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("무엇인가 잘못됨"),
  );

  final appBar = AppBar(
    title: const Text("AngelNet", style: TextStyle(fontSize: 36.0, fontFamily: 'Sriracha'),),
    centerTitle: true,
  );

  static const h1 = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500);

  static const smallPadding = EdgeInsets.all(32.0);

  static const drawerWidth = 300.0;

  static const drawerButtonStyle = TextStyle(fontSize: 24.0);

  static const titleStyle = TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold);

  Widget futureBuilderWidget(AsyncSnapshot<dynamic> snapshot, Widget widget) {
    if (snapshot.hasError) {
      return errorPadding;
    } else if (!snapshot.hasData) {
      return const CircularProgressIndicator();
    } else {
      return widget;
    }
  }

  Widget wrapAsDualScrollWidget(Widget widget) {
    final vertical = ScrollController();
    final horizontal = ScrollController();
    return Scrollbar(
        controller: vertical,
        child: SingleChildScrollView(
          controller: vertical,
          child: Scrollbar(
            controller: horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: horizontal,
              child: widget,
            ),
          ),
        )
    );
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileWidth;
  }

}