import 'package:doctor/view/component/app_component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: ListView.separated(itemBuilder: (context,index)=> Container(


        decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(15.r),

        ),
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.network(
                        "https://img.freepik.com/free-vector/prescription-template-design_23-2149731344.jpg?t=st=1680474235~exp=1680474835~hmac=4ba6940816fbca6e30827aac32b6c2c9be78d737482dbc6c4b4667f57f386026",
                    fit: BoxFit.cover,

                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomText(
                      text: 'Dr/name is hassan',
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                CustomText(
                  text: '20/5/2022',
                  fontSize: 16,
                  color: textcolor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(child: CustomButton(widget: FittedBox(child: CustomText(text: 'First time', fontSize: 16.sp,color: textcolor,)),buttonColor: maincolor,borderRadius: 10.r,onPressed: (){}),),
                Expanded(child: CustomButton(widget: FittedBox(child: CustomText(text: 'Re-revealed', fontSize: 16.sp,color: textcolor,)),buttonColor: maincolor,borderRadius: 10.r,onPressed: (){})),
                Expanded(child: CustomButton(widget: FittedBox(child: CustomText(text: 'consultation', fontSize: 16.sp,color: textcolor,)),buttonColor: maincolor,borderRadius: 10.r,onPressed: (){})),
              ],
            )

          ],
        ),
      ), separatorBuilder: (context,index)=>SizedBox(height: 10.h,), itemCount: 5,shrinkWrap: true,padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),),
    );
  }
}
