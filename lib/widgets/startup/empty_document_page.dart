import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyDocumentPage extends StatelessWidget {

  final bool isAdmin;

  const EmptyDocumentPage({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    if (isAdmin) {
      return Center(
        child: Column(
          children: [
            const Text("정보가 없습니다."),
            TextButton.icon(
              onPressed: () {

              },
              icon: const Icon(Icons.upload),
              label: const Text("업로드"),
            )
          ],
        ),
      );
    }
    else {
      return const Center(
        child: Text("정보가 없습니다.")
      );
    }
  }

}