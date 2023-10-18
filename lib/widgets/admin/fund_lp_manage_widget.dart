import 'package:angelnet/models/fund/fund.dart';
import 'package:angelnet/models/lp/fund_lp.dart';
import 'package:angelnet/screens/admin/add_fund_lp_screen.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

class FundLpManageWidget extends StatefulWidget {

  final Fund fund;

  const FundLpManageWidget({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundLpManageWidgetState();

}

class FundLpManageWidgetState extends State<FundLpManageWidget> {

  @override
  Widget build(BuildContext context) {
    var fundLps = fetchFundLps(widget.fund.id);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("총",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: StringUtils.pretendard,
                  fontSize: 17,
                  letterSpacing: -0.17,
                  color: Color(0xff333333)
                ),
              ),
              const SizedBox(width: 5,),
              FutureBuilder(
                future: fundLps,
                builder: (BuildContext context, AsyncSnapshot<List<FundLp>> snapshot) {
                  const style = TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: -0.17,
                    fontFamily: StringUtils.pretendard,
                    color: Color(0xff333333),
                  );
                  if (snapshot.hasError) {
                    return const Text("0", style: style,);
                  } else if (!snapshot.hasData) {
                    return const Text("0", style: style);
                  } else {
                    return Text(snapshot.data?.length.toString() ?? "0");
                  }
                }
              ),
              const Text("건",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: StringUtils.pretendard,
                    fontSize: 17,
                    letterSpacing: -0.17,
                    color: Color(0xff333333)
                ),
              )
            ],
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Color(0xffcccccc)),
                  ),
                  padding: const EdgeInsets.fromLTRB(28, 10, 27, 10),
                  fixedSize: const Size(127, 36)),
              onPressed: () {
                Get.to(AddFundLpFirstScreen(fund: widget.fund,));
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: const Icon(
                      Remix.user_add_line,
                      size: 16,
                      color: Color(0xff333333),
                    ),
                  ),
                  const Text(
                    "조합원 추가",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.14,
                        color: Color(0xff333333)
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }

}