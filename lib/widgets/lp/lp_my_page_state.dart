import 'package:backoffice_front/screens/lp/lp_mypage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LpMyPageState extends State<LpMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [],
              )
            )
          ],
        ),
      )

    );
  }

}