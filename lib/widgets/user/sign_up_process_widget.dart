import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

Widget signUpProcessWidget(int step) {
  const Color pointColor = Color(0xff1badfb);
  const Color normalColor = Color(0xffc6d4eb);

  return Container(
    height: 145,
    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
    padding: const EdgeInsets.fromLTRB(0, 35, 0, 34),
    decoration: const BoxDecoration(
        color: Color(0xfff7faff),
        border: Border(
            top: BorderSide(
                color: Color(0xff1173f9),
                width: 5
            )
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 12),
                decoration: BoxDecoration(
                    color: (step == 1) ? pointColor : normalColor,
                    shape: BoxShape.circle
                ),
                child: const Center(
                  child: Text("01",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                )
            ),
            const Text("약관동의",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: -0.18
              ),
            )
          ],
        ),
        Row(
          children: [
            for (int i=0; i<30; i++) Container(
              width: 3,
              height: 3,
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 31),
              decoration: const BoxDecoration(
                  color: Color(0xffb7b7b7),
                  shape: BoxShape.circle
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 12),
                decoration: BoxDecoration(
                    color: (step == 2) ? pointColor : normalColor,
                    shape: BoxShape.circle
                ),
                child: const Center(
                  child: Text("02",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),
                  ),
                )
            ),
            const Text("정보입력",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: -0.18
              ),
            )
          ],
        ),
        Row(
          children: [
            for (int i=0; i<30; i++) Container(
              width: 3,
              height: 3,
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 31),
              decoration: const BoxDecoration(
                  color: Color(0xffb7b7b7),
                  shape: BoxShape.circle
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 12),
                decoration: BoxDecoration(
                    color: (step == 3) ? pointColor : normalColor,
                    shape: BoxShape.circle
                ),
                child: const Center(
                  child: Text("03",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    ),
                  ),
                )
            ),
            const Text("가입완료",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: -0.18
              ),
            )
          ],
        ),
      ],
    ),
  );
}