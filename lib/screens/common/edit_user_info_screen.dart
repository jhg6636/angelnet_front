import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/WidgetUtils.dart';
import 'package:angelnet/widgets/admin/make_user_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/common/user.dart';

class EditUserInfoScreen extends StatelessWidget {

  final User? user;

  const EditUserInfoScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: MakeUserForm(isPopup: false, isEditing: true, user: user!!,),
        // main: FutureBuilder(
        //   future: getMyInfo(),
        //   builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        //     if (snapshot.hasError) {
        //       return WidgetUtils.errorPadding;
        //     } else if (!snapshot.hasData) {
        //       return const CircularProgressIndicator();
        //     } else {
        //       return MakeUserForm(isPopup: false, isEditing: true, user: User.fromMyInfoJson(snapshot.data!!));
        //     }
        //   },
        // ),
        isAdmin: false,
    );
  }

}