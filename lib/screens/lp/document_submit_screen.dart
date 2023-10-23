import 'package:angelnet/screens/screen_frame_v2.dart';
import 'package:flutter/cupertino.dart';

class DocumentSubmitScreen extends StatefulWidget {

  final String documentTitle;
  final int documentId;

  const DocumentSubmitScreen({super.key, required this.documentTitle, required this.documentId});

  @override
  State<StatefulWidget> createState() => DocumentSubmitScreenState();

}

class DocumentSubmitScreenState extends State<DocumentSubmitScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenFrameV2(
      main: Container(
        padding: const EdgeInsets.symmetric(horizontal: 320),
      ),
      isAdmin: false,
      crumbs: ["서류제출", widget.documentTitle]
    );
  }

}