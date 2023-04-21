import 'package:backoffice_front/widgets/admin/admin_left_side_drawer.dart';
import 'package:backoffice_front/widgets/core/left_side_drawer.dart';
import 'package:flutter/material.dart';

class ScreenFrame extends StatefulWidget {
  final Widget main;
  final bool isAdmin;

  const ScreenFrame({super.key, required this.main, required this.isAdmin});

  @override
  State<StatefulWidget> createState() => ScreenFrameState();
}

class ScreenFrameState extends State<ScreenFrame> {
  @override
  Widget build(BuildContext context) {
    Widget drawer = widget.isAdmin ? AdminLeftSideDrawer() : const LeftSideDrawer();
    return Scaffold(
      appBar: AppBar(
        title: const Text("RE:OFFICE"),
        centerTitle: true,
      ),
      drawer: drawer,
      body: widget.main,
    );
  }
}
