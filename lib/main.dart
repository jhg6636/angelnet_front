
import 'package:angelnet/screens/lp/joined_fund_screen.dart';
import 'package:angelnet/screens/lp/lp_mypage.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/screens/user/find_id_pw_select_screen.dart';
import 'package:angelnet/screens/user/find_id_screen.dart';
import 'package:angelnet/screens/user/find_pw_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/screens/user/sign_up_welcome_screen.dart';
import 'package:angelnet/screens/user/signup_screen.dart';
import 'package:angelnet/screens/user/terms_of_use_screen.dart';
import 'package:angelnet/utils/NotificationUtils.dart';
import 'package:angelnet/widgets/core/breadcrumb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

// const serverAddress = 'localhost:8080';
const serverAddress = '172.18.0.43:8080';
const secureStorage = FlutterSecureStorage();
var storage = {};

void main() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // String? firebaseToken = await fcmSetting();
  // print(firebaseToken);
  runApp(const AngelnetApp());
}

class AngelnetApp extends StatelessWidget {
  const AngelnetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   home: Scaffold(
    //     body: ScreenFrameV2(main: Text("hello"), isAdmin: false, crumbs: ["1차 메뉴"],),
    //   ),
    //   theme: ThemeData(
    //     fontFamily: 'Pretendard',
    //   ),
    // );
    return const GetMaterialApp(
      home: JoinedFundScreen(),
    );
    // return GetMaterialApp(
    //   title: '엔젤넷',
    //   home: const HomeScreen(),
    //   theme: ThemeData(
    //     fontFamily: 'Pretendard',
    //   )
    // );
  }
}
