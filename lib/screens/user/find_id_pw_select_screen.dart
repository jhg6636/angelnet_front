import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'find_id_screen.dart';
import 'find_pw_screen.dart';

class FindIdPwSelectScreen extends StatefulWidget {

  const FindIdPwSelectScreen({super.key});

  @override
  State<StatefulWidget> createState() => FindIdPwSelectScreenState();

}

class FindIdPwSelectScreenState extends State<FindIdPwSelectScreen> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

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
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 320),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("아이디/비밀번호 찾기",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pretendard",
                      color: Color(0xff111111)
                  )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: TabBar(
                    indicator: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(color: Color(0xff1173f9), width: 2),
                        right: BorderSide(color: Color(0xff1173f9), width: 2),
                        top: BorderSide(color: Color(0xff1173f9), width: 2),
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    ),
                    controller: tabController,
                    labelColor: const Color(0xff1173f9),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      letterSpacing: -0.17,
                      fontFamily: StringUtils.pretendard,
                    ),
                    unselectedLabelColor: const Color(0xff282728),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      letterSpacing: -0.17,
                      fontFamily: StringUtils.pretendard
                    ),
                    tabs: const [
                      Tab(text: "아이디 찾기",),
                      Tab(text: "비밀번호 찾기")
                    ],
                  ),
                ),
                Container(
                  height: 900,
                  margin: const EdgeInsets.fromLTRB(0, 38, 0, 0),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        children: [
                          Text("회원가입 시 등록한 정보를 입력 해 주세요.")
                        ],
                      ),
                      Column(
                        children: [
                          Text("가입 당시 입력한 이름 / ID / 이메일을 입력하시면, 이메일을 통하여 인증 완료 후, 비밀번호를 재설정 하실 수 있습니다.")
                        ],
                      )
                    ],
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(const FindIdScreen());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 480,
                            height: 240,
                            decoration: ShapeDecoration(
                              shape: Border()
                            ),
                            child: const Text("아이디 찾기")
                        )
                    ),
                    const SizedBox(
                        width: 50
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const FindPwScreen());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 480,
                            height: 240,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: const Text("비밀번호 찾기")
                        )
                    ),
                  ],
                )
              ],
            ),
          )
        )
      )
    );
  }

}