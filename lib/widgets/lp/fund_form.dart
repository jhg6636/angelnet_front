import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';

import '../../models/lp/fund.dart';

class FundForm extends StatefulWidget {
  final bool isMaking;
  final Fund? fund;

  const FundForm({super.key, required this.isMaking, required this.fund});

  @override
  State<StatefulWidget> createState() => FundFormState();
}

// todo 이런거 길어지면 1-2-3-4단계로 바꿀까? (토스처럼)
class FundFormState extends State<FundForm> {
  final _fundStateList = [
    "검토요청",
    "조합검토기간",
    "참여신청",
    "서류접수 및 입금확인",
    "중소벤처기업부 등록승인",
    "주금납입",
    "완료(출자증서 발급)"
  ];
  var selectedFundState = '상태 표시';

  final _joiningStateList = ["ING", "DONE"];
  // 회사 소개 file Picker
  // 고유 번호증 file Picker
  // 조합 규약 file Picker
  // 첨부파일 file Picker

  @override
  Widget build(BuildContext context) {
    final recommenderController = TextEditingController(text: widget.fund?.recommender);
    final groupNameController = TextEditingController(text: widget.fund?.groupName);
    final nameController = TextEditingController(text: widget.fund?.name);
    final createDateController = TextEditingController(text: widget.fund?.startAt.toString());
    final startupNameController = TextEditingController(text: widget.fund?.startupName);
    final mainProductController = TextEditingController(text: widget.fund?.mainProduct);
    final typeController = TextEditingController(text: widget.fund?.type);
    final payDateController = TextEditingController(text: widget.fund?.payAt.toString());
    final managerController = TextEditingController(text: widget.fund?.managerName);
    final totalCostController = TextEditingController(text: widget.fund?.cost.toString());
    final totalMemberController = TextEditingController(text: widget.fund?.totalMember.toString());
    final valueController = TextEditingController(text: widget.fund?.value.toString());
    final costPerShareController = TextEditingController(text: widget.fund?.costPerShare.toString());
    final minimumShareController = TextEditingController(text: widget.fund?.minimumShare.toString());
    final totalShareController = TextEditingController(text: widget.fund?.totalShare.toString());
    final dissolvedDateController = TextEditingController();
    final marginController = TextEditingController();
    final memoController = TextEditingController(); // todo html로 대체
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            children: [
              const Text("조합 상태"),
              DropdownButton(
                  items: _fundStateList
                      .map<DropdownMenuItem>(
                          (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value)
                      )
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFundState = value;
                    });
                  }),
            ],
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: recommenderController,
            decoration: const InputDecoration(
                labelText: "추천인",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: groupNameController,
            decoration: const InputDecoration(
                labelText: "그룹명",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: "조합명",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: createDateController,
            decoration: const InputDecoration(
                labelText: "조합결성일 (YYYY-MM-DD)",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: startupNameController,
            decoration: const InputDecoration(
                labelText: "투자종목",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: mainProductController,
            decoration: const InputDecoration(
                labelText: "주요제품",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: typeController,
            decoration: const InputDecoration(
                labelText: "투자형태",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: payDateController,
            decoration: const InputDecoration(
                labelText: "조합입금일 (YYYY-MM-DD)",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: managerController,
            decoration: const InputDecoration(
                labelText: "담당자",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: totalCostController,
            decoration: const InputDecoration(
                labelText: "결성금액",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: totalMemberController,
            decoration: const InputDecoration(
                labelText: "인원설정",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
                labelText: "투자밸류",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            // todo 콤마 자동으로 찍히게
            controller: costPerShareController,
            decoration: const InputDecoration(
                labelText: "1좌당 금액",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: minimumShareController,
            decoration: const InputDecoration(
                labelText: "최소참여금액",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: totalShareController,
            decoration: const InputDecoration(
                labelText: "최대좌수설정",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          TextField(
            controller: memoController,
            decoration: const InputDecoration(
                labelText: "메모",
                border: OutlineInputBorder()
            ),
          ),
          const Padding(padding: WidgetUtils.smallPadding,),
          // todo FilePickers
          Wrap(
            children: [
              const Text("회사 소개서"),
              FilledButton(
                onPressed: () {

                },
                child: const Text("업로드")
              )
            ],
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("취소하기")
              ),
              FilledButton(
                onPressed: () async {
                  // todo MakeFund
                  await makeFund(
                    Fund(
                      id: -1,
                      name: nameController.text,
                      startupName: startupNameController.text,
                      mainProduct: mainProductController.text,
                      managerName: managerController.text,
                      startAt: DateTime.parse(createDateController.text),
                      type: typeController.text,
                      dissolvedAt: null,
                      margin: null,
                      cost: totalCostController.text as int,
                      costPerShare: costPerShareController.text as int,
                      currentFundedCost: 0,
                      currentMemberCount: 0,
                      minimumShare: minimumShareController.text as int,
                      totalShare: totalShareController.text as int,
                      totalMember: totalMemberController.text as int,
                      status: selectedFundState,
                      payAt: DateTime.parse(payDateController.text),
                      value: valueController.text as int,
                      recommender: recommenderController.text,
                      groupName: groupNameController.text,
                      memo: "",
                      irUrl: null,
                      fundIdDocumentUrl: null,
                      ruleUrl: null,
                      etcUrl: null
                    )
                  );
                  Navigator.pop(context);
                },
                child: const Text("생성하기")
              )
            ],
          )
        ],
      ),
    );
  }
}
