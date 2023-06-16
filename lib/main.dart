import 'package:backoffice_front/screens/common/find_id_pw_select_screen.dart';
import 'package:backoffice_front/screens/common/find_id_screen.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/widgets/admin/editor.dart';
import 'package:backoffice_front/widgets/core/business_card_and_signature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

const serverIp = '127.0.0.1:8080';
const secureStorage = FlutterSecureStorage();

void main() async {
  await initializeDateFormatting();
  runApp(const AngelnetApp());
}

class AngelnetApp extends StatelessWidget {
  const AngelnetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   home: FindIdPwSelectScreen()
    // );
    return GetMaterialApp(
      title: '엔젤넷',
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        primaryColor: Colors.black38,
        primarySwatch: Colors.grey,
      )
    );
  }
}
