import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';

class ManageGroupScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ManageGroupScreenState();

}

class ManageGroupScreenState extends State<ManageGroupScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0,),
            const Text(
              "그룹 관리",
              style: WidgetUtils.titleStyle,
            ),
            const SizedBox(height: 12.0,),

          ],
        ),
        isAdmin: true
    );
  }

}