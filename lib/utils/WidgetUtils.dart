import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetUtils {

  static const errorPadding = Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("무엇인가 잘못됨"),
  );

  final appBar = AppBar(
    title: const Text("RE:OFFICE", style: TextStyle(fontSize: 36.0, fontFamily: 'Sriracha'),),
    centerTitle: true,
  );

  static const h1 = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500);

  static const smallPadding = EdgeInsets.all(32.0);

  static const drawerWidth = 300.0;

  static const drawerButtonStyle = TextStyle(fontSize: 24.0);

  static const titleStyle = TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold);

}