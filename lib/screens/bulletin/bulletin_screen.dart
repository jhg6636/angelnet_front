import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/post.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class BulletinScreen extends StatelessWidget {

  const BulletinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("게시판", style: WidgetUtils.titleStyle),

          ],
        ),
      ),
      isAdmin: false,
      crumbs: ["게시판"]
    );
  }

}