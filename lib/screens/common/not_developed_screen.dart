import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotDevelopedScreen extends StatelessWidget {

  final bool isAdmin;

  const NotDevelopedScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("개발 진행 중....."),
              SizedBox(height: 20.0,),
              CircularProgressIndicator()
            ],
          )
        ),
        isAdmin: isAdmin
    );
  }

}