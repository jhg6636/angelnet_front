import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                height: 354,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        bottomLeft: Radius.circular(6)
                                    ),
                                    border: Border.all(color: const Color(0xffdddddd))
                                ),
                                child: Column(
                                  children: [
                                    Row()
                                  ],
                                ),
                              )
                          ),
                          Flexible(
                              child: Container(
                                height: 354,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                  border: Border.all(color: const Color(0xff1173f9), width: 2),
                                ),
                                child: Column(
                                  children: [

                                  ],
                                ),
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