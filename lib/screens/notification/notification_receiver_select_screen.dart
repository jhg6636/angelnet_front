import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';

class NotificationReceiverSelectScreen extends StatefulWidget {

  const NotificationReceiverSelectScreen({super.key});

  @override
  State<StatefulWidget> createState() => NotificationReceiverSelectScreenState();

}

class NotificationReceiverSelectScreenState extends State<NotificationReceiverSelectScreen> {
  var groupName = "그룹명";
  var groupNames = ["그룹명", "그룹명2", "그룹명3"];
  var fundName = "조합명";
  var fundNames = ["조합명", "조합명2", "조합명3"];
  final nameController = TextEditingController();
  var selectedUsers = [];
  var allSelected = false;
  static const userTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: StringUtils.pretendard,
    letterSpacing: -0.16,
    color: Color(0xff333333)
  );
  var allUsers = ["김철수(kimcs3937)", "홍길동(honggildong1994)", "한이랑(han2938)",
    "김철수(kimcs3938)", "홍길동(honggildong1995)", "한이랑(han2937)",
    "김철수(kimcs3939)", "홍길동(honggildong1996)", "한이랑(han2936)"];

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("알림", style: WidgetUtils.titleStyle,),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 940,
                height: 599,
                margin: const EdgeInsets.fromLTRB(0, 48, 0, 0),
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffc3d9ff)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffeef6fd),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
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
                              value: groupName,
                              items: groupNames
                                  .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                                  .toList(),
                              onChanged: (String? value) => setState(() {
                                groupName = value ?? "그룹명";
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
                              value: fundName,
                              items: fundNames
                                  .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                                  .toList(),
                              onChanged: (String? value) => setState(() {
                                fundName = value ?? "조합명";
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
                                      controller: nameController,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                          hintText: "이름을 입력하세요",
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
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 25, 30, 40),
                      child: Row(
                        children: [
                          Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                                height: 354,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        bottomLeft: Radius.circular(6)
                                    ),
                                    border: Border.all(color: const Color(0xffdddddd))
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            activeColor: const Color(0xff0361f9),
                                            checkColor: Colors.white,
                                            value: allSelected,
                                            onChanged: (value) {
                                              setState(() {
                                                allSelected = value ?? false;
                                                if (value == true) {
                                                  selectedUsers.addAll(allUsers);
                                                } else {
                                                  selectedUsers.clear();
                                                }
                                              });
                                            },
                                            side: const BorderSide(color: Color(0xffdddddd)),
                                            splashRadius: 10,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                                            child: const Text("전체",
                                              style: TextStyle(
                                                  fontFamily: StringUtils.pretendard,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19,
                                                  letterSpacing: -0.38,
                                                  color: Color(0xff333333)
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(0, 11.5, 0, 15.5),
                                          child: const Divider(color: Color(0xffdddddd),)
                                      ),
                                    ] + allUsers.map<Row>((user) => Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                            activeColor: const Color(0xff0361f9),
                                            checkColor: Colors.white,
                                            side: const BorderSide(color: Color(0xffdddddd)),
                                            splashRadius: 10,
                                            value: selectedUsers.contains(user),
                                            onChanged: (value) {
                                              if (value == true) {
                                                setState(() {
                                                  selectedUsers.add(user);
                                                });
                                              } else {
                                                setState(() {
                                                  selectedUsers.remove(user);
                                                });
                                              }
                                            }
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                                            child: Text(user, style: userTextStyle)
                                        )
                                      ],
                                    )).toList(),
                                  ),
                                )
                              )
                          ),
                          Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 40),
                                height: 354,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                  border: Border.all(color: const Color(0xff1173f9), width: 2),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("받는이 ",
                                            style: TextStyle(
                                                fontFamily: StringUtils.pretendard,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                letterSpacing: -0.38,
                                                color: Color(0xff333333)
                                            ),
                                          ),
                                          Text(selectedUsers.length.toString(),
                                            style: const TextStyle(
                                                fontFamily: StringUtils.pretendard,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
                                                letterSpacing: -0.38,
                                                color: Color(0xff0361f9)
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(0, 17, 0, 10),
                                          child: const Divider(color: Color(0xffdddddd),)
                                      ),
                                    ] + selectedUsers.map<Container>((user) =>
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                            child: Row(
                                              children: [
                                                Text(user, style: userTextStyle,),
                                                Container(
                                                  margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedUsers.remove(user);
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets.all(3),
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Color(0xfff2f2f2)
                                                      ),
                                                      child: const Icon(Remix.close_line,
                                                        size: 14,
                                                        color: Color(0xff696969),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                        ),
                                    ).toList(),
                                  ),
                                )
                              )
                          )
                        ],
                      ),
                    ),
                    WidgetUtils().buttonBar("취소", "완료", () => null, () => null)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      isAdmin: true,
      crumbs: const ["알림", "알림보내기", "조합원 추가"]
    );
  }

}