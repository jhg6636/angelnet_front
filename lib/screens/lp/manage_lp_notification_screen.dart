import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/admin/notice.dart';
import '../../utils/WidgetUtils.dart';
import '../screen_frame.dart';

class ManageLpNotificationScreen extends StatefulWidget {
  const ManageLpNotificationScreen({super.key});

  @override
  State<ManageLpNotificationScreen> createState() => _ManageLpNotificationScreenState();
}

class _ManageLpNotificationScreenState extends State<ManageLpNotificationScreen> {
  Future<List<Notice>> notifications = fetchNotification('gggg');
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
                              return GestureDetector (
                                onTap: () async{
                                  if (notice.checkAt == null){
                                    try{
                                      print('들어감');
                                      var response = await checkNoticeApi(notice.id);
                                      if (response.statusCode != 200){
                                        print(jsonDecode(utf8.decode(response.bodyBytes)));
                                      }
                                    }catch(e){
                                      print("Error: $e");
                                    }
                                  }
                                },
                                child: Card(
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
                                            Text(notice.id)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            check
                                          ],),
                                      ],
                                    ),
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
        isAdmin: false);

  }
}
