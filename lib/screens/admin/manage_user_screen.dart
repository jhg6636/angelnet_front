import 'package:backoffice_front/models/admin/user.dart';
import 'package:backoffice_front/screens/admin/make_user_form.dart';
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

  final _stringIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _workplaceController = TextEditingController();
  final _recommenderController = TextEditingController();

  final List<String> _userLevelFilterOptions = ['LP', 'STARTUP', 'ADMIN'];
  final List<String> _selectedUserLevels = [];

  @override
  Widget build(BuildContext context) {
    var users = fetchUsers();
    return ScreenFrame(
        main: Column(
          children: [
            const SizedBox(height: 36.0),
            const Text(
              "회원 관리",
              style: WidgetUtils.titleStyle,
            ),
            const SizedBox(height: 36.0),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _stringIdController,
                      decoration: const InputDecoration(
                        labelText: "아이디",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "이름",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _workplaceController,
                      decoration: const InputDecoration(
                        labelText: "근무처",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350.0,
                    child: TextField(
                      controller: _recommenderController,
                      decoration: const InputDecoration(
                        labelText: "추천인",
                        border: OutlineInputBorder(),
                      ),
                    )
                  )
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("권한 (복수 선택 가능)")
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                    children: _userLevelFilterOptions.map((option) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: FilterChip(
                              label: Text(option),
                              selected: _selectedUserLevels.contains(option),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedUserLevels.add(option);
                                  } else {
                                    _selectedUserLevels.remove(option);
                                  }
                                });
                              }
                          )
                      );
                    }).toList()
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.search),
                    label: const Text("검색"),
                ),
                FilledButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const SizedBox(
                          height: 1000.0,
                          child: MakeUserForm(isPopup: true,)
                        );
                      }
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("신규 회원 추가"),
                ),
              ],
            ),
            FutureBuilder<List<User>>(
                future: users,
                builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.stackTrace);
                    return WidgetUtils.errorPadding;
                  } else if (snapshot.hasData == false) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                        children: [
                          adminUserTable(snapshot.data ?? List.empty()),
                          OutlinedButton(
                              onPressed: () {},
                              child: const Text("회원 생성")
                          )
                        ]
                    );
                  }
                }
            ),
          ],
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