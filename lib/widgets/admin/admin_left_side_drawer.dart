import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLeftSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Drawer Header')),
          TextButton(
              onPressed: () {

              },
              child: Text("회원 관리")
          ),
          TextButton(
              onPressed: () {},
              child: Text("조합 관리")
          )
        ],
      )
    );
  }

}