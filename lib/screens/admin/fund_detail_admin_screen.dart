import 'package:angelnet/widgets/admin/edit_fund_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/fund/fund.dart';
import '../../models/fund/fund_status.dart';
import '../../utils/StringUtils.dart';
import '../../utils/WidgetUtils.dart';
import '../../utils/custom_border_clipper.dart';
import '../screen_frame_v2.dart';

class FundDetailAdminScreen extends StatefulWidget {
  final Fund fund;

  const FundDetailAdminScreen({super.key, required this.fund});

  @override
  State<StatefulWidget> createState() => FundDetailAdminScreenState();
}

class FundDetailAdminScreenState extends State<FundDetailAdminScreen> {
  var selectedStatus = "조합검토기간";
  final statuses = FundStatus.values.map((status) => status.korean).toList();
  var selectedMenu = "기본정보";
  static const bigNumberTextStyle = TextStyle(
      fontFamily: StringUtils.pretendard,
      fontWeight: FontWeight.bold,
      fontSize: 38,
      letterSpacing: -0.38,
      color: Color(0xff0361f9));

  var showOnPortfolio = true;

  // late bool isFunding = widget.fund.isFunding;

  @override
  Widget build(BuildContext context) {
    selectedStatus = widget.fund.status.korean;
    return ScreenFrameV2(
        main: Container(
          padding: const EdgeInsets.symmetric(horizontal: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "조합현황",
                style: WidgetUtils.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 65),
                padding: const EdgeInsets.fromLTRB(60, 46, 60, 44),
                decoration: BoxDecoration(
                    color: const Color(0xffeef6fd),
                    border: Border.all(color: const Color(0xffc3d9ff)),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 37,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                      padding: const EdgeInsets.fromLTRB(18, 0, 8, 0),
                      decoration: BoxDecoration(
                          color: const Color(0xff0361f9),
                          borderRadius: BorderRadius.circular(19)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: StringUtils.pretendard,
                          color: Colors.white,
                        ),
                        value: selectedStatus,
                        items: statuses
                            .map<DropdownMenuItem<String>>((value) =>
                                DropdownMenuItem(
                                    value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? value) => setState(() {
                          selectedStatus = value ?? "조합검토기간";
                        }),
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                        dropdownColor: const Color(0xff0361f9),
                      )),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.fund.name,
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: StringUtils.pretendard,
                                  color: Color(0xff111111)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "포트폴리오 노출",
                                  style: TextStyle(
                                      fontFamily: StringUtils.pretendard,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Color(0xff111111)),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                CupertinoSwitch(
                                  // todo 사이즈 조절
                                  value: showOnPortfolio,
                                  onChanged: (value) {
                                    setState(() {
                                      showOnPortfolio = value;
                                    });
                                  },
                                  activeColor: const Color(0xff293655),
                                  trackColor: const Color(0xffbfbfbf),
                                )
                              ],
                            )
                          ],
                        )),
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 60),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 106,
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 30, 30, 31),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 41.23,
                                        height: 41.23,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10.77, 0),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/funding_fund_detail_image_1.png'),
                                                fit: BoxFit.contain)),
                                      ),
                                      const Text(
                                        "참여 가능 인원 수",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: StringUtils.pretendard,
                                            color: Color(0xff333333),
                                            letterSpacing: -0.17),
                                      )
                                    ],
                                  ),
                                  Text(widget.fund.totalMember.toString(),
                                      style: bigNumberTextStyle)
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 106,
                              margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 30, 30, 31),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 36.17,
                                        height: 43.96,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10.77, 0),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/funding_fund_detail_image_2.png'),
                                                fit: BoxFit.contain)),
                                      ),
                                      const Text(
                                        "참여 좌수",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: StringUtils.pretendard,
                                            color: Color(0xff333333),
                                            letterSpacing: -0.17),
                                      )
                                    ],
                                  ),
                                  Text(
                                      (widget.fund.currentFundedCost /
                                              widget.fund.costPerShare)
                                          .toString(),
                                      style: bigNumberTextStyle)
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 106,
                              // margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              padding:
                                  const EdgeInsets.fromLTRB(40, 30, 30, 31),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 42.38,
                                        height: 36.88,
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10.77, 0),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'lib/assets/images/funding_fund_detail_image_3.png'),
                                                fit: BoxFit.contain)),
                                      ),
                                      const Text(
                                        "남은좌수",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: StringUtils.pretendard,
                                            color: Color(0xff333333),
                                            letterSpacing: -0.17),
                                      )
                                    ],
                                  ),
                                  Text(
                                      (widget.fund.totalShare -
                                              (widget.fund.currentFundedCost /
                                                  widget.fund.costPerShare))
                                          .toString(),
                                      style: bigNumberTextStyle)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedMenu = '기본정보';
                          });
                        },
                        child: (selectedMenu == '기본정보')
                            ? ClipPath(
                                clipper: CustomBorderClipper(),
                                child: Container(
                                    height: 62,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          left: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          right: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                        )),
                                    child: const Center(
                                      child: Text(
                                        "기본정보",
                                        style: TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff1173f9),
                                            letterSpacing: -0.17),
                                      ),
                                    )))
                            : Container(
                                height: 62,
                                decoration: const BoxDecoration(
                                    color: Color(0xfff9f9f9),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff1173f9),
                                            width: 2))),
                                child: const Center(
                                  child: Text("기본정보",
                                      style: TextStyle(
                                          fontFamily: StringUtils.pretendard,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff282728),
                                          letterSpacing: -0.17)),
                                )),
                      )),
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedMenu = '조합 공지사항';
                          });
                        },
                        child: (selectedMenu == '조합 공지사항')
                            ? ClipPath(
                                clipper: CustomBorderClipper(),
                                child: Container(
                                    height: 62,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          left: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          right: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                        )),
                                    child: const Center(
                                      child: Text(
                                        "조합 공지사항",
                                        style: TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff1173f9),
                                            letterSpacing: -0.17),
                                      ),
                                    )))
                            : Container(
                                height: 62,
                                decoration: const BoxDecoration(
                                    color: Color(0xfff9f9f9),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff1173f9),
                                            width: 2))),
                                child: const Center(
                                  child: Text(
                                    "조합 공지사항",
                                    style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff282728),
                                        letterSpacing: -0.17),
                                  ),
                                )
                        ),
                      )
                  ),
                  // Flexible(
                  //     flex: 1,
                  //     child: InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedMenu = '진행정보 관리';
                  //         });
                  //       },
                  //       child: (selectedMenu == '진행정보 관리')? ClipPath(
                  //           clipper: CustomBorderClipper(),
                  //           child: Container(
                  //               height: 62,
                  //               decoration: const BoxDecoration(
                  //                   color: Colors.white,
                  //                   border: Border(
                  //                     top: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                     left: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                     right: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                   )
                  //               ),
                  //               child: const Center(
                  //                 child: Text("진행정보 관리",
                  //                   style: TextStyle(
                  //                       fontFamily: StringUtils.pretendard,
                  //                       fontSize: 17,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Color(0xff1173f9),
                  //                       letterSpacing: -0.17
                  //                   ),
                  //                 ),
                  //               )
                  //           )
                  //       ) :
                  //       Container(
                  //           height: 62,
                  //           decoration: const BoxDecoration(
                  //               color: Color(0xfff9f9f9),
                  //               border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                  //           ),
                  //           child: const Center(
                  //             child: Text("진행정보 관리",
                  //               style: TextStyle(
                  //                   fontFamily: StringUtils.pretendard,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Color(0xff282728),
                  //                   letterSpacing: -0.17
                  //               ),
                  //             ),
                  //           )
                  //       ),
                  //     )
                  // ),
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedMenu = '조합원 관리';
                          });
                        },
                        child: (selectedMenu == '조합원 관리')
                            ? ClipPath(
                                clipper: CustomBorderClipper(),
                                child: Container(
                                    height: 62,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                          top: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          left: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                          right: BorderSide(
                                              color: Color(0xff1173f9),
                                              width: 2),
                                        )),
                                    child: const Center(
                                      child: Text(
                                        "조합원 관리",
                                        style: TextStyle(
                                            fontFamily: StringUtils.pretendard,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff1173f9),
                                            letterSpacing: -0.17),
                                      ),
                                    )
                                )
                            )
                            : Container(
                                height: 62,
                                decoration: const BoxDecoration(
                                    color: Color(0xfff9f9f9),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xff1173f9),
                                            width: 2))),
                                child: const Center(
                                  child: Text(
                                    "조합원 관리",
                                    style: TextStyle(
                                        fontFamily: StringUtils.pretendard,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff282728),
                                        letterSpacing: -0.17),
                                  ),
                                )),
                      )),
                  // Flexible(
                  //     flex: 1,
                  //     child: InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           selectedMenu = '조합해산 관리';
                  //         });
                  //       },
                  //       child: (selectedMenu == '조합해산 관리')? ClipPath(
                  //           clipper: CustomBorderClipper(),
                  //           child: Container(
                  //               height: 62,
                  //               decoration: const BoxDecoration(
                  //                   color: Colors.white,
                  //                   border: Border(
                  //                     top: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                     left: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                     right: BorderSide(color: Color(0xff1173f9), width: 2),
                  //                   )
                  //               ),
                  //               child: const Center(
                  //                 child: Text("조합해산 관리",
                  //                   style: TextStyle(
                  //                       fontFamily: StringUtils.pretendard,
                  //                       fontSize: 17,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Color(0xff1173f9),
                  //                       letterSpacing: -0.17
                  //                   ),
                  //                 ),
                  //               )
                  //           )
                  //       ) :
                  //       Container(
                  //           height: 62,
                  //           decoration: const BoxDecoration(
                  //               color: Color(0xfff9f9f9),
                  //               border: Border(bottom: BorderSide(color: Color(0xff1173f9), width: 2))
                  //           ),
                  //           child: const Center(
                  //             child: Text("조합해산 관리",
                  //               style: TextStyle(
                  //                   fontFamily: StringUtils.pretendard,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Color(0xff282728),
                  //                   letterSpacing: -0.17
                  //               ),
                  //             ),
                  //           )
                  //       ),
                  //     )
                  // ),
                ],
              ),
              if (selectedMenu == '기본정보')
                Container(
                  // Container(
                  margin: const EdgeInsets.fromLTRB(0, 33, 0, 0),
                  child: EditFundWidget(fund: widget.fund, status: FundStatus.fromKorean(selectedStatus)),
                )
            ],
          ),
        ),
        isAdmin: true,
        crumbs: ["조합현황"]);
    // return ScreenFrame(
    //     main: SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(widget.fund.name, style: WidgetUtils.titleStyle),
    //           Wrap(
    //             children: [
    //               const Text("조합원 모집 상태"),
    //               Switch(value: isFunding, onChanged: (value) async {
    //                 await changeIsFunding(widget.fund, value);
    //                 setState(() {
    //                   isFunding = value;
    //                 });
    //               })
    //             ],
    //           ),
    //           const Text("기본 정보", style: WidgetUtils.h1Deprecated),
    //           widget.fund.toBasicTable(),
    //           FilledButton(
    //             onPressed: () {
    //               showModalBottomSheet(context: context, builder: (BuildContext context) {
    //                 return FundForm(isMaking: false, fund: widget.fund);
    //               });
    //               setState(() {});
    //             },
    //             child: const Text("정보 수정하기")
    //           ),
    //           const Text("조합 참여자", style: WidgetUtils.h1Deprecated),
    //           FutureBuilder(
    //             future: fetchLpInFund(widget.fund.id),
    //             builder: (BuildContext context, AsyncSnapshot<List<LimitedPartner>> snapshot) {
    //               if (snapshot.hasError) {
    //                 print(snapshot.error);
    //                 print(snapshot.stackTrace);
    //                 return WidgetUtils.errorPadding;
    //               } else if (snapshot.hasData == false) {
    //                 return const CircularProgressIndicator();
    //               } else {
    //                 int index = snapshot.data?.length ?? 0;
    //                 return WidgetUtils().wrapAsDualScrollWidget(
    //                     DataTable(
    //                         columns: const [
    //                           DataColumn(label: Text("번호")),
    //                           DataColumn(label: Text("아이디")),
    //                           DataColumn(label: Text("이름")),
    //                           DataColumn(label: Text("연락처")),
    //                           DataColumn(label: Text("참여 금액")),
    //                           DataColumn(label: Text("참여 좌수")),
    //                           DataColumn(label: Text("출자증서")),
    //                           DataColumn(label: Text("소득공제")),
    //                           DataColumn(label: Text("입금일자")),
    //                           DataColumn(label: Text("삭제"))
    //                         ],
    //                         rows: (snapshot.data ?? List.empty()).map<DataRow>((lp) => lp.toDataRow(index--)).toList()
    //                     )
    //                 );
    //               }
    //             }
    //           )
    //         ],
    //       ),
    //     ),
    //     isAdmin: true
    // );
  }
}
