import 'package:angelnet/utils/CustomInputFormatters.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditFundWidget extends StatefulWidget {

  const EditFundWidget({super.key});

  @override
  State<StatefulWidget> createState() => EditFundWidgetState();

}

class EditFundWidgetState extends State<EditFundWidget> {

  final blueStar = Container(
    margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
    child: const Text("*",
      style: TextStyle(
          fontSize: 15,
          fontFamily: "Pretendard",
          fontWeight: FontWeight.w400,
          color: Color(0xff4d87ef)
      ),
    ),
  );

  static const headingTextStyle = TextStyle(
      fontSize: 17,
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      color: Color(0xff333333),
      letterSpacing: -0.17
  );

  static const textFieldTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: StringUtils.pretendard,
    letterSpacing: -0.15,
    color: Color(0xff555555)
  );

  final fundNameController = TextEditingController();
  final startupNameController = TextEditingController();
  final mainProductController = TextEditingController();
  final typeController = TextEditingController(); // todo dropdown
  final totalCostController = TextEditingController();
  final costPerStockController = TextEditingController();
  final minimumCostController = TextEditingController();
  final gpController = TextEditingController();
  final memoController = TextEditingController();
  final startDateController = TextEditingController();
  final payDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("기본정보", style: WidgetUtils.h1Style,),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: const Divider(thickness: 2, color: Color(0xff555555),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("조합명", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: fundNameController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자종목", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: startupNameController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("주요제품", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: mainProductController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자형태", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: typeController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("결성금액", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 6, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: totalCostController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))
                    ),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            const Text("원", )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
      ],
    );
  }

}