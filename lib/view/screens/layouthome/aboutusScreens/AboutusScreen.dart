import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../../constant/assets.dart';
import '../../../../constant/color_manager.dart';
import '../../../../constant/fun.dart';
import '../../../../viewmodel/database/CacheHelper.dart';
import '../../../component/app_component/custom_text.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'About us',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
            onPressed: () async {
              CacheHelper.removeData(key: 'uid');
              await FirebaseAuth.instance.signOut();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  'LoginScreen',
                      (Route<dynamic> route) => false);
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: textcolor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Location :",
                      fontSize: 18,
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          navigateTo(30.585810, 31.503500);
                        },
                        child: Image.asset("assets/images/maap.png"),
                        // child: SvgPicture.asset(
                        //   '$mapsvg',
                        //   width: 332.32.w,
                        //   height: 209.5.h,
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 20 / 2,
                    ),
                    CustomText(
                      text: "Contact us :",
                      fontSize: 18,
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: maincolor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Functional.launchSocialMediaAppIfInstalled(
                                  url:
                                  'https://www.facebook.com/avey.pal/', // Facebook
                                );
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/icons8-facebook.svg")),
                          IconButton(
                              onPressed: () {
                                Functional.launchSocialMediaAppIfInstalled(
                                  url:
                                  'https://www.facebook.com/avey.pal/', // Facebook
                                );
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/icons8-twitter.svg")),
                          IconButton(
                              onPressed: () {
                                Functional.launchWhatsApp(
                                    phone: "+201018440919", message: 'Hello');
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/icons8-whatsapp.svg")),
                          IconButton(
                              onPressed: () {
                                UrlLauncher.launch("tel://01018440919");
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/icons8-phone.svg")),
                          IconButton(
                              onPressed: () {
                                Functional.launchSocialMediaAppIfInstalled(
                                  url:
                                  'https://www.linkedin.com/company/avey-ai/', // Facebook
                                );
                              },
                              icon: SvgPicture.asset(
                                  "assets/icons/icons8-linkedin.svg")),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      text: "Certificate :",
                      fontSize: 18,
                      color: textcolor,
                      fontWeight: FontWeight.w800,
                    ),
                    Image.asset(
                      "$certificate",
                      height: 300.5.h,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CustomText(
                        text: "Technical information : ",
                        fontSize: 18,
                        color: textcolor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: " Years experience : ",
                          fontSize: 16,
                          color: textcolor,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: "5",
                          fontSize: 14,
                          color: textcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: " current work : ",
                          fontSize: 16,
                          color: textcolor,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: "salam hospital maadi",
                          fontSize: 14,
                          color: textcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: " current work : ",
                          fontSize: 16,
                          color: textcolor,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: "salam hospital maadi",
                          fontSize: 14,
                          color: textcolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  static Future<void> openMap(String? rel_gps) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$rel_gps';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}