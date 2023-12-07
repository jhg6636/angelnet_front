import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';

enum LpStatus {
  waiting(english: "WAITING"),
  joined(english: "JOINED")
  ;

  final String english;

  const LpStatus({required this.english});

  factory LpStatus.fromEnglish(String english) {
    switch (english) {
      case "WAITING":
        return LpStatus.waiting;
      case "JOINED":
        return LpStatus.joined;
      default:
        return LpStatus.joined;
    }
  }

  Widget toFundLpWidget() {
    if (this == LpStatus.waiting) {
      return Container(
        width: 84,
        height: 28,
        color: const Color(0xfff4f4f4),
        child: const Center(
          child: Text("대기",
            style: TextStyle(
              color: Color(0xff999999),
              fontWeight: FontWeight.w400,
              fontFamily: StringUtils.pretendard,
              fontSize: 15,
              letterSpacing: -0.45
            ),
          ),
        ),
      );
    }
    return Container(
      width: 84,
      height: 28,
      color: const Color(0xff04b45f),
      child: const Center(
        child: Text("참여",
          style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontFamily: StringUtils.pretendard,
              fontSize: 15,
              letterSpacing: -0.45
          ),
        ),
      ),
    );
  }
}
