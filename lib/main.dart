import 'package:bloc/bloc.dart';
import 'package:doctor/view/screens/Splash_onBoard_screens/SplashScreen.dart';
import 'package:doctor/view/screens/authentication/PrivacyPolicyScreen.dart';
import 'package:doctor/view/screens/authentication/loginScreen.dart';
import 'package:doctor/view/screens/authentication/signupscreen.dart';
import 'package:doctor/viewmodel/cubit/auth_cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant/NavigationService.dart';
import 'constant/observer.dart';
import 'view/screens/layouthome/layoutScreen.dart';
import 'view/screens/layouthome/profileScreens/addMedicalHistory.dart';
import 'viewmodel/cubit/layout_cubit/layout_cubit.dart';
import 'viewmodel/database/CacheHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  // await DioHelper.init();
  Bloc.observer = MyBlocObserver();

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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(create: (context) => AuthCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.instance.navigationKey,
            routes: {
              "LoginScreen": (BuildContext context) => LoginScreen(),
              "LayoutScreen": (BuildContext context) => LayoutScreen(),
              "SignupScreen": (BuildContext context) => SignupScreen(),
              "addMedicalHistory": (BuildContext context) =>
                  addMedicalHistory(),
              "PrivacyPolicyScreen": (BuildContext context) =>
                  PrivacyPolicyScreen(),
            },
            title: 'pation  ',
            theme: ThemeData(
              textTheme:
                  GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
