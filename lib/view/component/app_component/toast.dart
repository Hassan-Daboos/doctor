import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg , {int time = 5}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey[800],
    timeInSecForIosWeb: time,
    webPosition: 'center',
    textColor: Colors.white,
    fontSize: 16.0.sp,
  );
}
