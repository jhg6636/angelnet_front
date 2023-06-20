import 'package:backoffice_front/models/bulletin/bulletin.dart';
import 'package:flutter/cupertino.dart';

class BulletinSelector extends StatelessWidget {

  const BulletinSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final bulletins = fetchAllBulletins();

    return SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
    );
  }

}