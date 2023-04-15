import 'package:flutter/material.dart';

import '../../../constant/color_manager.dart';

class CustomButton extends StatelessWidget {
  Color buttonColor;
  VoidCallback? onPressed;

  CustomButton(
      {this.buttonColor = maincolor,
      this.onPressed,
      this.borderRadius = 10,
      required this.widget});

  double borderRadius;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        clipBehavior: Clip.none,


        child: widget,
        style: ElevatedButton.styleFrom(


          elevation: 0,

          backgroundColor: maincolor,
          // background


          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
