import 'dart:convert';

import '../../utils/StringUtils.dart';
import 'package:http/http.dart' as http;

class Bulletin {

  final int id;
  final String name;

  const Bulletin({required this.id, required this.name});

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      id: json["id"] as int,
      name: json["name"] as String,
    );
  }

}

Future<List<Bulletin>> fetchAllBulletins() async {
  var response = await http.get(
    StringUtils().stringToUri("/bulletin"),
    headers: await StringUtils().header(),
  );

  return jsonDecode(utf8.decode(response.bodyBytes))
      .map<Bulletin>((json) => Bulletin.fromJson(json)).toList();
}

Future<http.Response> makeBulletin(String name) async {
  return await http.post(
    StringUtils().stringToUri('bulletin'),
    headers: await StringUtils().header(),
    body: {'name': name}
  );
}