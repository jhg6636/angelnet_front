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
  var _nameController = TextEditingController();
  var _createDateController = TextEditingController();
  var _startupNameController = TextEditingController();
  var _mainProductController = TextEditingController();
  var _typeController = TextEditingController();
  var _payDateController = TextEditingController();
  var _managerController = TextEditingController();
  var _totalCostController = TextEditingController();
  var _totalMemberController = TextEditingController();
  var _valueController = TextEditingController();
  var _costPerShareController = TextEditingController();
  var _minimumShareController = TextEditingController();
  var _totalShareController = TextEditingController();
  var _dissolvedDateController = TextEditingController();
  var _marginController = TextEditingController();
  var _memoController = TextEditingController(); // todo html로 대체
  // 회사 소개 file Picker
  // 고유 번호증 file Picker
  // 조합 규약 file Picker
  // 첨부파일 file Picker

  @override
  Widget build(BuildContext context) {
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
            controller: _nameController,
            decoration: const InputDecoration(labelText: "조합명"),
          ),
          TextField(
            controller: _createDateController,
            decoration: const InputDecoration(labelText: "조합결성일 (YYYY-MM-DD)"),
          ),
          TextField(
            controller: _startupNameController,
            decoration: const InputDecoration(labelText: "투자종목"),
          ),
          TextField(
            controller: _mainProductController,
            decoration: const InputDecoration(labelText: "주요제품"),
          ),
          TextField(
            controller: _typeController,
            decoration: const InputDecoration(labelText: "투자형태"),
          ),
          TextField(
            controller: _payDateController,
            decoration: const InputDecoration(labelText: "조합입금일 (YYYY-MM-DD)"),
          ),
          TextField(
            controller: _managerController,
            decoration: const InputDecoration(labelText: "담당자"),
          ),
          TextField(
            controller: _totalCostController,
            decoration: const InputDecoration(labelText: "결성금액"),
          ),
          TextField(
            controller: _totalMemberController,
            decoration: const InputDecoration(labelText: "인원설정"),
          ),
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(labelText: "투자밸류"),
          ),
          TextField(
            // todo 콤마 자동으로 찍히게
            controller: _costPerShareController,
            decoration: const InputDecoration(labelText: "1좌당 금액"),
          ),
          TextField(
            controller: _minimumShareController,
            decoration: const InputDecoration(labelText: "최소참여금액"),
          ),
          TextField(
            controller: _totalShareController,
            decoration: const InputDecoration(labelText: "최대좌수설정"),
          ),
          TextField(
            controller: _memoController,
            decoration: const InputDecoration(labelText: "메모"),
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
                onPressed: () {
                  // todo MakeFund
                  // makeFund(Fund());
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
