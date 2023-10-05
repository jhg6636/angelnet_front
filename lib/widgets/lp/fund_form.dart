import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/edit_fund_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../models/fund/fund.dart';
import '../../models/fund/fund_status.dart';
import '../../models/fund/fund_type.dart';

class MakeFundScreen extends StatefulWidget {

  const MakeFundScreen({super.key});

  @override
  State<StatefulWidget> createState() => MakeFundScreenState();
}

// todo 이런거 길어지면 1-2-3-4단계로 바꿀까? (토스처럼)
class MakeFundScreenState extends State<MakeFundScreen> {
  // final _fundTypeList = FundType.values.map((value) => value.korean);
  // late var selectedFundType = _fundTypeList.first;

  // late final recommenderController = TextEditingController();
  // late final groupNameController = TextEditingController();
  // late final nameController = TextEditingController();
  // late final createDateController = TextEditingController();
  // late final startupNameController = TextEditingController();
  // late final mainProductController = TextEditingController();
  // late final payDateController = TextEditingController();
  // late final managerController = TextEditingController();
  // late final totalCostController = TextEditingController();
  // late final totalMemberController = TextEditingController();
  // late final valueController = TextEditingController();
  // late final costPerShareController = TextEditingController();
  // late final minimumShareController = TextEditingController();
  // late final totalShareController = TextEditingController();
  // late final dissolvedDateController = TextEditingController();
  // late final marginController = TextEditingController();
  // late final memoController = TextEditingController(); // todo html로 대체

  // 회사 소개 file Picker
  // 고유 번호증 file Picker
  // 조합 규약 file Picker
  // 첨부파일 file Picker

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("신규 조합 생성", style: WidgetUtils.titleStyle,),
            Container(
              // Container(
              margin: const EdgeInsets.fromLTRB(0, 33, 0, 0),
              child: const FundFormWidget(fund: null, status: FundStatus.reviewing),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["조합현황", "신규 조합 생성"]
    );
    // selectedFundState = _fundStateList.first;
    // selectedFundType = _fundTypeList.first;
    // return SingleChildScrollView(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Wrap(
    //         children: [
    //           const Text("조합 상태"),
    //           DropdownButton(
    //               items: _fundStateList
    //                   .map<DropdownMenuItem>(
    //                       (value) => DropdownMenuItem(
    //                       value: value,
    //                       child: Text(value.korean)
    //                   )
    //               )
    //                   .toList(),
    //               onChanged: (value) {
    //                 setState(() {
    //                   selectedFundState = value;
    //                 });
    //               },
    //               value: selectedFundState,
    //           ),
    //         ],
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: nameController,
    //         decoration: const InputDecoration(
    //             labelText: "조합명",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: createDateController,
    //         decoration: const InputDecoration(
    //             labelText: "조합결성일 (YYYY-MM-DD)",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: startupNameController,
    //         decoration: const InputDecoration(
    //             labelText: "투자종목",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: mainProductController,
    //         decoration: const InputDecoration(
    //             labelText: "주요제품",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       Wrap(
    //         children: [
    //           const Text("투자 형태"),
    //           DropdownButton(
    //             items: _fundTypeList
    //                 .map<DropdownMenuItem>(
    //                     (value) => DropdownMenuItem(
    //                     value: value,
    //                     child: Text(value.korean)
    //                 )
    //             ).toList(),
    //             onChanged: (value) {
    //               setState(() {
    //                 print(value);
    //                 selectedFundType = value;
    //               });
    //             },
    //             value: selectedFundType,
    //           ),
    //         ],
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: payDateController,
    //         decoration: const InputDecoration(
    //             labelText: "조합입금일 (YYYY-MM-DD)",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: managerController,
    //         decoration: const InputDecoration(
    //             labelText: "담당자",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: totalCostController,
    //         decoration: const InputDecoration(
    //             labelText: "결성금액",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: totalMemberController,
    //         decoration: const InputDecoration(
    //             labelText: "인원설정",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: valueController,
    //         decoration: const InputDecoration(
    //             labelText: "투자밸류",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         // todo 콤마 자동으로 찍히게
    //         controller: costPerShareController,
    //         decoration: const InputDecoration(
    //             labelText: "1좌당 금액",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: minimumShareController,
    //         decoration: const InputDecoration(
    //             labelText: "최소참여금액",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: totalShareController,
    //         decoration: const InputDecoration(
    //             labelText: "최대좌수설정",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: memoController,
    //         decoration: const InputDecoration(
    //             labelText: "메모",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: recommenderController,
    //         decoration: const InputDecoration(
    //             labelText: "추천인",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       const Padding(padding: WidgetUtils.smallPadding,),
    //       TextField(
    //         controller: groupNameController,
    //         decoration: const InputDecoration(
    //             labelText: "그룹명",
    //             border: OutlineInputBorder()
    //         ),
    //       ),
    //       // todo FilePickers
    //       Wrap(
    //         children: [
    //           const Text("회사 소개서"),
    //           FilledButton(
    //             onPressed: () {
    //
    //             },
    //             child: const Text("업로드")
    //           )
    //         ],
    //       ),
    //       Wrap(
    //         children: [
    //           const Text("회사 소개서"),
    //           FilledButton(
    //               onPressed: () {
    //
    //               },
    //               child: const Text("업로드")
    //           )
    //         ],
    //       ),
    //       Wrap(
    //         children: [
    //           const Text("조합 등록증"),
    //           FilledButton(
    //               onPressed: () {
    //
    //               },
    //               child: const Text("업로드")
    //           )
    //         ],
    //       ),
    //       Wrap(
    //         children: [
    //           const Text("규정"),
    //           FilledButton(
    //               onPressed: () {
    //
    //               },
    //               child: const Text("업로드")
    //           )
    //         ],
    //       ),
    //       Wrap(
    //         children: [
    //           const Text("기타"),
    //           FilledButton(
    //               onPressed: () {
    //
    //               },
    //               child: const Text("업로드")
    //           )
    //         ],
    //       ),
    //       ButtonBar(
    //         children: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: const Text("취소하기")
    //           ),
    //           FilledButton(
    //             onPressed: () async {
    //               Fund fund = Fund(
    //                   id: widget.fund?.id ?? -1,
    //                   name: nameController.text,
    //                   startupName: startupNameController.text,
    //                   mainProduct: mainProductController.text,
    //                   managerName: managerController.text,
    //                   startAt: DateTime.parse(createDateController.text),
    //                   type: selectedFundType,
    //                   dissolvedAt: null,
    //                   margin: null,
    //                   cost: int.parse(totalCostController.text),
    //                   costPerShare: int.parse(costPerShareController.text),
    //                   currentFundedCost: 0,
    //                   currentMemberCount: 0,
    //                   minimumShare: int.parse(minimumShareController.text),
    //                   totalShare: int.parse(totalShareController.text),
    //                   totalMember: int.parse(totalMemberController.text),
    //                   status: selectedFundState,
    //                   payAt: DateTime.parse(payDateController.text),
    //                   value: int.parse(valueController.text),
    //                   recommender: recommenderController.text,
    //                   groupName: groupNameController.text,
    //                   memo: "",
    //                   irUrl: null,
    //                   fundIdDocumentUrl: null,
    //                   ruleUrl: null,
    //                   etcUrl: null,
    //                   isFunding: true,
    //               );
    //               if (widget.isMaking) {
    //                 var response = await makeFund(fund);
    //                 print(response.body);
    //               } else {
    //                 var response = await editFund(fund);
    //                 print(response.body);
    //               }
    //               Navigator.pop(context);
    //               if (widget.isMaking) {
    //                 Fluttertoast.showToast(msg: '조합이 생성되었습니다.');
    //               } else {
    //                 Fluttertoast.showToast(msg: '조합이 수정되었습니다.');
    //               }
    //             },
    //             child: widget.isMaking ? const Text("생성하기") : const Text("수정하기")
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
