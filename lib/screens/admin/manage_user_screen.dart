import 'package:backoffice_front/models/admin/user.dart';
import 'package:backoffice_front/screens/screen_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageUserScreenState();
}

class ManageUserScreenState extends State<ManageUserScreen> {
  @override
  Widget build(BuildContext context) {
    var users = fetchUsers();
    return ScreenFrame(
        main: FutureBuilder<List<User>>(
            future: users,
            builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                print(snapshot.stackTrace);
                return WidgetUtils.errorPadding;
              } else if (snapshot.hasData == false) {
                return const CircularProgressIndicator();
              } else {
                return adminUserTable(snapshot.data ?? List.empty());
              }
            }
        ),
        isAdmin: true
    );
  }

}

DataTable adminUserTable(List<User> users) {
  return DataTable(
      columns: const [
        DataColumn(label: Text("아이디")),
        DataColumn(label: Text("이름")),
        DataColumn(label: Text("등급")),
        DataColumn(label: Text("근무처")),
        DataColumn(label: Text("연락처")),
        DataColumn(label: Text("이메일")),
        DataColumn(label: Text("추천인")),
        DataColumn(label: Text("가입일")),
      ],
      rows: users.map<DataRow>((user) => user.toDataRow()).toList(),
  );
}
