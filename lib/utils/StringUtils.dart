import 'package:flutter/services.dart';

class StringUtils {

  static const String HOST = 'localhost:8080';

  Future<String> loadText(String path) async {
    Future<String> future = rootBundle.loadString(path);
    return future;
  }

  Uri stringToUri(String apiName, Map<String, dynamic> params) {
    return Uri.http(HOST, apiName, params);
  }

}
