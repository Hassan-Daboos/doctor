import 'package:doctor/view/component/app_component/custom_button.dart';
import 'package:doctor/view/component/app_component/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/color_manager.dart';
import '../../viewmodel/cubit/layout_cubit/layout_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  String title;
  String? body;

  CustomBottomSheet(
      {required this.title,
      required this.widget,

      this.body = 'شحن رصيد',
      this.galleryButton = 'Gallery',
      this.cameraButton = 'camera',
      });

  Widget widget;

  String? galleryButton;
  String? cameraButton;

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context,listen:true);
    // Listener For AuthCubit
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: Offset(0, -5),
              blurRadius: 20,
            )
          ],
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.r), topEnd: Radius.circular(20.r))),
      padding: EdgeInsetsDirectional.only(
          top: 14.h, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (body!.isNotEmpty) ...[
                CustomText(
                  text: body.toString(),
                  color: textcolor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
                SizedBox(
                  height: 21.h,
                ),
                CustomText(
                  text: title.toString(),
                  color: Color(0xff1D1D1B),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 26.h,
                ),
              ],
              widget,
              SizedBox(
                height: 21.h,
              ),
              Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: Offset(0, -5),
                      blurRadius: 20,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.r),
                      topEnd: Radius.circular(20.r)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                child: Column(
                  children: [
                    Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: maincolor,
                          borderRadius: BorderRadius.circular(10.r),
                          backgroundBlendMode: BlendMode.multiply),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CustomButton(
                          widget: CustomText(
                            text: cameraButton.toString(),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: textcolor,
                          ),
                          buttonColor: Colors.transparent,
                          borderRadius: 10.r,
                          onPressed: ()
                          {
                            layoutCubit.getMedicalImage(source: ImageSource.camera, context: context);


                          }),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: maincolor,
                          borderRadius: BorderRadius.circular(10.r),
                          backgroundBlendMode: BlendMode.multiply),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CustomButton(
                          widget: CustomText(
                            text: galleryButton.toString(),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: textcolor,
                          ),
                          buttonColor: Colors.transparent,
                          borderRadius: 10.r,
                          onPressed: ()
                          {
                            layoutCubit.getMedicalImage(source: ImageSource.gallery, context: context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
          PositionedDirectional(
            top: 0,
            start: 13.w,
            child: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: Color(0xffEBEBEB),
                  child:
                      Icon(Icons.close, color: Color(0xff686868), size: 25.sp),
                )),
          ),
        ],
      ),
    );
  }
}
