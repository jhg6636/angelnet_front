import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/edit_fund_widget.dart';
import 'package:flutter/material.dart';

import '../../models/fund/fund_status.dart';

class MakeFundScreen extends StatefulWidget {

  const MakeFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => MakeFundScreenState();
}

// todo 이런거 길어지면 1-2-3-4단계로 바꿀까? (토스처럼)
class MakeFundScreenState extends State<MakeFundScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("신규 조합 생성", style: WidgetUtils.titleStyle,),
            Container(
              // Container(
              margin: const EdgeInsets.fromLTRB(0, 33, 0, 0),
              child: const FundFormWidget(fund: null, status: FundStatus.reviewing),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", "신규 조합 생성"]
    );
  }
}
