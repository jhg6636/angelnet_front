import 'package:backoffice_front/models/bulletin/bulletin.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BulletinDetailScreen extends StatefulWidget {

  const BulletinDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => BulletinDetailScreenState();

}

class BulletinDetailScreenState extends State<BulletinDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
      isAdmin: true
    );
  }

}