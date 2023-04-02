import 'package:doctor/view/screens/Splash_onBoard_screens/SplashScreen.dart';
import 'package:doctor/view/screens/authentication/PrivacyPolicyScreen.dart';
import 'package:doctor/view/screens/authentication/loginScreen.dart';
import 'package:doctor/view/screens/authentication/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant/NavigationService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigationKey,
          routes: {
            "LoginScreen": (BuildContext context) =>  LoginScreen(),
            "SignupScreen": (BuildContext context) =>  SignupScreen(),
            "PrivacyPolicyScreen": (BuildContext context) =>  PrivacyPolicyScreen(),
          },
          title: 'Student ODC',
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        );
      },

    );

  }
}

