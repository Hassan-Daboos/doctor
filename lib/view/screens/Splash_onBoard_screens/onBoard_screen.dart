import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constant/NavigationService.dart';
import '../../../constant/assets.dart';
import '../../../constant/color_manager.dart';
import '../../component/app_component/CustomButtonBorder.dart';
import '../../component/app_component/custom_button.dart';
import '../../component/app_component/custom_text.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 550.h,
              margin: EdgeInsets.only(top: 100.h),
              child: PageView(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          SvgPicture.asset(
                            '$illustration1',
                            width: 332.32.w,
                            height: 209.5.h,
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomText(
                          text:
                              // onBoardModel[index].title,
                              'Learn a lot of courses in maincolor Education',
                          fontSize: 24,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Container(
                        width: 270.w,
                        child: CustomText(
                          text:
                              // onBoardModel[index].body,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                          fontSize: 13,
                          color: textGray,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          height: 1.6.h,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          SvgPicture.asset(
                            '$illustration2',
                            width: 332.32.w,
                            height: 209.5.h,
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomText(
                          text:
                              // onBoardModel[index].title,
                              'Learn a lot of courses in maincolor Education',
                          fontSize: 24,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Container(
                        width: 270.w,
                        child: CustomText(
                          text:
                              // onBoardModel[index].body,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                          fontSize: 13,
                          color: textGray,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          height: 1.6.h,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          SvgPicture.asset(
                            '$illustration3',
                            width: 332.32.w,
                            height: 209.5.h,
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomText(
                          text:
                              // onBoardModel[index].title,
                              'Learn a lot of courses in maincolor Education',
                          fontSize: 24,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Container(
                        width: 270.w,
                        child: CustomText(
                          text:
                              // onBoardModel[index].body,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ',
                          fontSize: 13,
                          color: textGray,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          height: 1.6.h,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ],
                // itemBuilder: (context, index) => ,
                // itemCount:
                // // onBoardModel.length,
                // 3,
                controller: pageController,
                onPageChanged: (index) {
                  if (index ==
                      // onBoardModel.length-1
                      3 - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                activeDotColor: maincolor,
                dotColor: graydot.withOpacity(.5),
                dotWidth: 10.0.w,
                dotHeight: 10.0.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 35,
                  child: CustomButton(
                    widget: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: CustomText(
                        text: 'Join Now',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    buttonColor: maincolor,
                    borderRadius: 7,
                    onPressed: () {
                      NavigationService
                          .instance.navigationKey!.currentState!
                          .pushNamed(
                        "SignupScreen",
                      );

                    },
                  ),
                ),
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 35,
                  child: CustomButtonBorder(
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: CustomText(
                        text: 'Login',
                        fontSize: 14,
                        color: maincolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    buttonColor: Colors.white,
                    borderRadius: 7,
                    onPressed: () {
                      NavigationService
                          .instance.navigationKey!.currentState!
                          .pushNamed(
                        "LoginScreen",
                      );

                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
