import 'package:angelnet/utils/CustomInputFormatters.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

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
  final valueController = TextEditingController();
  final costPerStockController = TextEditingController();
  final minimumCostController = TextEditingController();
  final gpController = TextEditingController();
  final memoController = TextEditingController();
  final startDateController = TextEditingController();
  final payDateController = TextEditingController();
  final valueTypes = ["PRE", "POST"];
  var selectedValueType = "PRE";

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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text("원", style: textFieldTextStyle,),
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자밸류", style: headingTextStyle)
            ),
            Container(
              width: 100,
              height: 38,
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffdddddd))
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: selectedValueType,
                    items: valueTypes.map<DropdownMenuItem<String>>((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedValueType = value ?? "PRE";
                      });
                    },
                    style: textFieldTextStyle,
                    padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                    dropdownColor: Colors.white,
                    focusColor: Colors.white,
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 6, 0),
              child: SizedBox(
                width: 296,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: valueController,
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
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("발행가격(인수가격)", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(28, 10, 0, 0),
              child: const Text("주당", style: textFieldTextStyle,)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(78, 0, 6, 0),
              child: SizedBox(
                width: 296,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: costPerStockController,
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text("원", style: textFieldTextStyle,),
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("최소참여금액", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(69, 0, 6, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: minimumCostController,
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text("원", style: textFieldTextStyle,),
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("조합 결성일", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(79, 0, 0, 0),
              child: SizedBox(
                width: 140,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: startDateController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Remix.calendar_check_line, color: Color(0xff555555),),
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
                  inputFormatters: [DateInputFormatter()],
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
                child: const Text("주금 납입일", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(79, 0, 0, 0),
              child: SizedBox(
                width: 140,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: payDateController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Remix.calendar_check_line, color: Color(0xff555555),),
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
                  inputFormatters: [DateInputFormatter()],
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
                child: const Text("담당자", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: gpController,
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
            Container(
                margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                child: const Text("기타", style: headingTextStyle)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: memoController,
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
        Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 8),
          child: const Text("참조 자료", style: WidgetUtils.h1Style),
        ),
        const Divider(color: Color(0xff555555), thickness: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
              child: const Text("참조 자료", style: headingTextStyle,),
            ),
            Container(
              width: 800,
              margin: const EdgeInsets.fromLTRB(94, 0, 4, 0),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffdddddd)),
                borderRadius: BorderRadius.circular(2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 24,
                    height: 20,
                    margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/img.png'),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: const Text("홈페이지 이용과 관련하여 필수적인 공지사항.png",
                      style: TextStyle(
                        fontFamily: StringUtils.pretendard,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: -0.16,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  const Text("(123.4KB)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.14,
                      color: Color(0xff999999)
                    ),
                  ),
                ],
              ),
            ),
            FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff6c6f81),
                    foregroundColor: const Color(0xff6c6f81),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    fixedSize: const Size(90, 38)
                ),
                onPressed: () {},
                child: const Text("파일찾기",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.32,
                      color: Colors.white
                  ),
                )
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.fromLTRB(4, 0, 1, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: const Color(0xffcccccc))
                ),
                child: const Icon(Remix.add_line, color: Color(0xff555555), size: 18,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xffcccccc))
                ),
                child: const Icon(Remix.subtract_line, color: Color(0xff555555), size: 18,),
              ),
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 41, 0, 8),
          child: const Text("회사소개서", style: WidgetUtils.h1Style,),
        ),
        const Divider(color: Color(0xff555555), thickness: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
              child: const Text("회사소개서", style: headingTextStyle,),
            ),
            Container(
              width: 800,
              height: 38,
              margin: const EdgeInsets.fromLTRB(83, 0, 4, 0),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(2)
              ),
            ),
            FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff6c6f81),
                    foregroundColor: const Color(0xff6c6f81),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    fixedSize: const Size(90, 38)
                ),
                onPressed: () {},
                child: const Text("파일찾기",
                  style: TextStyle(
                      fontFamily: StringUtils.pretendard,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: -0.32,
                      color: Colors.white
                  ),
                )
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 38,
                height: 38,
                margin: const EdgeInsets.fromLTRB(4, 0, 1, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xffcccccc))
                ),
                child: const Icon(Remix.add_line, color: Color(0xff555555), size: 18,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: const Color(0xffcccccc))
                ),
                child: const Icon(Remix.subtract_line, color: Color(0xff555555), size: 18,),
              ),
            )
          ],
        ),
        const Divider(color: Color(0xffdddddd),),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: WidgetUtils().buttonBar("목록", "저장", () => null, () => null),
        )
      ],
    );
  }

}