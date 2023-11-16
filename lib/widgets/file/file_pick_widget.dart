import 'package:angelnet/models/file/file.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../utils/StringUtils.dart';

class FilePickWidget {
  Widget emptyWidget(String documentName, Function() pickFileAction, Function() removeAction, Function() addAction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(documentName, style: WidgetUtils.headingStyle,),
        Container(
          width: 777,
          margin: const EdgeInsets.fromLTRB(98, 0, 4, 0),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffdddddd)),
              borderRadius: BorderRadius.circular(2)
          ),
          child: const Text("업로드할 파일을 선택해 주세요.", style: WidgetUtils.textInputHintStyle,),
        ),
        FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xff6c6f81),
                foregroundColor: const Color(0xff6c6f81),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                fixedSize: const Size(90, 38)
            ),
            onPressed: pickFileAction,
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
          onTap: addAction,
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
          onTap: removeAction,
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
    );
  }

  Widget withFileWidget(String documentName, File file, Function() pickFileAction, Function() removeAction, Function() addAction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(documentName, style: WidgetUtils.headingStyle,),
        Container(
          width: 777,
          margin: const EdgeInsets.fromLTRB(98, 0, 4, 0),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffdddddd)),
              borderRadius: BorderRadius.circular(2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Remix.file_text_line, size: 24, color: Color(0xff333333),),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                child: Text(file.name, style: WidgetUtils.regularStyle),
              ),
            ],
          ),
        ),
        FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xff6c6f81),
                foregroundColor: const Color(0xff6c6f81),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                fixedSize: const Size(90, 38)
            ),
            onPressed: pickFileAction,
            child: const Text("파일변경",
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
          onTap: addAction,
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
          onTap: removeAction,
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
    );
  }

}