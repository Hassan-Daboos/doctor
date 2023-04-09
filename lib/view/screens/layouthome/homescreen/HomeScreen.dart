import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
import '../../../component/app_component/custom_text.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: Colors.transparent,
        title:  CustomText(
          text: 'Schedule',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),


      ),
    );
  }
}
