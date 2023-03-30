import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/startup/startup.dart';

class StartupScreen extends StatelessWidget {

  final Startup startup;

  const StartupScreen({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black45,
            foregroundColor: Colors.white70,
            title: Text(startup.name),
            bottom: const TabBar(
              tabs: [
                Tab(text: "기본 정보"),
                Tab(text: "법인등기부등본"),
                Tab(text: "주주명부"),
                Tab(text: "후속투자정보"),
                Tab(text: "재무제표"),
                Tab(text: "보도자료 및 뉴스레터"),
              ],
              indicatorColor: Colors.white70,
              indicatorSize: TabBarIndicatorSize.tab,
            )
          ),
          body: const TabBarView(
            children: [
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
              Text("6")
            ],
          )
        )
    );
  }

}