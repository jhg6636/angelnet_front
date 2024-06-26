import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/fund/fund_status.dart';
import 'package:angelnet/models/fund/fund_type.dart';
import 'package:angelnet/screens/admin/manage_fund_screen.dart';
import 'package:angelnet/screens/lp/edit_fund_visibility_screen.dart';
import 'package:angelnet/utils/CustomInputFormatters.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/core/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class FundFormWidget extends StatefulWidget {
  final Fund? fund;
  final FundStatus status;

  const FundFormWidget({super.key, required this.fund, required this.status});

  @override
  State<StatefulWidget> createState() => FundFormWidgetState();
}

class FundFormWidgetState extends State<FundFormWidget> {
  int documentCount = 1;
  final blueStar = Container(
    margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
    child: const Text(
      "*",
      style: TextStyle(
          fontSize: 15,
          fontFamily: "Pretendard",
          fontWeight: FontWeight.w400,
          color: Color(0xff4d87ef)),
    ),
  );

  static const headingTextStyle = TextStyle(
      fontSize: 17,
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      color: Color(0xff333333),
      letterSpacing: -0.17);

  static const textFieldTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      fontFamily: StringUtils.pretendard,
      letterSpacing: -0.15,
      color: Color(0xff555555));

  final valueTypes = ["PRE", "POST"];
  var selectedValueType = 'PRE';
  final fundTypeList = FundType.values.map((value) => value.korean);
  late var selectedFundType = widget.fund?.type.korean ?? fundTypeList.first;
  final fundNameController = TextEditingController();
  final startupNameController = TextEditingController();
  final mainProductController = TextEditingController();
  final totalCostController = TextEditingController();
  final valueController = TextEditingController();
  final costPerShareController = TextEditingController();
  final minimumCostController = TextEditingController();
  final gpController = TextEditingController();
  final memoController = TextEditingController();
  final startDateController = TextEditingController();
  final payDateController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final finalDateController = TextEditingController();
  final returnCostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.fund != null) {
      fundNameController.text = widget.fund!.name;
      startupNameController.text = widget.fund!.startupName;
      mainProductController.text = widget.fund!.mainProduct;
      totalCostController.text =
          StringUtils().currencyFormat(widget.fund?.cost ?? 0);
      valueController.text =
          StringUtils().currencyFormat(widget.fund?.value ?? 0);
      costPerShareController.text =
          StringUtils().currencyFormat(widget.fund?.costPerShare ?? 0);
      minimumCostController.text = StringUtils().currencyFormat(
          ((widget.fund?.minimumShare ?? 0) *
              (widget.fund?.costPerShare ?? 0)));
      gpController.text = widget.fund!.managerName;
      memoController.text = widget.fund!.memo ?? "";
      startDateController.text = DateFormat("yyyy-MM-dd")
          .format(widget.fund?.startAt ?? DateTime.now());
      payDateController.text =
          DateFormat("yyyy-MM-dd").format(widget.fund?.payAt ?? DateTime.now());
      selectedValueType = widget.fund!.valueType;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "기본정보",
              style: WidgetUtils.h1Style,
            ),
            if (widget.fund != null) WidgetUtils.actionButton("등급설정", () => Get.to(EditFundVisibilityScreen(fund: widget.fund!)))
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: const Divider(
            thickness: 2,
            color: Color(0xff555555),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("조합명", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자종목", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("주요제품", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자형태", style: headingTextStyle)),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              child: Container(
                width: 400,
                height: 38,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffdddddd)),
                    borderRadius: BorderRadius.circular(2)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    focusNode: FocusNode(skipTraversal: true),
                    focusColor: Colors.white,
                    dropdownColor: Colors.white,
                    value: selectedFundType,
                    items: fundTypeList
                        .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type,
                                style: WidgetUtils.dataTableDataStyle)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFundType = value ?? FundType.commonShare.korean;
                      });
                    },
                  ),
                ),
                // child: TextField(
                //   textAlignVertical: TextAlignVertical.top,
                //   keyboardType: TextInputType.text,
                //   controller: typeController,
                //   style: textFieldTextStyle,
                //   decoration: const InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Color(0xffdddddd))
                //     ),
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(color: Color(0xffdddddd))
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Color(0xffdddddd))
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("결성금액", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "원",
                style: textFieldTextStyle,
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("투자밸류", style: headingTextStyle)),
            Container(
              width: 100,
              height: 38,
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdddddd))),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                value: selectedValueType,
                items: valueTypes
                    .map<DropdownMenuItem<String>>((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedValueType = value ?? "PRE";
                  });
                },
                style: textFieldTextStyle,
                padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                dropdownColor: Colors.white,
                focusColor: Colors.white,
              )),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "원",
                style: textFieldTextStyle,
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("참여금액", style: headingTextStyle)),
            Container(
                margin: const EdgeInsets.fromLTRB(98, 10, 0, 0),
                child: const Text(
                  "좌당",
                  style: textFieldTextStyle,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(78, 0, 6, 0),
              child: SizedBox(
                width: 296,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: costPerShareController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "원",
                style: textFieldTextStyle,
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("최소참여금액", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "원",
                style: textFieldTextStyle,
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("조합 결성일", style: headingTextStyle)),
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
                    suffixIcon: Icon(
                      Remix.calendar_check_line,
                      color: Color(0xff555555),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [DateInputFormatter()],
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("주금 납입일", style: headingTextStyle)),
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
                    suffixIcon: Icon(
                      Remix.calendar_check_line,
                      color: Color(0xff555555),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [DateInputFormatter()],
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("담당자", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(19, 9, 0, 0),
                child: const Text("기타", style: headingTextStyle)),
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
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("조합 계좌 정보", style: WidgetUtils.h1Style),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: const Text("정보 입력 시, 해당 정보로 모든 조합원에게 알림이 발송되니 더블 체크 부탁드립니다.",
                  style: WidgetUtils.dataTableDataStyle,
                ),
              )
            ],
          )
        ),
        const Divider(
          color: Color(0xff555555),
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
              child: const Text(
                "은행명",
                style: headingTextStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: bankNameController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
              child: const Text(
                "계좌번호",
                style: headingTextStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 0, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.text,
                  controller: accountNumberController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("해산 정보", style: WidgetUtils.h1Style),
              ],
            )
        ),
        const Divider(
          color: Color(0xff555555),
          thickness: 2,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("조합 해산일", style: headingTextStyle)),
            Container(
              margin: const EdgeInsets.fromLTRB(79, 0, 0, 0),
              child: SizedBox(
                width: 140,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: finalDateController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Remix.calendar_check_line,
                      color: Color(0xff555555),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [DateInputFormatter()],
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blueStar,
            Container(
                margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                child: const Text("해산금액", style: headingTextStyle)),
            Container(
              margin: const EdgeInsets.fromLTRB(98, 0, 6, 0),
              child: SizedBox(
                width: 400,
                height: 38,
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.number,
                  controller: returnCostController,
                  style: textFieldTextStyle,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffdddddd))),
                  ),
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: const Text(
                "원",
                style: textFieldTextStyle,
              ),
            )
          ],
        ),
        const Divider(
          color: Color(0xffdddddd),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: WidgetUtils().buttonBar("목록", "저장", () {
            Get.to(const ManageFundScreen());
          },
              (widget.fund != null)
                  ? () async {
                      print(widget.status);
                      var response = await editFund(Fund(
                        id: widget.fund!.id,
                        name: fundNameController.text,
                        startupName: startupNameController.text,
                        mainProduct: mainProductController.text,
                        managerName: gpController.text,
                        startAt: DateTime.parse(startDateController.text),
                        type: FundType.fromKorean(selectedFundType),
                        dissolvedAt: widget.fund!.dissolvedAt,
                        margin: widget.fund!.margin,
                        cost: StringUtils()
                            .fromCurrencyFormat(totalCostController.text),
                        costPerShare: StringUtils()
                            .fromCurrencyFormat(costPerShareController.text),
                        currentFundedCost: widget.fund!.currentFundedCost,
                        currentMemberCount: widget.fund!.currentMemberCount,
                        minimumShare: StringUtils().fromCurrencyFormat(
                                minimumCostController.text) ~/
                            StringUtils().fromCurrencyFormat(
                                costPerShareController.text),
                        totalShare: StringUtils()
                                .fromCurrencyFormat(totalCostController.text) ~/
                            StringUtils()
                                .fromCurrencyFormat(minimumCostController.text),
                        totalMember: widget.fund!.totalMember,
                        status: widget.status,
                        payAt: DateTime.parse(payDateController.text),
                        value: StringUtils()
                            .fromCurrencyFormat(valueController.text),
                        valueType: selectedValueType,
                        recommender: null,
                        groupName: null,
                        memo: memoController.text,
                        irUrl: null,
                        fundIdDocumentUrl: null,
                        ruleUrl: null,
                        etcUrl: null,
                        isFunding: false,
                        bankName: bankNameController.text,
                        accountNumber: accountNumberController.text,
                      ));
                      print(response.body);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomAlertWidget().informationWidget(
                                context, "조합 정보가 수정되었습니다.", null);
                          });
                      // Get.to(const ManageFundScreen());
                    }
                  : () async {
                      await makeFund(Fund(
                        id: -1,
                        name: fundNameController.text,
                        startupName: startupNameController.text,
                        mainProduct: mainProductController.text,
                        managerName: gpController.text,
                        startAt: DateTime.parse(startDateController.text),
                        type: FundType.fromKorean(selectedFundType),
                        dissolvedAt: null,
                        margin: null,
                        cost: StringUtils()
                            .fromCurrencyFormat(totalCostController.text),
                        costPerShare: StringUtils()
                            .fromCurrencyFormat(costPerShareController.text),
                        currentFundedCost: 0,
                        currentMemberCount: 0,
                        minimumShare: StringUtils().fromCurrencyFormat(
                                minimumCostController.text) ~/
                            StringUtils().fromCurrencyFormat(
                                costPerShareController.text),
                        totalShare: StringUtils()
                                .fromCurrencyFormat(totalCostController.text) ~/
                            StringUtils().fromCurrencyFormat(
                                costPerShareController.text),
                        totalMember: 49,
                        status: widget.status,
                        payAt: DateTime.parse(payDateController.text),
                        value: StringUtils()
                            .fromCurrencyFormat(valueController.text),
                        valueType: selectedValueType,
                        recommender: null,
                        groupName: null,
                        memo: memoController.text,
                        irUrl: null,
                        fundIdDocumentUrl: null,
                        ruleUrl: null,
                        etcUrl: null,
                        isFunding: false,
                        bankName: bankNameController.text,
                        accountNumber: accountNumberController.text,
                      ));
                      Get.to(const ManageFundScreen());
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomAlertWidget().informationWidget(
                                context,
                                "${fundNameController.text}이(가) 생성되었습니다.",
                                null);
                          });
                    }),
        )
      ],
    );
  }
}
