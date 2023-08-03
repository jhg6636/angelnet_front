import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/make_user_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().appBar,
      body: const SafeArea(
          child: Padding(
              padding: WidgetUtils.smallPadding,
              child: MakeUserForm(isPopup: false, isEditing: false, user: null,)
          )

      ),
    );
  }

}