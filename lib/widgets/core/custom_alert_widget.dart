import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CustomAlertWidget {

  Widget informationWidget(BuildContext context, String mainMessage, String? subMessage) {
    return AlertDialog(
      content: Container(
        width: 660,
        height: 270,
        padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mainMessage,
                      style: const TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        letterSpacing: -0.48,
                        color: Color(0xff111111)
                      ),
                    ),
                    if (subMessage != null) Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(subMessage,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: StringUtils.pretendard,
                          letterSpacing: -0.16,
                          color: Color(0xff767676)
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xfff2f9ff),
                    shape: BoxShape.circle
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Remix.error_warning_line, color: Color(0xff1BADFB), size: 32,),
                )
              ],
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.fromLTRB(0, 72, 0, 0),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff222222),
                  foregroundColor: const Color(0xff222222),
                  fixedSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("확인",
                  style: TextStyle(
                    fontFamily: StringUtils.pretendard,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    letterSpacing: -0.34,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}