import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';

class AdminLpDetailScreen extends StatefulWidget {

  const AdminLpDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => AdminLpDetailScreenState();

}

class AdminLpDetailScreenState extends State<AdminLpDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("조합원 관리", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              padding: const EdgeInsets.fromLTRB(50, 20, 31, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                  )
                ],
              ),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", "조합원 관리"]
    )
  }

}