
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';

const version = '1.1';
const serverAddress = 'api.angelnet.co.kr';
// const serverAddress = 'localhost:8081';
const secureStorage = FlutterSecureStorage();
var storage = {};

void main() async {
  await initializeDateFormatting();
  runApp(const AngelnetApp());
}

class AngelnetApp extends StatelessWidget {
  const AngelnetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Ver. $version");
    // return GetMaterialApp(
    //   home: Scaffold(
    //     body: PostEditScreen()
    //   ),
    //   theme: ThemeData(
    //     fontFamily: 'Pretendard',
    //   ),
    // );
    // return GetMaterialApp(
    //   home: EditUserInfoScreen(
    //     user: User(
    //       stringId: "ABC12345",
    //       name: "김철수",
    //       userLevel: "LP",
    //       workplace: "",
    //       phone: "01012345678",
    //       email: "ABC12345@naver.com",
    //       recommender: "",
    //       createdAt: DateTime.now(),
    //       lastLoginAt: DateTime.now()
    //     )
    //   ),
    // );
    return GetMaterialApp(
      title: '엔젤넷',
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: StringUtils.pretendard,
      )
    );
  }
}
