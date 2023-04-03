import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color_manager.dart';
import 'custom_text.dart';

class CustomMaxColorText extends StatelessWidget {
  final String fristtext;
  final String secondtext;





  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        CustomText(
          text: '$fristtext ',
          fontSize: 33,
          color: textcolor,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          text: '$secondtext',
          fontSize: 33,
          color: maincolor,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  const CustomMaxColorText({
    required this.fristtext,
    required this.secondtext,
  });
}