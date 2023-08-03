import 'package:angelnet/screens/bulletin/bulletin_screen.dart';
import 'package:angelnet/screens/lp/all_portfolio_screen.dart';
import 'package:angelnet/screens/lp/funding_fund_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/admin_left_side_drawer.dart';
import 'package:angelnet/widgets/core/left_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Widget drawer = widget.isAdmin ? const AdminLeftSideDrawer() : const LeftSideDrawer();
    return Scaffold(
      appBar: (widget.isAdmin) ? WidgetUtils().appBar : newLpAppBar("userName", 33),
      drawer: drawer,
      body: widget.main,
    );
  }
}

AppBar newLpAppBar(String userName, int notificationCount) => AppBar(
  centerTitle: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("AngelNet", style: TextStyle(fontSize: 36.0, fontFamily: 'Sriracha'),),
          InkWell(
              onTap: () {
                Get.to(const FundingFundScreen());
              },
              child: const Text("  결성 중인 조합 ")
          ),
          InkWell(
              onTap: () {
                Get.to(const BulletinScreen());
              },
              child: const Text(" 게시판 ")
          ),
          InkWell(
              onTap: () {
                Get.to(const AllPortfolioScreen());
              },
              child: const Text(" 전체 포트폴리오  ")
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(onTap: () {}, child: Text(userName)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
          (notificationCount > 0) ? IconButton(
              onPressed: () {},
              icon: Badge(
                label: Text(notificationCount.toString()),
                child: const Icon(Icons.notifications),
              )
          ) : IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      )
    ],
  ),
);
