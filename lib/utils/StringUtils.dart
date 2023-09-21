import 'dart:io';

import 'package:angelnet/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StringUtils {

  static const pretendard = "Pretendard";

  Future<String> loadText(String path) async {
    Future<String> future = rootBundle.loadString(path);
    return future;
  }

  Uri stringToUri(String apiName, {Map<String, dynamic>? params}) {
    return Uri.http(serverAddress, apiName, params);
  }

  Future<Map<String, String>> header() async {
    // var token = await secureStorage.read(key: await getDeviceId()) ?? "";
    var token = storage[await getDeviceId()] ?? "";
    return {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
    };
  }

  Future<String> getDeviceId() async {
    var deviceIdentifier = 'unknown';
    var deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      var webInfo = await deviceInfo.webBrowserInfo;
      deviceIdentifier = webInfo.vendor! +
          webInfo.userAgent! +
          webInfo.hardwareConcurrency.toString();
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.serialNumber!;
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor!;
    } else if (Platform.isLinux) {
      var linuxInfo = await deviceInfo.linuxInfo;
      deviceIdentifier = linuxInfo.machineId!;
    } else if (Platform.isMacOS) {
      var macOsInfo = await deviceInfo.macOsInfo;
      deviceIdentifier = macOsInfo.systemGUID!;
    }

    return deviceIdentifier;
  }


  bool isValidStringId(String stringId) {
    if (RegExp("^[a-z0-9가-힣ㄱ-ㅎㅏ-ㅣ]{2,20}\$").hasMatch(stringId)) {
      return true;
    }
    return false;
  }

  bool isValidPassword(String password) {
    // if (RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[./,!@#\$%^&()+=-])[a-zA-Z0-9./,!@#\$%^&*()+=-]{4,20}\$").hasMatch(password)) {
    if (RegExp("^[a-zA-Z0-9./,!@#\$%^&*()+=-]{4,20}\$").hasMatch(password)) {
      return true;
    }
    return false;
  }

  bool checkSamePassword(String password, String checkPassword) {
    if (password == checkPassword) {
      return true;
    }

    return false;
  }

  bool isValidName(String name) {
    return true;
  }

  bool isValidPhone(String phone) {
    if (RegExp("^[0-9]{10,11}\$").hasMatch(phone)) {
      return true;
    }
    return false;
  }

  bool isValidEmail(String emailBack) {
    if (RegExp("^[a-zA-Z0-9./,!#\$%^&*()+=-]{1,}.[a-zA-Z0-9./,!@#\$%^&*()+=-]{1,}\$").hasMatch(emailBack)) {
      return true;
    }
    return false;
  }

  bool isValidRecommender(String recommender) {
    if (recommender == "") {
      return true;
    }
    if (RegExp("^[가-힇]{2,}\$").hasMatch(recommender)) {
      return true;
    }

    return false;
  }

  String currencyFormat(int number) {
    var f = NumberFormat.currency(locale: 'ko-kr', symbol: "");
    return f.format(number);
  }

}
