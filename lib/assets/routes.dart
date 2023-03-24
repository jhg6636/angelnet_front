import 'package:backoffice_front/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/admin_screen.dart';
import '../screens/home_screen.dart';
import '../screens/lp_screen.dart';
import '../screens/mypage_screen.dart';
import '../screens/startup_screen.dart';

class Routes {
  static const String home = "/";
  static const String signUp = "/sign-up";
  static const String myPage = "/my-page";
  static const String lp = "/lp";
  static const String startup = "/startup";
  static const String admin = "/admin";

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    signUp: (BuildContext context) => SignupScreen(),
    myPage: (BuildContext context) => MyPageScreen(),
    lp: (BuildContext context) => LpScreen(),
    startup: (BuildContext context) => const StartupScreen(),
    admin: (BuildContext context) => AdminScreen(),
  };
}