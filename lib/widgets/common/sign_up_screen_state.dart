import 'dart:convert';
import 'dart:io';

import 'package:angelnet/widgets/admin/make_user_form.dart';
import 'package:angelnet/screens/common/home_screen.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../screens/common/signup_screen.dart';
import 'package:http/http.dart' as http;

import '../../utils/StringUtils.dart';

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
