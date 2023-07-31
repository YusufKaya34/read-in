import 'dart:io';
import 'dart:ui';


import 'package:device_info_plus/device_info_plus.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalApi {
  
  static Future setupOneSignal() async {
    Future<String?> _getId() async {
      var deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
         var iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor; 
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.androidId; 
      }
    }
    String? deviceID = await _getId();
      print(deviceID);

    
    final String deviceLang = PlatformDispatcher.instance.locale.languageCode;

    OneSignal oneSignal = OneSignal.shared;
    oneSignal.promptUserForPushNotificationPermission();
    oneSignal.setAppId("d65d8e7a-d196-4c6e-9732-f325092f5556");
      oneSignal.setExternalUserId(deviceID!);
    oneSignal.setLanguage(deviceLang);
    oneSignal.sendTags({
        "deviceID": deviceID,
      "deviceLang": deviceLang,
    });
    oneSignal.setNotificationOpenedHandler((openedResult) {
      String? data = openedResult.notification.additionalData as String?;
      if (data != null) {}
    });
  }
}
