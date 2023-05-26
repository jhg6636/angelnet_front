import 'package:backoffice_front/models/common/user.dart';
import 'package:backoffice_front/screens/common/edit_user_info_screen.dart';
import 'package:backoffice_front/screens/common/home_screen.dart';
import 'package:backoffice_front/utils/StringUtils.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:backoffice_front/widgets/core/business_card_and_signature_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4.0),
        color: Colors.grey,
        width: WidgetUtils.drawerWidth,
        height: 320.0,
        child: FutureBuilder<Map<String, dynamic>>(
            future: getMyInfo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return WidgetUtils.errorPadding;
              } else if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return myInfoWidget(snapshot.data);
              }
            }
        )
    );
  }
}

Widget myInfoWidget(Map<String, dynamic> myInfo) {
  Text text;

  switch (myInfo["level"]) {
    case "STARTUP":
      text = const Text(
          "스타트업",
          style: TextStyle(fontSize: 18.0, backgroundColor: Colors.green));
      break;
    case "ADMIN":
      text = const Text(
        "관리자",
        style: TextStyle(fontSize: 18.0, backgroundColor: Colors.blue),
      );
      break;
    case "LP":
    default:
      text = const Text(
        "조합원",
        style: TextStyle(fontSize: 18.0, backgroundColor: Colors.yellow),
      );
      break;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(height: 20.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: Text(
              myInfo["name"].toString()[0],
              style: const TextStyle(color: Colors.white70, fontSize: 25.0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${myInfo["name"]} 님",
                  style: const TextStyle(fontSize: 20.0)),
              const SizedBox(
                height: 10.0,
              ),
              text,
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      TextButton.icon(
        onPressed: () {
          Get.to(EditUserInfoScreen(stringId: myInfo["stringId"],));
        },
        icon: const Icon(
          Icons.edit,
          size: 24.0,
          color: Colors.black,
        ),
        label: const Text(
          "회원 정보 수정",
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      TextButton.icon(
          onPressed: () async {
            secureStorage.delete(key: await StringUtils().getDeviceId());
            Get.deleteAll();
            Get.to(const HomeScreen());
          },
          icon: const Icon(
            Icons.logout,
            size: 24.0,
            color: Colors.black,
          ),
          label: const Text(
            "로그아웃",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          )
      ),
      const SizedBox(height: 10.0),
      TextButton.icon(
          onPressed: () {
            Get.to(BusinessCardAndSignatureWidget());
          },
          label: const Text(
              "명함/서명 업로드하기",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          icon: const Icon(
            Icons.send_and_archive,
            size: 24.0,
            color: Colors.black,
          ),
      ),
      const SizedBox(height: 20.0,),
    ],
  );
}