import 'dart:typed_data';

import 'package:angelnet/models/file/file.dart';
import 'package:angelnet/models/file/file_target.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

const version = '1.7.1';
// const serverAddress = 'dev.angelnet.co.kr';
const serverAddress = 'localhost:8081';
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
    return GetMaterialApp(
      title: '엔젤넷',
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: StringUtils.pretendard,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
      ],
    );
  }
}
