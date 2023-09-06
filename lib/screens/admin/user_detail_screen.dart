import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {

  const UserDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => UserDetailScreenState();

}

class UserDetailScreenState extends State<UserDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("회원정보수정", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: const Text("기본정보", style: WidgetUtils.h1Style,),
            ),
            const Divider(thickness: 2, color: Color(0xff555555),),

          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["회원관리", "회원정보수정"]
    );
  }

}