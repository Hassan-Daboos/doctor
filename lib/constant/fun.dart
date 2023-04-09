import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Functional {
  static Future<void> openMap(String? rel_gps) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$rel_gps';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<String?> launchWhatsApp({
    required int phone,
    required String message,
  }) async {
    if (Platform.isAndroid) {
      // add the [https]
      return "whatsapp://wa.me/$phone:03452121308:/?text=${Uri.parse(message)}";
    } else {
      // add the [https]
      return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
    }
  }




 static Future<void> launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launch(url, forceSafariVC: false); // Launch the app if installed!

      if (!launched) {
        launch(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launch(url); // Launch web view if app is not installed!
    }
  }


}
