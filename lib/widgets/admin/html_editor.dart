import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class HtmlEditor extends StatelessWidget {

  final controller = QuillController.basic();
  String? body;

  HtmlEditor({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    controller.document = Document().insert(0, body);
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
              child: QuillEditor.basic(
                controller: controller, readOnly: false,
              )
          )
        ],
      )
    );
  }

}