import 'package:backoffice_front/widgets/core/left_side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenFrame extends StatefulWidget {
  final Widget main;

  const ScreenFrame({super.key, required this.main});
  @override
  State<StatefulWidget> createState() => ScreenFrameState();

}

class ScreenFrameState extends State<ScreenFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RE:OFFICE"), centerTitle: true,),
      drawer: const LeftSideDrawer(),
      body: widget.main,
    );
  }

}

