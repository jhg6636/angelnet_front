import 'package:backoffice_front/widgets/startup/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartupBasicInfo extends StatelessWidget {
  final Startup startup;

  const StartupBasicInfo({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RichText(text: TextSpan(children: [
            const TextSpan(text: "기업명"),
            TextSpan(text: startup.name),
          ])),
          RichText(text: TextSpan(children: [
            const TextSpan(text: "대표자명"),
            TextSpan(text: startup.ceoName),
          ])),
          RichText(text: TextSpan(children: [
            const TextSpan(text: "설립일"),
            TextSpan(text: DateTime.now().toString()),
          ]))
        ],
      ),
    );
  }
  
  
}