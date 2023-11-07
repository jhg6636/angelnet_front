import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/common/user.dart';
import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/admin/make_user_form.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageUserScreenState();
}

class ManageUserScreenState extends State<ManageUserScreen> {
  var selectedLevel = '전체';
  var selectedSearchOption = '전체';
  final levelOptions = ['전체', '일반회원', '관리자'];
  final searchOptions = ['전체', '이름', 'ID', '연락처'];
  final searchTextController = TextEditingController();
  final scrollController = ScrollController();
  Future<List<User>> users = fetchUsers();

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("회원관리", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
              decoration: const BoxDecoration(
                color: Color(0xfff7faff),
                border: Border(top: BorderSide(width: 2, color: Color(0xff1173f9)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.white,
                      height: 42,
                      child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                        value: selectedLevel,
                        items: levelOptions
                            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          selectedLevel = value ?? "전체";
                        }),
                      ))
                  ),
                  Container(
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 42,
                      child: DropdownButtonHideUnderline(child: DropdownButton<String>(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff333333),
                        ),
                        value: selectedSearchOption,
                        items: searchOptions
                            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          selectedSearchOption = value ?? "전체";
                        }),
                      ))
                  ),
                  Container(
                      width: 320,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 29,
                              child: TextField(
                                controller: searchTextController,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    hintText: "검색어를 입력하세요",
                                    hintStyle: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff757575),
                                        letterSpacing: -0.16
                                    )
                                ),
                              )
                          ),
                          Flexible(
                              flex: 3,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 9.69, 0),
                                  width: 20.31,
                                  height: 20.31,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('lib/assets/images/search_icon.png'),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                ),
                              )
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("총 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    ),
                    FutureBuilder(
                      future: users,
                      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                        if (snapshot.hasError) {
                          StringUtils().printError(snapshot);
                          return const Text("0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          );
                        } else if (!snapshot.hasData) {
                          return const Text("0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          );
                        } else {
                          return Text((snapshot.data?.length ?? 0).toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: StringUtils.pretendard,
                              letterSpacing: -0.16,
                              color: Color(0xff333333),
                            ),
                          );
                        }
                      }
                    ),
                    const Text("건",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 128,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xffcccccc)),
                            borderRadius: BorderRadius.circular(50)
                          )
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: const Icon(Remix.download_line, size: 16, color: Color(0xff333333),),
                              ),
                              const Text("엑셀 다운로드",
                                style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: -0.14,
                                  color: Color(0xff333333)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xffcccccc)),
                              borderRadius: BorderRadius.circular(50)
                          )
                      ),
                      onPressed: () {
                        Get.to(
                          const ScreenFrameV2(
                            main: MakeUserForm(isAdmin: true, isEditing: false, user: null),
                            isAdmin: true,
                            crumbs: ['회원관리', '신규회원등록']
                          )
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: const Icon(Remix.user_add_line, size: 16, color: Color(0xff333333),),
                            ),
                            const Text("신규회원등록",
                              style: TextStyle(
                                  fontFamily: StringUtils.pretendard,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  letterSpacing: -0.14,
                                  color: Color(0xff333333)
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  child: FutureBuilder(
                    future: users,
                    builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                      if (snapshot.hasError) {
                        StringUtils().printError(snapshot);
                        return const CircularProgressIndicator();
                      } else if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        return adminUserTable(snapshot.data ?? [], context);
                      }
                    },
                  )
                ),
              )
            ),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["회원관리"]
    );
  }

}

// todo lastLogin 필요, 멤버 상세 페이지 연결 필요
DataTable adminUserTable(List<User> users, BuildContext context) {
  return DataTable(
      headingTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: StringUtils.pretendard,
          letterSpacing: -0.16,
          color: Color(0xff222222)
      ),
      dataTextStyle: const TextStyle(
          fontFamily: StringUtils.pretendard,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: -0.16,
          color: Color(0xff757575)
      ),
      columns: const [
        DataColumn(label: Text("기능")),
        DataColumn(label: Text("번호")),
        DataColumn(label: Text("회원등급")),
        DataColumn(label: Text("이름")),
        DataColumn(label: Text("ID")),
        DataColumn(label: Text("연락처")),
        DataColumn(label: Text("이메일")),
        DataColumn(label: Text("가입일")),
        DataColumn(label: Text("최근 로그인 시간")),
        DataColumn(label: Text("추천인")),
        DataColumn(label: Text("근무처")),
      ],
      rows: users.indexed.map<DataRow>((e) => e.$2.toDataRow(e.$1, context)).toList(),
  );
}