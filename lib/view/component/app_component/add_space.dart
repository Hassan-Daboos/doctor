import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget addVerticalSpace(double amount) {
  return SizedBox(
    height: amount.h,
  );
}

Widget addHorizontalSpace(double amount) {
  return SizedBox(
    width: amount.w,
  );
}
