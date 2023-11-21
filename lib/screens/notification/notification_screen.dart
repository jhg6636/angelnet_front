import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/notification/notification.dart' as notification;

class NotificationScreen extends StatefulWidget {

  final bool isAdmin;

  const NotificationScreen({super.key, required this.isAdmin});

  @override
  State<StatefulWidget> createState() => NotificationScreenState();

}

class NotificationScreenState extends State<NotificationScreen> {

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
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 9),
                child: const Divider(thickness: 2, color: Color(0xff333333),),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(13, 0, 0, 30),
                child: const Text("각 알림 클릭 시 해당 페이지로 이동합니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: StringUtils.pretendard,
                    fontSize: 14,
                    letterSpacing: -0.14,
                    color: Color(0xff555555)
                  ),
                ),
              ),
              FutureBuilder(
                future: notification.fetchMyNotifications(),
                builder: (BuildContext context, AsyncSnapshot<List<notification.Notification>> snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    StringUtils().printError(snapshot);
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 100),
                      child: const Center(
                        child: Text("알림이 없습니다.", style: WidgetUtils.dataTableDataStyle,),
                      ),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 100),
                      child: const Center(
                        child: Text("알림이 없습니다.", style: WidgetUtils.dataTableDataStyle,),
                      ),
                    );
                  } else {
                    return Container(
                      height: 543,
                      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Color(0x33002997)))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: snapshot.data!.map((noti) =>
                            noti.toWidget(() {
                              setState(() async {
                                var response = await notification.checkNotification(noti.id);
                                print("notification/check");
                                print(response.body);
                              });
                            })
                          ).toList(),
                        ),
                      ),
                    );
                  }
                }
              ),
            ],
          )
        ),
        isAdmin: widget.isAdmin, crumbs: const ["마이페이지", "알림"],
      );
  }

}