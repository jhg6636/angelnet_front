import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/widgets/core/business_card_and_signature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

const SERVER_IP = 'localhost:8080';
const secureStorage = FlutterSecureStorage();

void main() async {
  await initializeDateFormatting();
  runApp(const ReofficeApp());
}

class ReofficeApp extends StatelessWidget {
  const ReofficeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   home: BusinessCardAndSignatureWidget()
    // );
    return GetMaterialApp(
      title: 'RE:OFFICE',
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        primaryColor: Colors.black38,
        primarySwatch: Colors.grey,
      )
    );
  }
}
