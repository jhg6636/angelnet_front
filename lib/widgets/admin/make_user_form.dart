import 'dart:convert';
import 'dart:io';

import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/user/sign_up_welcome_screen.dart';
import 'package:angelnet/widgets/user/sign_up_process_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../screens/user/home_screen.dart';
import '../../screens/user/reset_pw_screen.dart';
import '../../utils/StringUtils.dart';

class MakeUserForm extends StatefulWidget {

  final bool isPopup;
  final bool isEditing;
  final User? user;

  const MakeUserForm({super.key, required this.isPopup, required this.isEditing, required this.user});

  @override
  State<StatefulWidget> createState() => MakeUserFormState();

}

class MakeUserFormState extends State<MakeUserForm> {

  // TODO: 주소, 근무처, 명함첨부

  var _nameController = TextEditingController();
  var _stringIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  var _recommenderController = TextEditingController();
  var _workspaceController = TextEditingController();

  final _userLevelList = ['LP', 'STARTUP', 'ADMIN'];
  String _userLevel = 'LP';
  bool notDuplicated = false;

  @override
  Widget build(BuildContext context) {
    _stringIdController = TextEditingController(text: widget.user?.stringId);
    _nameController = TextEditingController(text: widget.user?.name);
    _phoneController = TextEditingController(text: widget.user?.phone);
    _emailController = TextEditingController(text: widget.user?.email);
    _recommenderController = TextEditingController(text: widget.user?.recommender);
    _workspaceController = TextEditingController(text: widget.user?.workplace);
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (widget.isEditing) ? const Text("회원정보") : const Text("회원가입"),
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
            if (!widget.isEditing) signUpProcessWidget(2),
            const SizedBox(height: 24.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, size: 12.0,), Text("  기본정보")
                  ],
                ), Text("* 표시 항목은 필수 입력사항입니다.")
              ],
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 아이디"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: _stringIdController,
                            decoration: InputDecoration(
                              enabled: !widget.isEditing,
                              border: const OutlineInputBorder()
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp("[a-z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]"))
                            ],
                          ),
                        ),
                        FilledButton(
                          onPressed: () async {
                            notDuplicated = await checkStringId(_stringIdController.text);
                            if (notDuplicated) {
                              Fluttertoast.showToast(msg: "사용 가능한 아이디입니다!");
                            } else {
                              Fluttertoast.showToast(msg: "중복 아이디입니다. 다른 아이디를 입력해 주세요.");
                            }
                          },
                          child: const Text("중복 확인"),
                        )
                      ],
                    ),
                    const Text(
                      "2~20자리 이하 영문 소문자, 숫자, 한글 조합",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 비밀번호"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.isEditing) ?
                      FilledButton(
                        onPressed: () {
                          Get.to(const ResetPwScreen());
                        },
                        child: const Text("비밀번호 재설정")
                      )
                    : SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              enabled: !widget.isEditing,
                              border: const OutlineInputBorder()
                          ),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                          ],
                        ),
                      ),
                    const Text(
                      "4~20자의 영문 (대소문자 구분), 숫자, 특수문자(!@#\$%^&*()_+=?/) 조합",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
            if (!widget.isEditing) const SizedBox(height: 12.0),
            if (!widget.isEditing) Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 비밀번호 재확인"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _passwordCheckController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        obscureText: true,
                        autocorrect: false,
                        enableSuggestions: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 이름"),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 이메일"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // todo 주소 입력
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("* 연락처"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder()
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const Text(
                      "대쉬(-) 없이 숫자만 입력하세요.",
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24.0),
            const Row(
              children: [
                Icon(Icons.circle, size: 12.0,), Text("  추가정보 입력")
              ],
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("추천인"),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _recommenderController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 180,
                  child: Text("근무처"),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _workspaceController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
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
                  child: widget.isEditing ? const Text("수정하기") : const Text("다음단계"),
                  onPressed: () async {
                    String? validityString = checkValidity();
                    print(validityString);
                    Get.to(SignUpWelcomeScreen(userName: _nameController.text));
                    // if (validityString == null) {
                    //   // try {
                    //   //   var response = await signInApi(
                    //   //     _stringIdController.text,
                    //   //     _passwordController.text,
                    //   //     _nameController.text,
                    //   //     _phoneController.text,
                    //   //     _emailController.text,
                    //   //     _recommenderController.text,
                    //   //   );
                    //   //   if (response.statusCode != 200) {
                    //   //     print(jsonDecode(utf8.decode(response.bodyBytes)));
                    //   //   } else {
                    //   //     if (widget.isEditing) {
                    //   //       Fluttertoast.showToast(msg: "회원 정보 수정이 완료되었습니다.");
                    //   //       Get.back();
                    //   //     }
                    //   //     else if (!widget.isPopup) {
                    //   //       Fluttertoast.showToast(msg: "회원가입이 완료되었습니다.");
                    //   //       Get.to(SignUpWelcomeScreen(userName: _nameController.text));
                    //   //       Get.deleteAll();
                    //   //     } else {
                    //   //       Navigator.pop(context);
                    //   //     }
                    //   //   }
                    //   // } catch (e) {
                    //   //   print("Error: $e");
                    //   // }
                    // } else {
                    //   showDialog(context: context, builder: (context) {
                    //     return AlertDialog(
                    //       title: Text(validityString),
                    //       actions: [
                    //         TextButton(onPressed: () {
                    //           Navigator.of(context).pop();
                    //         }, child: const Text("OK"))
                    //       ],
                    //     );
                    //   });
                    // }
                  },
                ),
              ],
            ),

          ],
        )
    );
  }

  String? checkValidity() {
    // if (!isValidStringId()) {
    if (!(widget.isEditing || StringUtils().isValidStringId(_stringIdController.text))) {
      return "ID를 확인해 주세요";
    }
    if (!StringUtils().isValidPassword(_passwordController.text)) {
      return "PW를 확인해 주세요";
    }
    if (!StringUtils().checkSamePassword(_passwordController.text, _passwordCheckController.text)) {
      return "비밀번호가 다릅니다.";
    }
    if (!StringUtils().isValidName(_nameController.text)) {
      return "이름을 확인해 주세요";
    }
    if (!StringUtils().isValidPhone(_phoneController.text)) {
      return "전화번호를 확인해 주세요";
    }
    if (!StringUtils().isValidEmail(_emailController.text)) {
      return "이메일을 확인해 주세요";
    }
    if (!StringUtils().isValidRecommender(_recommenderController.text)) {
      return "추천인을 확인해 주세요";
    }

    return null;
  }

}