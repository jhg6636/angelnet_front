import 'package:angelnet/screens/lp/all_portfolio_screen.dart';
import 'package:angelnet/screens/lp/funding_fund_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/post/manage_post_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/admin_left_side_drawer.dart';
import 'package:angelnet/widgets/core/left_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_popup/info_popup.dart';

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
      appBar: (widget.isAdmin) ?
        WidgetUtils().appBarLegacy
        : AppBar(
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
                        Get.to(ManagePostScreen(isAdmin: false));
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
                  InkWell(
                      onTap: () {
                        // todo 팝업? 드롭다운? 다이얼로그?
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Column(
                        //               children: [
                        //                 Text("username"),
                        //                 Text("email")
                        //               ],
                        //             ),
                        //             OutlinedButton(
                        //                 onPressed: () {
                        //                   Get.to(const HomeScreen());
                        //                 },
                        //                 child: const Text("로그아웃")
                        //             )
                        //           ],
                        //         ),
                        //         FilledButton(
                        //           onPressed: () {
                        //             Get.to(const LpMyPage());
                        //           },
                        //           child: const Text("마이페이지"),
                        //         )
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                      child: Text("userName")
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                  (33 > 0) ? IconButton(
                      onPressed: () {
                        // todo 팝업
                      },
                      icon: Badge(
                        label: Text(33.toString()),
                        child: const Icon(Icons.notifications),
                      )
                  ) : IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                ],
              )
            ],
          ),
        ),
      drawer: drawer,
      body: widget.main,
    );
  }
}

AppBar newLpAppBar(String userName, int notificationCount, {String email = ""}) => AppBar(
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
                Get.to(const ManagePostScreen(isAdmin: false,));
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
          InkWell(
            onTap: () {

            }, 
            child: Text(userName)
          ),
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
