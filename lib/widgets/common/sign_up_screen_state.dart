import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/screens/admin/make_user_form.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../screens/common/signup_screen.dart';
import 'package:http/http.dart' as http;

import '../../utils/StringUtils.dart';

class SignUpScreenState extends State<SignUpScreen> {
  // TODO: 주소, 근무처, 명함첨부

  final _nameController = TextEditingController();
  final _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _recommenderController = TextEditingController();
  final _workspaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().appBar,
      body: const SafeArea(
        child: Padding(
          padding: WidgetUtils.smallPadding,
          child: MakeUserForm(isPopup: false,)
        )

      ),
    );
  }

}
