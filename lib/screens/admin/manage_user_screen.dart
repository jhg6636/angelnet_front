import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/common/user.dart';
import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../../widgets/admin/make_user_form.dart';
import '../screen_frame.dart';

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
              decoration: BoxDecoration(
                color: const Color(0xfff7faff),
                border: const Border(top: BorderSide(width: 2, color: Color(0xff1173f9)))
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
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["회원관리"]
    );
  }
  // Future<List<User>> users = fetchUsers();
  //
  // final _stringIdController = TextEditingController();
  // final _nameController = TextEditingController();
  // final _workplaceController = TextEditingController();
  // final _recommenderController = TextEditingController();
  //
  // final List<String> _userLevelFilterOptions = ['LP', 'STARTUP', 'ADMIN'];
  // final List<String> _selectedUserLevels = [];
  //
  // @override
  // Widget build(BuildContext context) {
  //   return ScreenFrame(
  //       main: Column(
  //         children: [
  //           const SizedBox(height: 36.0),
  //           const Text(
  //             "회원 관리",
  //             style: WidgetUtils.titleStyle,
  //           ),
  //           const SizedBox(height: 36.0),
  //           Wrap(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: SizedBox(
  //                   width: 350.0,
  //                   child: TextField(
  //                     controller: _stringIdController,
  //                     decoration: const InputDecoration(
  //                       labelText: "아이디",
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                 )
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: SizedBox(
  //                   width: 350.0,
  //                   child: TextField(
  //                     controller: _nameController,
  //                     decoration: const InputDecoration(
  //                       labelText: "이름",
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                 )
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: SizedBox(
  //                   width: 350.0,
  //                   child: TextField(
  //                     controller: _workplaceController,
  //                     decoration: const InputDecoration(
  //                       labelText: "근무처",
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                 )
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child: SizedBox(
  //                   width: 350.0,
  //                   child: TextField(
  //                     controller: _recommenderController,
  //                     decoration: const InputDecoration(
  //                       labelText: "추천인",
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   )
  //                 )
  //               ),
  //               const Padding(
  //                 padding: EdgeInsets.all(10.0),
  //                 child: Text("권한 (복수 선택 가능)")
  //               ),
  //               Wrap(
  //                 crossAxisAlignment: WrapCrossAlignment.end,
  //                   children: _userLevelFilterOptions.map((option) {
  //                     return Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
  //                         child: FilterChip(
  //                             label: Text(option),
  //                             selected: _selectedUserLevels.contains(option),
  //                             onSelected: (bool selected) {
  //                               setState(() {
  //                                 if (selected) {
  //                                   _selectedUserLevels.add(option);
  //                                 } else {
  //                                   _selectedUserLevels.remove(option);
  //                                 }
  //                               });
  //                             }
  //                         )
  //                     );
  //                   }).toList()
  //               ),
  //             ],
  //           ),
  //           ButtonBar(
  //             alignment: MainAxisAlignment.center,
  //             children: [
  //               FilledButton.icon(
  //                   onPressed: () {
  //                     // todo 검색 기능
  //                     setState(() {
  //                       users = fetchUsers();
  //                     });
  //                   },
  //                   icon: const Icon(Icons.search),
  //                   label: const Text("검색"),
  //               ),
  //               FilledButton.icon(
  //                 onPressed: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     builder: (BuildContext context) {
  //                       return const SizedBox(
  //                         height: 1000.0,
  //                         child: MakeUserForm(isPopup: true, isEditing: false, user: null,)
  //                       );
  //                     }
  //                   );
  //                 },
  //                 icon: const Icon(Icons.add),
  //                 label: const Text("신규 회원 추가"),
  //               ),
  //               FilledButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     users = fetchUsers(sort: "LAST_LOGIN");
  //                   });
  //                 },
  //                 child: const Text("최근 로그인 순 정렬"),
  //               ),
  //               FilledButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     users = fetchUsers();
  //                   });
  //                 },
  //                 child: const Text("최근 가입 순 정렬"),
  //               )
  //             ],
  //           ),
  //           FutureBuilder<List<User>>(
  //               future: users,
  //               builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
  //                 if (snapshot.hasError) {
  //                   print(snapshot.error);
  //                   print(snapshot.stackTrace);
  //                   return WidgetUtils.errorPadding;
  //                 } else if (snapshot.hasData == false) {
  //                   return const CircularProgressIndicator();
  //                 } else {
  //                   ScrollController vertical = ScrollController();
  //                   ScrollController horizontal = ScrollController();
  //                   return Scrollbar(
  //                       controller: vertical,
  //                       child: SingleChildScrollView(
  //                         controller: vertical,
  //                         child: Scrollbar(
  //                           controller: horizontal,
  //                           child: SingleChildScrollView(
  //                             controller: horizontal,
  //                             scrollDirection: Axis.horizontal,
  //                             child: adminUserTable(snapshot.data ?? List.empty()),
  //                           ),
  //                         )
  //                       )
  //                   );
  //                 }
  //               }
  //           ),
  //         ],
  //       ),
  //       isAdmin: true
  //   );
  // }

}

// todo lastLogin 필요, 멤버 상세 페이지 연결 필요
DataTable adminUserTable(List<User> users) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("아이디")),
        DataColumn(label: Text("이름")),
        DataColumn(label: Text("등급")),
        DataColumn(label: Text("연락처")),
        DataColumn(label: Text("이메일")),
        DataColumn(label: Text("추천인")),
        DataColumn(label: Text("최근 로그인 시간")),
        DataColumn(label: Text("근무처")),
        DataColumn(label: Text("가입일")),
        DataColumn(label: Text("정보 수정")),
      ],
      rows: users.map<DataRow>((user) => user.toDataRow()).toList(),
  );
}