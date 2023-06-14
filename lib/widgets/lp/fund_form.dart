import 'package:flutter/cupertino.dart';

import '../../models/lp/fund.dart';

class FundForm extends StatefulWidget {

  final bool isMaking;
  final Fund? fund;

  const FundForm({super.key, required this.isMaking, required this.fund});

  @override
  State<StatefulWidget> createState() => FundFormState();

}

class FundFormState extends State<FundForm> {

  final _fundStateList = [];
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
    return SingleChildScrollView(child: Text(""));
  }

}