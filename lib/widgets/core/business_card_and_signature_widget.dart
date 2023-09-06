import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:angelnet/screens/screen_frame.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../utils/FileUtils.dart';
import '../../utils/WidgetUtils.dart';

import 'package:http/http.dart' as http;

class BusinessCardAndSignatureWidget extends StatelessWidget {
  final _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  BusinessCardAndSignatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      main: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "명함/서명 업로드",
              style: WidgetUtils.h1Deprecated,
            ),
            ExpansionTile(
              title: const Text("명함"),
              tilePadding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              childrenPadding: const EdgeInsets.all(12.0),
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.upload),
                  onPressed: () async {
                    var pickedImage = await FileUtils().pickImageFile();
                    var response = await uploadBusinessCardApi(
                      pickedImage?.files.single.bytes ?? Uint8List(0),
                      pickedImage?.files.single.extension ?? ""
                    );
                    if (response.statusCode == 200) {
                      Fluttertoast.showToast(msg: "명함이 성공적으로 업로드되었습니다.");
                    } else {
                      Fluttertoast.showToast(msg: "명함이 업로드되지 않았습니다.");
                      print(response.statusCode);
                    }
                  },
                  label: const Text("명함 업로드"),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("서명"),
              tilePadding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              childrenPadding: const EdgeInsets.all(12.0),
              children: [
                const Text("아래 회색 창에 마우스로 서명하신 후 서명 업로드 버튼을 눌러 주세요."),
                Signature(
                  controller: _signatureController,
                  width: 300,
                  height: 300,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(height: 12.0,),
                FilledButton.icon(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      var pngFile = await _signatureController.toPngBytes();
                      var response = await uploadSignatureApi(pngFile ?? Uint8List(0));

                      if (response.statusCode == 200) {
                        Fluttertoast.showToast(msg: "서명이 성공적으로 업로드되었습니다.");
                      } else {
                        Fluttertoast.showToast(msg: "서명이 업로드되지 않았습니다.");
                        print(response.statusCode);
                      }
                    },
                    label: const Text("서명 업로드"))
              ],
            ),
          ]
      ),
      isAdmin: false,
    );
  }
}

Future<http.Response> uploadBusinessCardApi(Uint8List bytes, String ext) async {
  return await http.post(
    StringUtils().stringToUri("/business-card"),
    body: jsonEncode({"file": bytes, "ext": ext}),
    headers: await StringUtils().header(),
  );
}

Future<http.Response> uploadSignatureApi(Uint8List bytes) async {
  return await http.post(
    StringUtils().stringToUri("/signature"),
    body: bytes,
    headers: await StringUtils().header(),
  );
}