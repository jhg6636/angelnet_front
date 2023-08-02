import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

Widget signUpProcessWidget(int step) {
  const filledDecoration = BoxDecoration(
    color: Colors.white12,
    borderRadius: BorderRadius.all(Radius.circular(8.0))
  );

  var blankDecoration = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(color: Colors.white12),
    borderRadius: const BorderRadius.all(Radius.circular(8.0))
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: filledDecoration,
        child: const Column(
          children: [
            Icon(Icons.check_circle),
            Text("01. 약관동의")
          ],
        ),
      ),
      const Padding(
        padding: WidgetUtils.smallPadding,
        child: Text(">>")
      ),
      Container(
        decoration: (step == 2) ? filledDecoration : blankDecoration,
        child: const Column(
          children: [
            Icon(Icons.check_circle),
            Text("02. 정보입력")
          ],
        ),
      ),
      const Padding(
          padding: WidgetUtils.smallPadding,
          child: Text(">>")
      ),
      Container(
        decoration: (step == 3) ? filledDecoration : blankDecoration,
        child: const Column(
          children: [
            Icon(Icons.check_circle),
            Text("03. 가입완료")
          ],
        ),
      ),
    ],
  );
}