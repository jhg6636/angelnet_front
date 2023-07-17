import 'package:backoffice_front/widgets/bulletin/post_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/bulletin/bulletin.dart';
import '../../utils/WidgetUtils.dart';
import '../screen_frame.dart';

class ManageBulletinScreen extends StatefulWidget {

  const ManageBulletinScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageBulletinScreenState();

}

class ManageBulletinScreenState extends State<ManageBulletinScreen> {

  @override
  Widget build(BuildContext context) {
    Future<List<Bulletin>> bulletins = fetchAllBulletins();
    return ScreenFrame(
        main: SingleChildScrollView(
          child: Column(
            children: [
              const Text("게시판 목록"),
              FutureBuilder(
                  future: bulletins,
                  builder: (BuildContext context, AsyncSnapshot<List<Bulletin>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      print(snapshot.stackTrace);
                      return WidgetUtils.errorPadding;
                    } else if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text("번호")),
                        DataColumn(label: Text("게시판")),
                        DataColumn(label: Text("게시글 수")),
                      ],
                      rows: snapshot.data!.map<DataRow>((bulletin) => bulletin.toDataRow()).toList(),
                    );
                  }
              ),
              FilledButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final bulletinNameController = TextEditingController();
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: bulletinNameController,
                              decoration: const InputDecoration(
                                labelText: "게시판명",
                                border: OutlineInputBorder()
                              ),
                            ),
                            ButtonBar(
                              // todo ButtonBar 추상화
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("취소하기")
                                ),
                                FilledButton(
                                    onPressed: () async {
                                      var response = await makeBulletin(bulletinNameController.text);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("생성하기")
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  );
                },
                child: const Text("생성하기")
              )
            ],
          ),
        ),
        isAdmin: true
    );
  }

}