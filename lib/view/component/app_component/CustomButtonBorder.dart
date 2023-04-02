import 'package:flutter/material.dart';

import '../../../constant/color_manager.dart';

class CustomButtonBorder extends StatelessWidget {
  Color buttonColor;
  VoidCallback? onPressed;

  CustomButtonBorder(
      {
        this.buttonColor = Colors.transparent,
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
        child: widget,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          side: BorderSide(color: maincolor, width: 2),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),

        onPressed: onPressed,
      ),
    );
  }
}