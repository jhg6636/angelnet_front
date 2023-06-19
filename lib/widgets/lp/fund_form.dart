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
    final recommenderOrGroupNameController = TextEditingController(text: widget.fund?.recommenderOrGroupName);
    final nameController = TextEditingController(text: widget.fund?.name);
    final createDateController = TextEditingController(text: widget.fund?.createdAt.toString());
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
        children: [
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
          TextField(
            controller: recommenderOrGroupNameController,
            decoration: const InputDecoration(
                labelText: "추천인 or 그룹명 ()",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: "조합명",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: createDateController,
            decoration: const InputDecoration(
                labelText: "조합결성일 (YYYY-MM-DD)",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: startupNameController,
            decoration: const InputDecoration(
                labelText: "투자종목",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: mainProductController,
            decoration: const InputDecoration(
                labelText: "주요제품",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: typeController,
            decoration: const InputDecoration(
                labelText: "투자형태",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: payDateController,
            decoration: const InputDecoration(
                labelText: "조합입금일 (YYYY-MM-DD)",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: managerController,
            decoration: const InputDecoration(
                labelText: "담당자",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: totalCostController,
            decoration: const InputDecoration(
                labelText: "결성금액",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: totalMemberController,
            decoration: const InputDecoration(
                labelText: "인원설정",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
                labelText: "투자밸류",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            // todo 콤마 자동으로 찍히게
            controller: costPerShareController,
            decoration: const InputDecoration(
                labelText: "1좌당 금액",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: minimumShareController,
            decoration: const InputDecoration(
                labelText: "최소참여금액",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: totalShareController,
            decoration: const InputDecoration(
                labelText: "최대좌수설정",
                border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: memoController,
            decoration: const InputDecoration(
                labelText: "메모",
                border: OutlineInputBorder()
            ),
          ),
          // todo FilePickers
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
                      createdAt: DateTime.parse(createDateController.text),
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
                      recommenderOrGroupName: recommenderOrGroupNameController.text,
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
