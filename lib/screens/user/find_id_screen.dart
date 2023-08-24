import 'package:angelnet/screens/user/find_pw_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindIdScreenState();
}

class FindIdScreenState extends State<FindIdScreen> {
  final _nameController = TextEditingController();

  // final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Container(
            width: 154,
            height: 52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    padding: const EdgeInsets.symmetric(horizontal: 320),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("아이디/비밀번호 찾기",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Pretendard",
                                  color: Color(0xff111111))),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Row(
                              children: [
                                Flexible(
                                    child: InkWell(
                                      child: ClipPath(
                                          clipper: CustomBorderClipper(),
                                          child: Container(
                                            width: 640,
                                            height: 62,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                    top: BorderSide(color: Color(0xff1173f9), width: 2),
                                                    left: BorderSide(color: Color(0xff1173f9), width: 2),
                                                    right: BorderSide(color: Color(0xff1173f9), width: 2),
                                                )
                                            ),
                                            child: const Center(
                                              child: Text("아이디 찾기",
                                                style: TextStyle(
                                                  fontFamily: StringUtils.pretendard,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff1173f9),
                                                  letterSpacing: -0.17
                                                ),
                                              ),
                                            )
                                          )
                                      )
                                    )
                                ),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(const FindPwScreen());
                                    },
                                    child: Container(
                                      width: 640,
                                      height: 62,
                                      decoration: const BoxDecoration(
                                        color: Color(0xfff9f9f9),
                                        border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                                      ),
                                      child: const Center(
                                        child: Text("비밀번호 찾기",
                                          style: TextStyle(
                                              fontFamily: StringUtils.pretendard,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff282728),
                                              letterSpacing: -0.17
                                          ),
                                        ),
                                      )
                                    ),
                                  )
                                )
                              ],
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 38, 0, 10),
                            child: const Text("회원가입 시 등록한 정보를 입력 해 주세요.",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                fontFamily: StringUtils.pretendard,
                                letterSpacing: -0.16,
                                color: Color(0xff333333),
                              ),
                            )
                          ),
                          const Divider(thickness: 2, color: Color(0xff2b2b2b),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("이름",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
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
                          ),
                          const Divider(color: Color(0xffdddddd),),
                          Container(
                            margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: const Text("연락처",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                      color: Color(0xff333333),
                                    ),
                                  ),
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
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                              borderSide: BorderSide(color: Color(0xffdddddd))
                                          )
                                      ),
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xffdddddd),),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Color(0xff222222),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                fixedSize: Size(120, 50)
                              ),
                              onPressed: () {

                              },
                              child: Text("아이디 찾기",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: StringUtils.pretendard,
                                  fontSize: 17,
                                  letterSpacing: -0.34
                                ),
                              ),
                            ),
                          )
                        ]
                    )
                )
            )
        )
    );
    // return Scaffold(
    //     body: Align(
    //         alignment: Alignment.center,
    //         child: SingleChildScrollView(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Text("아이디 찾기"),
    //               const SizedBox(height: 120.0,),
    //               Container(
    //                 width: 900,
    //                 height: 450,
    //                 decoration: BoxDecoration(
    //                   border: Border.all()
    //                 ),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         const SizedBox(width: 50,),
    //                         const SizedBox(
    //                           width: 80,
    //                           child: Text("이름"),
    //                         ),
    //                         SizedBox(
    //                           width: 240,
    //                           child: TextField(
    //                             controller: _nameController,
    //                             decoration: const InputDecoration(),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         const SizedBox(width: 50,),
    //                         const SizedBox(
    //                           width: 80,
    //                           child: Text("연락처"),
    //                         ),
    //                         SizedBox(
    //                           width: 240,
    //                           child: TextField(
    //                             controller: _phoneController,
    //                             decoration: const InputDecoration(),
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                     Align(
    //                       alignment: Alignment.centerRight,
    //                       child: FilledButton(
    //                         onPressed: () {
    //                           Get.to(IdInformScreen(name: _nameController.text, id: 'IDIDIDIDID'));
    //                         },
    //                         child: const Text("아이디 찾기"),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //     )
    // );
  }
}

class CustomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..moveTo(0.0, 5.0)
      ..quadraticBezierTo(0.0, 0.0, 5.0, 0.0)
      ..lineTo(size.width - 5.0, 0.0)
      ..quadraticBezierTo(size.width, 0.0, size.width, 5.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}