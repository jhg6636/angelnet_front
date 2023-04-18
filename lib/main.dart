import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/screens/startup/startup_screen.dart';
import 'package:backoffice_front/widgets/startup/portfolio_details.dart';
import 'package:backoffice_front/widgets/startup/startup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const ReofficeApp());
}

class ReofficeApp extends StatelessWidget {
  const ReofficeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'RE:OFFICE',
      home: HomeScreen()
    );
    // return GetMaterialApp(
    //     title: 'RE:OFFICE',
    //     home: ScreenFrame(
    //         main: StartupScreen(
    //             startup: Startup(1, "스타트업1", "대표1", [
    //       CorporationRegistration(DateTime.now(), "askldjflkasd")
    //     ], [
    //       ShareholderList(DateTime.now(), "kjlkjlkj"),
    //       ShareholderList(DateTime(2022, 12, 29, 16, 29, 33), "asfddasf")
    //     ], [
    //       NewsLetter("제목4", "내용내용", "asdf", DateTime.now()),
    //       NewsLetter("제목3", "내용내용", "asdf", DateTime(2023, 2, 28, 16, 42, 3)),
    //       NewsLetter("제목2", "내용내용", "asdf", DateTime(2023, 1, 11, 11, 11, 11)),
    //       NewsLetter("제목1", "내용내용", "asdf", DateTime(2022, 12, 29, 16, 29, 33)),
    //     ]))));
  }
}
