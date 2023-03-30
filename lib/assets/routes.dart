import 'package:backoffice_front/screens/common/signup_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/admin/admin_screen.dart';
import '../screens/common/home_screen.dart';
import '../screens/lp/lp_mypage.dart';
import '../screens/common/mypage_screen.dart';
import '../screens/common/reset_password_screen.dart';
import '../screens/startup/startup_screen.dart';

class Routes {
  static const String home = "/";
  static const String signUp = "/sign-up";
  static const String myPage = "/my-page";
  static const String lp = "/lp";
  static const String startup = "/startup";
  static const String admin = "/admin";
  static const String resetPassword = "/reset-password";

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    myPage: (BuildContext context) => MyPageScreen(),
    lp: (BuildContext context) => LpMyPage(),
    // startup: (BuildContext context) => const StartupScreen(startup: Startup,),
    admin: (BuildContext context) => AdminScreen(),
    resetPassword: (BuildContext context) => ResetPasswordScreen(),
  };
}