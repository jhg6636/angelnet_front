import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class Editor extends StatelessWidget {

  final _controller = QuillEditorController();

  Editor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ToolBar(controller: _controller),
              Flexible(
                  child: QuillHtmlEditor(
                    controller: _controller,
                    minHeight: 1000.0,
                  )
              )
            ],
          )
        )
    );
  }

}