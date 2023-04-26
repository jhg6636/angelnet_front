import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:backoffice_front/widgets/admin/make_user_form.dart';
import 'package:flutter/cupertino.dart';

class EditUserInfoScreen extends StatelessWidget {

  final String? stringId;

  const EditUserInfoScreen({super.key, required this.stringId});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: MakeUserForm(isPopup: false, isEditing: true, stringId: stringId),
        isAdmin: false,
    );
  }

}