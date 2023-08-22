import 'package:backoffice_front/models/admin/notice.dart';
import 'package:backoffice_front/screens/admin/make_notification_form.dart';
import 'package:flutter/material.dart';

import '../../utils/WidgetUtils.dart';
import '../../widgets/admin/make_user_form.dart';
import '../screen_frame.dart';

class ManageNotificationScreen extends StatefulWidget {
  const ManageNotificationScreen({super.key});

  @override
  State<ManageNotificationScreen> createState() =>
      ManageNotificationScreenState();
}

class ManageNotificationScreenState extends State<ManageNotificationScreen> {
  Future<List<Notice>> notifications = fetchNotifications();
  final _notificationTypeList = [
    'DOCUMENT_SUBMISSION_REQUEST',
    'DEPOSIT_CONFIGURATION_REQUEST'
  ];
  String _notificaiotnType = 'DOCUMENT_SUBMISSION_REQUEST';

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 36.0),
              const Text(
                "알림 관리",
                style: WidgetUtils.titleStyle,
              ),
              const SizedBox(height: 36.0),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      // todo 검색 기능
                      setState(() {
                        //검색기능
                      });
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
                                child: MakeNotificationForm(
                                  isPopup: true,
                                  isEditing: false,
                                  user: null,
                                ));
                          });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("알림 보내기"),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        // users = fetchUsers(sort: "LAST_LOGIN");
                      });
                    },
                    child: const Text("최근 로그인 순 정렬"),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        // users = fetchUsers();
                      });
                    },
                    child: const Text("최근 가입 순 정렬"),
                  ),
                  DropdownButton<String>(
                    value: _notificaiotnType,
                    items: _notificationTypeList
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (Object? value) {
                      setState(() {
                        _notificaiotnType = value as String;
                      });
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: FutureBuilder<List<Notice>>(
                    future: notifications,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Notice>> snapshot) {
                      if(snapshot.data==null){
                        snapshot.data?? List.empty();
                      }
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        print(snapshot.stackTrace);
                        return WidgetUtils.errorPadding;
                      } else if (snapshot.hasData == false) {
                        return const CircularProgressIndicator();
                      } else {
                        ScrollController vertical = ScrollController();
                        ScrollController horizontal = ScrollController();
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                            itemBuilder: (context,index){
                          final notice = snapshot.data![index];
                          final check = notice.checkAt!= null ? Text('확인',style: TextStyle(color: Colors.greenAccent),) : Text('확인안함',style: TextStyle(color: Colors.redAccent),);
                          return Card(
                            color: Colors.black12,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text("제목 : ${notice.title}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("내용 : ${notice.content}"),
                                      Text("${notice.type}"),
                                  ],
                                  ),
                                  Column(
                                    children: [
                                    check
                                  ],)
                                ],
                              ),
                            ),
                          );
                        });
                      }
                    }),
              ),
            ],
          ),
        ),
        isAdmin: true);
  }
}

DataTable adminNoticeTable(List<Notice> notices) {
  return DataTable(
    columns: [
      DataColumn(label: Text("받는이")),
      DataColumn(label: Text("종류")),
      DataColumn(label: Text("제목")),
      DataColumn(label: Text("내용")),
      DataColumn(label: Text("보낸시각")),
      DataColumn(label: Text("확인한 시각")),
    ],
    rows: notices.map<DataRow>((notice) => notice.toDataRow()).toList(),
  );
}
