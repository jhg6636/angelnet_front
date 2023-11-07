import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailScreen extends StatefulWidget {

  const UserDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => UserDetailScreenState();

}

class UserDetailScreenState extends State<UserDetailScreen> {

  @override
  Widget build(BuildContext context) {
    var userLevel = 'ADMIN';

    const starText = Text("*",
        style: TextStyle(
            fontSize: 15,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w400,
            color: Color(0xff4d87ef)
        )
    );
    const headTextStyle = TextStyle(
        fontSize: 17,
        fontFamily: "Pretendard",
        fontWeight: FontWeight.w500,
        color: Color(0xff333333),
        letterSpacing: -0.17
    );
    const infoTextStyle = TextStyle(
        fontSize: 15,
        fontFamily: "Pretendard",
        fontWeight: FontWeight.w300,
        color: Color(0xff555555),
        letterSpacing: -0.15
    );

    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("회원정보수정", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 8),
              child: const Text("기본정보", style: WidgetUtils.h1Style,),
            ),
            const Divider(thickness: 2, color: Color(0xff555555),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: starText
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("아이디", style: headTextStyle)
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(112, 10, 0, 0),
                  child: const Text("Abcd1234", style: infoTextStyle,),
                )
              ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: starText
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: const Text("이름", style: headTextStyle)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(127, 10, 0, 0),
                    child: const Text("김철수", style: infoTextStyle,),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: starText
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: const Text("이메일", style: headTextStyle)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(112, 10, 0, 0),
                    child: const Text("Abcd1234@gmail.com", style: infoTextStyle,),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: starText
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: const Text("연락처", style: headTextStyle)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(112, 10, 0, 0),
                    child: const Text("010-1234-2381", style: infoTextStyle,),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 41),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            const Text("추가정보", style: WidgetUtils.h1Style),
            const SizedBox(height: 8,),
            const Divider(thickness: 2, color: Color(0xff555555),),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                      child: const Text("추천인", style: headTextStyle)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(112, 10, 0, 0),
                    child: const Text("김철수", style: infoTextStyle,),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                      child: const Text("근무처", style: headTextStyle)
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(112, 10, 0, 0),
                    child: const Text("플랜아이", style: infoTextStyle,),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 9, 0, 41),
              child: const Divider(color: Color(0xffdddddd),),
            ),
            const Text("회원 등급", style: WidgetUtils.h1Style,),
            const SizedBox(height: 8,),
            const Divider(thickness: 2, color: Color(0xff555555),),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 11, 0, 9),
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                    activeColor: const Color(0xff505050),
                    splashRadius: 1,
                    value: 'LP',
                    groupValue: userLevel,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 0, 20, 0),
                    child: const Text("일반회원",
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          letterSpacing: -0.17
                      ),
                    ),
                  ),
                  Radio(
                    activeColor: const Color(0xff505050),
                    splashRadius: 1,
                    value: 'ADMIN',
                    groupValue: userLevel,
                    onChanged: (value) {
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                    child: const Text("관리자",
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontWeight: FontWeight.w500,
                          fontFamily: StringUtils.pretendard,
                          fontSize: 17,
                          letterSpacing: -0.17
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 54, 0, 17),
              child: const Text("회원 조합참여정보", style: WidgetUtils.h1Style,),
            ),
            Container(
              width: double.maxFinite,
              child: DataTable(
                  border: const TableBorder(
                      top: BorderSide(color: Color(0xff333333), width: 2),
                      horizontalInside: BorderSide(color: Color(0xffdddddd))
                  ),
                  dataRowMinHeight: 63,
                  dataRowMaxHeight: 63,
                  headingRowHeight: 57,
                  headingTextStyle: WidgetUtils.dataTableHeadStyle,
                  dataTextStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.16,
                      color: Color(0xff333333)
                  ),
                  columns: const [
                    DataColumn(label: Text("번호")),
                    DataColumn(label: Text("조합명")),
                    DataColumn(label: Text("투자기업")),
                    DataColumn(label: Text("참여금액")),
                    DataColumn(label: Text("해산일")),
                  ],
                  rows: const [
                    DataRow(
                        cells: [
                          DataCell(Text("1")),
                          DataCell(Text("리벤처스 테크 투자조합")),
                          DataCell(Text("플랜아이")),
                          DataCell(Text("500,000,000")),
                          DataCell(Text("-")),
                        ]
                    )
                  ]
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfff6f6f6),
                border: Border(
                  top: BorderSide(color: Color(0xffdddddd)),
                  bottom: BorderSide(color: Color(0xffdddddd)),
                )
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              padding: const EdgeInsets.fromLTRB(245, 22, 245, 21),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("총액",
                    style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: -0.16,
                      color: Color(0xff333333)
                    ),
                  ),
                  Text("500,000,000원",
                    style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: -0.16,
                        color: Color(0xff333333)
                    ),
                  )
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
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
                    child: const Text("뒤로",
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
                    backgroundColor: const Color(0xff222222),
                    fixedSize: const Size(120, 50),
                    side: const BorderSide(color: Color(0xff222222), width: 2.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("수정",
                    style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color(0xffffffff),
                      letterSpacing: -0.34
                    )
                  )
                ),
              ],
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["회원관리", "회원정보수정"]
    );
  }

}