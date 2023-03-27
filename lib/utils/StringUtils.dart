import 'package:flutter/services.dart';

class StringUtils {
  Future<String> loadText(String path) async {
    Future<String> future = rootBundle.loadString(path);
    return future;
  }
}