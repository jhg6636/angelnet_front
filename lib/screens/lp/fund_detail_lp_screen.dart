import 'dart:convert';

import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../models/fund/fund.dart';

class FundDetailLpScreen extends StatefulWidget {

  final Fund fund;

  const FundDetailLpScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundDetailLpScreenState();

}

class FundDetailLpScreenState extends State<FundDetailLpScreen> {

  var cost = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.fund.name, style: WidgetUtils.titleStyle),
            widget.fund.toBasicTable(),
            if (widget.fund.irUrl != null) const Text("IR 자료", style: WidgetUtils.h1,),
            if (widget.fund.fundIdDocumentUrl != null) const Text("고유 번호증", style: WidgetUtils.h1),
            const Text("투자 위험 고지", style: WidgetUtils.h1),
            const Text("1) 개인투자조합은 비상장기업에 대한 투자로 수익률을 보장하지 않으며, 투자기업의 실적 악화 / 파산 등의 이유로 원금의 일부 또는 전부를 잃을 수 있습니다.\n2) 조합 출자 후 만기 전에 (조기 해산되는 경우 제외) 어떠한 경우에도 현금으로 전환, 상환되지 않습니다.\n3) 조세특례제한법 제16조에 따르면 개인투자조합에 청약 후 3년 이내 해산 시 공제받은 소득금액이 추징 될 수 있습니다.\n(조세특례제한법 제16조_소득공제를 적용 받은 거주자가 출자일 또는 투자일부터 3년이 지나기 전에 다음 각 호의 어느 하나에 해당하게 되면 그 거주자의 관할 세무서장 또는 원천징수의무자는 대통령령으로 정하는 바에 따라 거주자가 이미 공제받은 소득금액에 해당하는 세액을 추징한다)"),
            FilledButton.icon(
              onPressed: () {
                final stockCountController = TextEditingController();
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return JoinFundModal(
                      stockCountController: stockCountController,
                      fund: widget.fund,
                    );
                  }
                );
              },
              icon: const Icon(Icons.check),
              label: const Text("조합 참여"),
            )
          ],
        )
      ),
      isAdmin: false
    );
  }

}

class JoinFundModal extends StatefulWidget {

  final TextEditingController stockCountController;
  final Fund fund;

  const JoinFundModal({super.key, required this.stockCountController, required this.fund});

  @override
  State<StatefulWidget> createState() => JoinFundModalState();

}

class JoinFundModalState extends State<JoinFundModal> {

  int cost = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            const Text("참여 좌수"),
            TextField(
              controller: widget.stockCountController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (text) {
                setState(() {
                  cost = (int.parse(widget.stockCountController.text)) * widget.fund.costPerShare;
                });
              },
            ),
            const Text("참여 금액"),
            Text("$cost"),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var response = await joinFund(widget.fund.id, int.parse(widget.stockCountController.text));
                    if (response.statusCode == 200) {
                      Fluttertoast.showToast(msg: "조합에 참여하셨습니다. 마이페이지에서 확인해 보세요.");
                    } else {
                      print(jsonDecode(utf8.decode(response.bodyBytes))['message']);
                      Fluttertoast.showToast(msg: jsonDecode(utf8.decode(response.bodyBytes))['message'], timeInSecForIosWeb: 10);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("참여하기")
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("돌아가기")
                )
              ],
            )
          ],
        )
    );
  }

}