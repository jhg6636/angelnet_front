import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/widgets/admin/make_user_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: InkWell(
          onTap: () { Get.to(const HomeScreen()); },
          child: Container(
            width: 154,
            height: 52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ),
      body: const SingleChildScrollView(
        child: MakeUserForm(isAdmin: false, isEditing: false, user: null,)
      )
    );
  }

}