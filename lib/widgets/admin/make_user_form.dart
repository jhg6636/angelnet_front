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
  var _emailFrontController = TextEditingController();
  var _emailBackController = TextEditingController();
  var _recommenderController = TextEditingController();
  var _workspaceController = TextEditingController();
  var _zipCodeController = TextEditingController();
  var _addressMainController = TextEditingController();
  var _addressDetailController = TextEditingController();

  final _userLevelList = ['LP', 'STARTUP', 'ADMIN'];
  String _userLevel = 'LP';
  bool notDuplicated = false;

  @override
  Widget build(BuildContext context) {
    _stringIdController = TextEditingController(text: widget.user?.stringId);
    _nameController = TextEditingController(text: widget.user?.name);
    _phoneController = TextEditingController(text: widget.user?.phone);
    _emailFrontController = TextEditingController(text: widget.user?.email.split("@")[0]);
    _emailBackController = TextEditingController(text: widget.user?.email.split("@")[1]);
    _recommenderController = TextEditingController(text: widget.user?.recommender);
    _workspaceController = TextEditingController(text: widget.user?.workplace);
    return Container(
        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (widget.isEditing) ?
              const Text("회원정보") :
              const Text("회원가입",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pretendard",
                  color: Color(0xff111111)
                ),
              ),
            // if (widget.isPopup) Wrap(
            //   children: [
            //     const SizedBox(width: 12.0,),
            //     const Padding(padding: EdgeInsets.fromLTRB(0, 12, 12, 0), child: Text("권한")),
            //     DropdownButton<String>(
            //       value: _userLevel,
            //       items: _userLevelList.map<DropdownMenuItem<String>>(
            //               (value) {
            //             return DropdownMenuItem<String>(value: value, child: Text(value));
            //           }
            //       ).toList(),
            //       onChanged: (Object? value) {
            //         setState(() {
            //           _userLevel = value as String;
            //         });
            //       },
            //     )
            //   ],
            // ),
            if (!widget.isEditing) signUpProcessWidget(2),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("기본정보",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                      letterSpacing: -0.2
                    ),
                  ),
                  Text("* 표시 항목은 필수 입력사항입니다.",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff555555),
                      letterSpacing: -0.15
                    ),
                  )
                ],
              )
            ),
            const Divider(thickness: 2, color: Color(0xff555555),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                  child: const Text("아이디",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333),
                        letterSpacing: -0.17
                    ),
                  )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 263,
                            height: 38,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              keyboardType: TextInputType.text,
                              controller: _stringIdController,
                              decoration: InputDecoration(
                                  hintText: "아이디를 입력하세요",
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff999999),
                                    fontFamily: "Pretendard",
                                    letterSpacing: -0.15
                                  ),
                                  enabled: !widget.isEditing,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                    borderSide: BorderSide(color: Color(0xffdddddd))
                                  )
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[a-z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]"))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                fixedSize: Size(90, 38),
                                backgroundColor: const Color(0xff6c6f81),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(2.0))
                                )
                              ),
                              onPressed: () async {
                                notDuplicated = await checkStringId(_stringIdController.text);
                                if (notDuplicated) {
                                  Fluttertoast.showToast(msg: "사용 가능한 아이디입니다!");
                                } else {
                                  Fluttertoast.showToast(msg: "중복 아이디입니다. 다른 아이디를 입력해 주세요.");
                                }
                              },
                              child: const Text("중복확인",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: StringUtils.pretendard,
                                  color: Colors.white,
                                  letterSpacing: -0.32
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const Text(
                          "* 2~20자리 이하 한글, 영문 소문자, 숫자 조합",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300,
                              color: Color(0xff555555),
                              letterSpacing: -0.15
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("비밀번호",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 263,
                        height: 38,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              hintText: "비밀번호를 입력하세요",
                              hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff999999),
                                  fontFamily: "Pretendard",
                                  letterSpacing: -0.15
                              ),
                              enabled: !widget.isEditing,
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  borderSide: BorderSide(color: Color(0xffdddddd))
                              )
                          ),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                            inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: const Text(
                          "4~20자의 영문 (대소문자 구분), 숫자, 특수문자(!@#\$%^&*()_+=?/) 조합",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300,
                              color: Color(0xff555555),
                              letterSpacing: -0.15
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("비밀번호 재확인",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: SizedBox(
                    width: 263,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _passwordCheckController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9!@#\$%^&*()_+=?/]"))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("이름",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
                  child: SizedBox(
                    width: 263,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("이메일",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: SizedBox(
                    width: 164,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _emailFrontController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                  child: const Text("@",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff767676)
                    )
                  ),
                ),
                SizedBox(
                  width: 164,
                  height: 38,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    keyboardType: TextInputType.text,
                    controller: _emailBackController,
                    decoration: InputDecoration(
                        enabled: !widget.isEditing,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                            borderSide: BorderSide(color: Color(0xffdddddd))
                        )
                    ),
                  ),
                ),
                // todo 드롭다운메뉴
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            // Row(
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            //       child: const Text("*",
            //         style: TextStyle(
            //             fontSize: 15,
            //             fontFamily: StringUtils.pretendard,
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xff4d87ef)
            //         ),
            //       ),
            //     ),
            //     Container(
            //         margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
            //         child: const Text("주소",
            //           style: TextStyle(
            //               fontSize: 17,
            //               fontFamily: StringUtils.pretendard,
            //               fontWeight: FontWeight.w500,
            //               color: Color(0xff333333),
            //               letterSpacing: -0.17
            //           ),
            //         )
            //     ),
                    /**
                     * 주소는 정책상 일단 폐기
                     */
            //     Container(
            //       margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               SizedBox(
            //                 width: 164,
            //                 height: 38,
            //                 child: TextField(
            //                   textAlignVertical: TextAlignVertical.bottom,
            //                   keyboardType: TextInputType.text,
            //                   controller: _zipCodeController,
            //                   decoration: const InputDecoration(
            //                     disabledBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //                       borderSide: BorderSide(color: Color(0xff999999))
            //                     ),
            //                     hintText: "우편번호",
            //                     hintStyle: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w300,
            //                       color: Color(0xff999999),
            //                       fontFamily: "Pretendard",
            //                       letterSpacing: -0.15
            //                     ),
            //                     enabled: false,
            //                     border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //                       borderSide: BorderSide(color: Color(0xffdddddd))
            //                     )
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                 margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
            //                 child: FilledButton(
            //                   style: FilledButton.styleFrom(
            //                       fixedSize: const Size(100, 38),
            //                       backgroundColor: const Color(0xff6c6f81),
            //                       shape: const RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.all(Radius.circular(2.0))
            //                       )
            //                   ),
            //                   onPressed: () async {
            //                     // todo 카카오 도로명검색
            //                   },
            //                   child: const Text("도로명검색",
            //                     style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w500,
            //                       fontFamily: StringUtils.pretendard,
            //                       color: Colors.white,
            //                       letterSpacing: -0.32
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Container(
            //             width: 523,
            //             height: 38,
            //             margin: const EdgeInsets.fromLTRB(0, 9, 0, 9),
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.bottom,
            //               keyboardType: TextInputType.text,
            //               controller: _addressMainController,
            //               decoration: const InputDecoration(
            //                   hintText: "시군구주소",
            //                   hintStyle: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w300,
            //                       color: Color(0xff999999),
            //                       fontFamily: "Pretendard",
            //                       letterSpacing: -0.15
            //                   ),
            //                   enabled: false,
            //                   border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //                       borderSide: BorderSide(color: Color(0xffdddddd))
            //                   ),
            //                   disabledBorder: OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //                       borderSide: BorderSide(color: Color(0xff999999))
            //                   ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 523,
            //             height: 38,
            //             child: TextField(
            //               textAlignVertical: TextAlignVertical.bottom,
            //               keyboardType: TextInputType.text,
            //               controller: _addressDetailController,
            //               decoration: InputDecoration(
            //                   enabled: !widget.isEditing,
            //                   border: const OutlineInputBorder(
            //                       borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //                       borderSide: BorderSide(color: Color(0xffdddddd))
            //                   ),
            //                   hintText: "상세주소",
            //                   hintStyle: const TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w300,
            //                       color: Color(0xff999999),
            //                       fontFamily: "Pretendard",
            //                       letterSpacing: -0.15
            //                   ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     )
            //   ],
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("연락처",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: SizedBox(
                    width: 263,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: const Text("추가정보 입력",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                    letterSpacing: -0.2
                ),
              ),
            ),
            const Divider(thickness: 2, color: Color(0xff555555),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                    child: const Text("추천인",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: SizedBox(
                    width: 263,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _recommenderController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                    child: const Text("근무처",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333),
                          letterSpacing: -0.17
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: SizedBox(
                    width: 263,
                    height: 38,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.text,
                      controller: _workspaceController,
                      decoration: InputDecoration(
                          enabled: !widget.isEditing,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(color: Color(0xffdddddd))
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(120, 50),
                        side: const BorderSide(color: Color(0xff222222), width: 2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("취소",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xff222222),
                              letterSpacing: -0.34
                          )
                      )
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff222222),
                      fixedSize: Size(120, 50),
                      side: const BorderSide(color: Color(0xff222222), width: 2.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
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
                    child: widget.isEditing ?
                      const Text("수정하기",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xffffffff),
                              letterSpacing: -0.34
                          )
                      ) :
                      const Text("다음단계",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xffffffff),
                              letterSpacing: -0.34
                          )
                      ),
                  ),
                ],
              )
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
    if (!StringUtils().isValidEmail(_emailFrontController.text)) {
      return "이메일을 확인해 주세요";
    }
    if (!StringUtils().isValidRecommender(_recommenderController.text)) {
      return "추천인을 확인해 주세요";
    }

    return null;
  }

}