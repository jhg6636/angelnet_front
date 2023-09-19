import 'package:angelnet/models/bulletin/bulletin.dart';
import 'package:angelnet/models/common/user.dart';
import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

import '../../models/common/post.dart';
import '../../utils/CustomInputFormatters.dart';

class PostEditScreen extends StatefulWidget {

  // final Post? post;
  // final bool isEditing;

  const PostEditScreen({super.key});
  // const PostEditScreen({super.key, required this.isEditing, this.post});

  @override
  State<StatefulWidget> createState() => PostEditScreenState();

}

class PostEditScreenState extends State<PostEditScreen> {

  var isOpened = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController writerController = TextEditingController(text: "관리자");
  final dateController = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  // late TextEditingController titleController = TextEditingController(text: widget.post?.title);
  // late HtmlEditor htmlEditor = HtmlEditor(body: widget.post?.body,);
  // Future<List<Bulletin>> bulletins = fetchAllBulletins();
  // Bulletin? selectedBulletin = null;
  final controller = HtmlEditorController();
  static const headingStyle = TextStyle(
      fontSize: 17,
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      color: Color(0xff333333),
      letterSpacing: -0.17
  );

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        margin: const EdgeInsets.symmetric(horizontal: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("공지사항 관리", style: WidgetUtils.titleStyle,),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 21, 0, 0),
              child: const Divider(thickness: 2, color: Color(0xff555555),),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const Text("*",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4d87ef)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                    child: const Text("제목", style: headingStyle)
                ),
                Flexible(
                  flex: 1080,
                  child: Container(
                    width: 1090,
                    height: 38,
                    margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
                    child: TextField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.15,
                        color: Color(0xff333333),
                      ),
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: StringUtils.pretendard,
                            letterSpacing: -0.15,
                            color: Color(0xff999999),
                          ),
                        hintText: "제목을 입력하세요",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                          borderRadius: BorderRadius.zero
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                            borderRadius: BorderRadius.zero
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                            borderRadius: BorderRadius.zero
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                            borderRadius: BorderRadius.zero
                        ),
                      ),
                    )
                )),
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: const Text("내용", style: headingStyle),
                ),
                Flexible(
                  child: Container(
                    width: 1080,
                    margin: const EdgeInsets.fromLTRB(127, 0, 0, 0),
                    padding: const EdgeInsets.fromLTRB(14, 13, 0, 17),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdddddd))
                    ),
                    child: HtmlEditor(
                      controller: controller,
                      htmlEditorOptions: const HtmlEditorOptions(
                        hint: "내용을 입력하세요"
                      ),
                      htmlToolbarOptions: const HtmlToolbarOptions(
                        toolbarType: ToolbarType.nativeGrid
                      ),
                    ),
                  )
                )
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: const Text("첨부파일", style: headingStyle,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 750,
                      height: 38,
                      margin: const EdgeInsets.fromLTRB(98, 0, 4, 0),
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
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: const Text("작성자", style: headingStyle,),
                ),
                Container(
                  width: 400,
                  height: 38,
                  margin: const EdgeInsets.fromLTRB(112, 0, 0, 0),
                  child: TextField(
                    controller: writerController,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: StringUtils.pretendard,
                      letterSpacing: -0.15,
                      color: Color(0xff333333),
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                          borderRadius: BorderRadius.zero
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                          borderRadius: BorderRadius.zero
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                          borderRadius: BorderRadius.zero
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffdddddd)),
                          borderRadius: BorderRadius.zero
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 0, 94, 0),
                    child: const Text("공개 여부", style: headingStyle,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        activeColor: const Color(0xff505050),
                        splashRadius: 1,
                        value: true,
                        groupValue: isOpened,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              isOpened = true;
                            }
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(6, 0, 20, 0),
                        child: const Text("공개",
                          style: TextStyle(
                              color: Color(0xff555555),
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              fontSize: 17,
                              letterSpacing: -0.17
                          ),
                        ),
                      ),
                      Radio(
                        activeColor: const Color(0xff505050),
                        splashRadius: 1,
                        value: false,
                        groupValue: isOpened,
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              isOpened = false;
                            }
                          });
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: const Text("비공개",
                          style: TextStyle(
                              color: Color(0xff555555),
                              fontWeight: FontWeight.w500,
                              fontFamily: StringUtils.pretendard,
                              fontSize: 17,
                              letterSpacing: -0.17
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xffdddddd),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(19, 10, 115, 0),
                  child: const Text("등록일", style: headingStyle,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      width: 140,
                      height: 38,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.number,
                        controller: dateController,
                        style: const TextStyle(
                          fontFamily: StringUtils.pretendard,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          letterSpacing: -0.15,
                          color: Color(0xff555555)
                        ),
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
                    const Text("* 입력하지 않는 경우 작성시점으로 자동 등록됩니다.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: StringUtils.pretendard,
                        letterSpacing: -0.15,
                        color: Color(0xff555555)
                      ),
                    )
                  ],
                )
              ],
            ),
            const Divider(color: Color(0xffdddddd),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(19, 0, 120, 0),
                    child: const Text("조회수", style: headingStyle),
                  ),
                  const Text("99", style: headingStyle,)
                ],
              ),
            ),
            const Divider(color: Color(0xffaaaaaa)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 31, 0, 0),
              child: WidgetUtils().buttonBar("목록", "저장", () => null, () => null),
            )
          ],
        ),
      ),
      isAdmin: true,
      crumbs: ["공지사항 관리"]
    );
    // print(widget.post?.body);
    // return ScreenFrame(
    //   main: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Wrap(
    //           children: [
    //             ButtonBar(
    //               children: [
    //                 TextButton(
    //                     onPressed: () {
    //                       Get.back();
    //                     },
    //                     child: const Text("취소하기")
    //                 ),
    //                 ElevatedButton(
    //                     onPressed: () async {
    //                       if (widget.isEditing) {
    //
    //                       } else {
    //                         await makePost(selectedBulletin!.id, titleController.text, htmlEditor.controller.document.toPlainText());
    //                         Get.back();
    //                       }
    //                     },
    //                     child: const Text("저장하기")
    //                 )
    //               ],
    //             ),
    //             const Text("게시판 선택"),
    //             FutureBuilder(
    //               future: bulletins,
    //               builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
    //                 if (snapshot.hasError) {
    //                   return WidgetUtils.errorPadding;
    //                 } else if (!snapshot.hasData) {
    //                   return const CircularProgressIndicator();
    //                 } else {
    //                   return DropdownButton(
    //                     value: selectedBulletin,
    //                     items: snapshot.data!.map<DropdownMenuItem>((bulletin) =>
    //                       DropdownMenuItem(
    //                         value: bulletin,
    //                         child: Text(bulletin.name)
    //                       )
    //                     ).toList(),
    //                     onChanged: (value) {
    //                       selectedBulletin = value;
    //                       setState(() {});
    //                     }
    //                   );
    //                 }
    //               }
    //             )
    //           ],
    //         ),
    //         Wrap(
    //           children: [
    //             const Text("제목"),
    //             TextField(controller: titleController,)
    //           ],
    //         ),
    //         Wrap(
    //           alignment: WrapAlignment.spaceBetween,
    //           children: [
    //             const Text("작성자"),
    //             FutureBuilder(
    //               future: getMyInfo(),
    //               builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
    //                 if (snapshot.hasError) {
    //                   return WidgetUtils.errorPadding;
    //                 } else if (!snapshot.hasData) {
    //                   return const CircularProgressIndicator();
    //                 } else {
    //                   return Text(snapshot.data!['name']);
    //                 }
    //               }
    //             )
    //           ],
    //         ),
    //         htmlEditor,
    //       ],
    //     ),
    //   ),
    //   isAdmin: true
    // );
  }

}