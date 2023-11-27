import 'package:angelnet/screens/user/terms_of_use_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TermsOfUseViewScreen extends StatelessWidget {

  const TermsOfUseViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: InkWell(
            onTap: () { Get.back(); },
            child: Container(
              width: 154,
              height: 52,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: const Text("개인정보 수집·이용안내", style: WidgetUtils.titleStyle,),
              ),
              Container(
                height: 600,
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                padding: WidgetUtils.smallPadding,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffdddddd),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4.0))
                ),
                child: FutureBuilder<String>(
                  future: getTermsOfUseText(),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      print("Data: ${snapshot.data!.length} bytes");
                      return SingleChildScrollView(
                        child: Text(snapshot.data?.split("||")[1] ?? ""),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff222222), width: 2)
                    )
                  ),
                  onPressed: () { Get.back(); },
                  child: const Text("뒤로",
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: -0.34,
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222)
                    ),
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

}