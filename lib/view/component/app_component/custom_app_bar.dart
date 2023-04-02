// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import 'custom_text.dart';
//
// AppBar CustomAppBar(
//     {required BuildContext context,
//     Widget? titleWidget,
//     String? title,
//     List<Widget>? actions,
//     Widget? leading,
//     VoidCallback? leadingCLick}) {
//   // String language = CacheHelper.getData(
//   //       key: "LOCALE",
//   //     ) ??
//   //     'ar';
//
//   return AppBar(
//     toolbarHeight: 105.h,
//     leading: leading == null
//         ? IconButton(
//             onPressed: () {
//               if (leadingCLick != null) {
//                 leadingCLick();
//               } else {
//                 Navigator.pop(context);
//               }
//             },
//             icon: (language == 'ar')
//                 ? SvgPicture.asset('assets/images/arrow.svg')
//                 : Transform.rotate(
//                     angle: -3.15,
//                     child: SvgPicture.asset(
//                       'assets/images/arrow.svg',
//                     )),
//           )
//         : leading,
//     title: title != null
//         ? CustomText(
//             text: title.toString(),
//             color: Colors.white,
//             fontSize: 19.sp,
//             fontWeight: FontWeight.w500,
//           )
//         : titleWidget,
//     centerTitle: true,
//     flexibleSpace: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color(0xff0DB6E1),
//               Color(0xff29F19B),
//             ], end: Alignment.centerLeft, begin: Alignment.centerRight),
//             borderRadius: BorderRadiusDirectional.only(
//                 bottomEnd: Radius.circular(30.r)))),
//     actions: actions,
//   );
// }
