import 'dart:convert';

import 'package:angelnet/models/lp/lp_document_type.dart';
import 'package:angelnet/utils/StringUtils.dart';
import 'package:http/http.dart' as http;

class LpDocument {

  final int id;
  final int lpId;
  final LpDocumentType type;

  LpDocument(this.id, this.lpId, this.type);

}

Future<int> uploadLpDocument(int lpId, LpDocumentType type) async {
  return int.parse((await http.post(
    StringUtils().stringToUri("/lp/document"),
    body: jsonEncode({"lpId": lpId, "type": type.english}),
    headers: await StringUtils().header()
  )).body);
}
