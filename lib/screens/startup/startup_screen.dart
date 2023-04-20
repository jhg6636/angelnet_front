import 'package:backoffice_front/widgets/startup/startup_basic_info.dart';
import 'package:backoffice_front/widgets/startup/startup_calendar.dart';
import 'package:flutter/material.dart';

import '../../widgets/startup/startup.dart';
import '../../widgets/startup/startup_documents.dart';

class StartupScreen extends StatelessWidget {
  final Startup startup;

  const StartupScreen({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white70,
                title: Text(startup.name),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "기본 정보"),
                    Tab(text: "주요 일정"),
                    Tab(text: "법인등기부등본"),
                    Tab(text: "주주명부"),
                    Tab(text: "후속투자정보"),
                    Tab(text: "재무제표"),
                    Tab(text: "보도자료 및 뉴스레터"),
                  ],
                  indicatorColor: Colors.white70,
                  indicatorSize: TabBarIndicatorSize.tab,
                )),
            body: TabBarView(
              children: [
                StartupBasicInfo(startup: startup),
                const StartupCalendar(),
                StartupDocuments(documents: startup.corporationRegistrations),
                StartupDocuments(documents: startup.shareholderLists),
                const Text("5"),
                const Text("6"),
                StartupDocuments(documents: startup.newsLetters)
              ],
            )
        )
    );
  }
}
