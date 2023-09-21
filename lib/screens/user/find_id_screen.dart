import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/user/find_pw_screen.dart';
import 'package:angelnet/screens/user/home_screen.dart';
import 'package:angelnet/utils/ColorUtils.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/utils/custom_border_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

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
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
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
                                backgroundColor: const Color(0xff222222),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                fixedSize: const Size(120, 50)
                              ),
                              onPressed: () async {
                                var foundIds = await findIdApi(_nameController.text, _phoneController.text);
                                showDialog(context: context, builder: (context) => foundIdsInformWidget(context, foundIds));
                              },
                              child: const Text("아이디 찾기",
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
  }

  Widget foundIdsInformWidget(BuildContext context, List<dynamic> foundIds) {
    return AlertDialog(
      content: Container(
        width: 660,
        height: 600,
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff9f9f9)
                  ),
                  child: const Icon(Remix.close_line, color: Color(0xff333333), size: 32,),
                ),
              ),
            ),
            Text("총 ${foundIds.length}건의 검색 결과가 있습니다.", style: WidgetUtils.dialogTitleStyle),
            Container(
              width: 560,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
              color: ColorUtils.skyBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: foundIds.map((foundId) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(foundId, style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: StringUtils.pretendard,
                    letterSpacing: -0.4,
                    color: Color(0xff111111)
                  ),),
                )).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff222222), width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          fixedSize: const Size(128, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white
                      ),
                      onPressed: () {
                        Get.to(const HomeScreen());
                      },
                      child: const Text("홈으로",
                        style: TextStyle(
                            fontFamily: StringUtils.pretendard,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            letterSpacing: -0.34,
                            color: Color(0xff222222)
                        ),
                      )
                  ),
                  FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fixedSize: const Size(128, 50),
                        backgroundColor: const Color(0xff222222),
                        foregroundColor: const Color(0xff222222),
                      ),
                      onPressed: () {
                        Get.to(const FindPwScreen());
                      },
                      child: const Text("비밀번호 찾기",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.34,
                            color: Colors.white
                        ),
                      )
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }

}