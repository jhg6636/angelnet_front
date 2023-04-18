import 'dart:io';

import 'package:backoffice_front/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class StringUtils {

  Future<String> loadText(String path) async {
    Future<String> future = rootBundle.loadString(path);
    return future;
  }

  Uri stringToUri(String apiName, {Map<String, dynamic>? params}) {
    return Uri.http(SERVER_IP, apiName, params);
  }

  Map<String, String> header(String token) {
    return {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json"
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

}
