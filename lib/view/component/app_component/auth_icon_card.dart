import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthIconCard extends StatelessWidget {
  String iconName;
  final GestureTapCallback? onTap;

  AuthIconCard({required this.iconName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 1.w, color: Color(0xff707070).withOpacity(.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 25,
                spreadRadius: 4,
              )
            ]),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25.r,
          child: Image.asset(
            iconName,
          ),
        ),
      ),
    );
  }
}
