import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LpNotificationScreen extends StatefulWidget {

  const LpNotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => LpNotificationScreenState();

}

class LpNotificationScreenState extends State<LpNotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("알림",
                style: TextStyle(
                  fontFamily: StringUtils.pretendard,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                  color: Color(0xff111111),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                child: const Divider(thickness: 2, color: Color(0xff555555),)
              ),
              Container(
                height: 543,
                margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // todo 알림 class에 widget을 만들 수 있게 해둔다
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Color(0x33002997)))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    transform: Matrix4.translationValues(-3, 0, 0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff0361f9),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: const Text("2023.05.05 11:12:31",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        fontFamily: StringUtils.pretendard,
                                        color: Color(0xff1173f9),
                                        letterSpacing: -0.32
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(16, 12, 0, 60),
                                child: const Text("서류제출이 시작되었습니다.",
                                  style: TextStyle(
                                    fontFamily: StringUtils.pretendard,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  )
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 520,
                      height: 342,
                      margin: const EdgeInsets.fromLTRB(0, 0, 11, 0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('lib/assets/images/lp_notification_image.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
        isAdmin: false, crumbs: const ["마이페이지", "알림"],
      );
  }

}