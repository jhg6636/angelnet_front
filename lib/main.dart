import 'dart:typed_data';

import 'package:angelnet/models/file/file.dart';
import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

const version = '1.2';
// const serverAddress = 'api.angelnet.co.kr';
const serverAddress = 'localhost:8081';
const secureStorage = FlutterSecureStorage();
var storage = {};

void main() async {
  await initializeDateFormatting();
  upload(
      Uint8List.fromList('hello'.codeUnits),
      const File(
          id: -1,
          name: 'hello.txt',
          targetId: 1,
          targetType: FileTarget.fundDocument));
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
        ));
  }
}
