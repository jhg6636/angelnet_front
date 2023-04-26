import 'dart:convert';
import 'dart:io';

import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/StringUtils.dart';
import '../../screens/common/home_screen.dart';

// todo 팝업일 때 회원 레벨 설정 및 스타트업일 경우 스타트업까지 같이 생성하기

class MakeUserForm extends StatefulWidget {

  final bool isPopup;
  final bool isEditing;
  final String? stringId;

  const MakeUserForm({super.key, required this.isPopup, required this.isEditing, required this.stringId});

  @override
  State<StatefulWidget> createState() => MakeUserFormState();

}

class MakeUserFormState extends State<MakeUserForm> {

  // TODO: 주소, 근무처, 명함첨부

  final _nameController = TextEditingController();
  var _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _recommenderController = TextEditingController();
  final _workspaceController = TextEditingController();

  final _userLevelList = ['LP', 'STARTUP', 'ADMIN'];
  String _userLevel = 'LP';

  @override
  Widget build(BuildContext context) {
    _stringIdController = TextEditingController(text: widget.stringId);
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.isPopup) Wrap(
              children: [
                const SizedBox(width: 12.0,),
                const Padding(padding: EdgeInsets.fromLTRB(0, 12, 12, 0), child: Text("권한")),
                DropdownButton<String>(
                  value: _userLevel,
                  items: _userLevelList.map<DropdownMenuItem<String>>(
                          (value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }
                  ).toList(),
                  onChanged: (Object? value) {
                    setState(() {
                      _userLevel = value as String;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 24.0),
            TextField(
              keyboardType: TextInputType.text,
              controller: _stringIdController,
              decoration: InputDecoration(
                labelText: '아이디',
                enabled: !widget.isEditing,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z0-9]"))
              ],
            ),
            const Text(
              "4~20자의 영문 소문자, 숫자로만 구성할 수 있습니다.",
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
              ],
            ),
            const Text(
              "4~20자의 영문 소문자, 숫자, 특수문자(!@#\$%^&*()_+=?/)로만 구성할 수 있습니다",
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordCheckController,
              decoration: const InputDecoration(
                labelText: '비밀번호 확인',
              ),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
              ],
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '이름',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[ㄱ-ㅎ가-힇ㆍᆢ]"))
              ],
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _phoneController,
              decoration:
              const InputDecoration(labelText: '전화번호'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const Text(
              "대쉬(-) 없이 숫자만 입력하세요.",
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '이메일'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z0-9@.-_=+!@#\$%^&*()/,?]"))
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _recommenderController,
              decoration: const InputDecoration(labelText: '추천인'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[ㄱ-ㅎ가-힇ㆍᆢ]"))
              ],
            ),
            const SizedBox(
                height: 12.0
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('취소'),
                  onPressed: () {
                    if (!widget.isPopup) {
                      Get.back();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
                FilledButton(
                  child: widget.isEditing ? const Text("수정하기") : const Text("회원가입"),
                  onPressed: () async {
                    String? validityString = checkValidity();
                    print(validityString);
                    if (validityString == null) {
                      try {
                        var response = await signInApi();
                        if (response.statusCode != 200) {
                          print(jsonDecode(utf8.decode(response.bodyBytes)));
                        } else {
                          if (widget.isEditing) {
                            Get.back();
                          }
                          else if (!widget.isPopup) {
                            Get.to(const HomeScreen());
                            Get.deleteAll();
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      } catch (e) {
                        print("Error: $e");
                      }
                    } else {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text(validityString),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: const Text("OK"))
                          ],
                        );
                      });
                    }
                  },
                ),
              ],
            ),

          ],
        )
    );
  }

  String? checkValidity() {
    if (!isValidStringId()) {
      return "ID를 확인해 주세요";
    }
    if (!isValidPassword()) {
      return "PW를 확인해 주세요";
    }
    if (!checkSamePassword()) {
      return "비밀번호가 다릅니다.";
    }
    if (!isValidName()) {
      return "이름을 확인해 주세요";
    }
    if (!isValidPhone()) {
      return "전화번호를 확인해 주세요";
    }
    if (!isValidEmail()) {
      return "이메일을 확인해 주세요";
    }
    if (!isValidRecommender()) {
      return "추천인을 확인해 주세요";
    }

    return null;
  }

  bool isValidStringId() {
    if (widget.isEditing) return true;
    String stringId = _stringIdController.text;
    if (RegExp("^[a-z0-9]{4,20}\$").hasMatch(stringId)) {
      return true;
    }
    return false;
  }

  bool isValidPassword() {
    String password = _passwordController.text;
    if (RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[./,!@#\$%^&()+=-])[a-zA-Z0-9./,!@#\$%^&*()+=-]{4,20}\$").hasMatch(password)) {
      return true;
    }
    return false;
  }

  bool checkSamePassword() {
    String password = _passwordController.text;
    String checkPassword = _passwordCheckController.text;

    if (password == checkPassword) {
      return true;
    }

    return false;
  }

  bool isValidName() {
    String name = _nameController.text;
    if (RegExp("^[가-힇]{2,}\$").hasMatch(name)) {
      return true;
    }
    return false;
  }

  bool isValidPhone() {
    String phone = _phoneController.text;
    if (RegExp("^[0-9]{10,11}\$").hasMatch(phone)) {
      return true;
    }
    return false;
  }

  bool isValidEmail() {
    String email = _emailController.text;
    if (RegExp("^[a-zA-Z0-9./,!#\$%^&*()+=-]{1,}@[a-zA-Z0-9./,!#\$%^&*()+=-]{1,}.[a-zA-Z0-9./,!@#\$%^&*()+=-]{1,}\$").hasMatch(email)) {
      return true;
    }
    return false;
  }

  bool isValidRecommender() {
    String recommender = _recommenderController.text;
    if (recommender == "") {
      return true;
    }
    if (RegExp("^[가-힇]{2,}\$").hasMatch(recommender)) {
      return true;
    }

    return false;
  }

  Future<http.Response> signInApi() async {
    String? recommenderText = (_recommenderController.text == "") ? null : _recommenderController.text;

    final Map<String, dynamic> request = {
      "stringId": _stringIdController.text,
      "password": _passwordController.text,
      "name": _nameController.text,
      "phone": _phoneController.text,
      "email": _emailController.text,
      "recommender": recommenderText,
    };
    var headers = {HttpHeaders.contentTypeHeader: "application/json"};

    var uri = StringUtils().stringToUri('sign-in');
    var response = await http.post(uri, headers: headers, body: jsonEncode(request));
    print(response.statusCode);
    return response;
  }

}