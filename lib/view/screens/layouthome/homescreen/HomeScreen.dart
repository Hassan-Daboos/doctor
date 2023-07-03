import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:doctor/view/component/app_component/custom_button.dart';
import 'package:doctor/viewmodel/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/auth_cubit/auth_cubit.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutCubit.get(context).getDoctorInfo();
    LayoutCubit.get(context).getReservation();
    LayoutCubit.get(context).getUserInfo();


  }

  int segmentedControlGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context, listen: true);
    var authCubit = BlocProvider.of<AuthCubit>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Schedule',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: maincolor,
            ),
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                currentTime: layoutCubit.checkTime,
                locale: LocaleType.en,
                maxTime: DateTime(2030, 1, 1),
                minTime: DateTime.now(),

                onChanged: (data) {
                  setState(() {
                    print(data.weekday.toString());
                    layoutCubit.checkTime = data;
                    // dateTime = "${data.year}/${data.month}/${data.day}";
                    // dateTimeController.text = dateTime;
                    // print(dateTimeController.text);
                    print(layoutCubit.checkTime);
                  });
                },
                onConfirm: (data) {
                  layoutCubit.checkTime = data;
                  layoutCubit.getReservation();
                },
              );
            },
          )
        ],
      ),
      body: layoutCubit.doctorInfo != null && layoutCubit.dayModel != null && layoutCubit.userModel != null
          ? BlocConsumer<LayoutCubit, LayoutStates>(builder: (context, state) {
        return state is! GetReservationLoadingState
            ? ContainedTabBarView(
          tabs: [
            if (layoutCubit.reservationModel.isEmpty) ...[
              Text('day'),
              Text('Night'),
            ] else ...[
              Text('Reservation'),
            ]
          ],
          tabBarProperties: TabBarProperties(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius:
                BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: Offset(1, -1),
                  ),
                ],
              ),
            ),
            position: TabBarPosition.top,
            alignment: TabBarAlignment.center,
            indicatorColor: background,
            labelColor: maincolor,
            isScrollable: false,
            unselectedLabelColor: textcolor,
          ),
          views: [
            if (layoutCubit.reservationModel.isEmpty) ...[
              layoutCubit.datesDay.isNotEmpty?   ListView.separated(
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle),
                                child: Image.network(
                                  '${layoutCubit.doctorInfo!.photo}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text:
                                'Dr/${layoutCubit.doctorInfo!.fullName}',
                                fontSize: 16,
                                color: textcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          CustomText(
                            text: layoutCubit.datesDay[index],
                            fontSize: 16,
                            color: textcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      state is CreateReservationLoadingState  && state.checkId == index
                          ?Center(
                          child: CircularProgressIndicator())
                          :  Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                widget: FittedBox(
                                    child: CustomText(
                                      text: 'First time',
                                      fontSize: 16.sp,
                                      color: textcolor,
                                    )),
                                buttonColor: maincolor,
                                borderRadius: 10.r,
                                onPressed: () {
                                  layoutCubit
                                      .createReservation(
                                      checkId: index,
                                      userData: layoutCubit.userModel!,
                                      type: 'First time',
                                      time: layoutCubit
                                          .datesDay[
                                      index],
                                      date: DateTime(
                                        layoutCubit
                                            .checkTime
                                            .year,
                                        layoutCubit
                                            .checkTime
                                            .month,
                                        layoutCubit
                                            .checkTime
                                            .day,
                                        0, // 5 PM is hour 17 in 24-hour time
                                        0,
                                        0,
                                      ).toString());
                                }),
                          ),
                          Expanded(
                              child: CustomButton(
                                  widget: FittedBox(
                                      child: CustomText(
                                        text: 'Re-revealed',
                                        fontSize: 16.sp,
                                        color: textcolor,
                                      )),
                                  buttonColor: maincolor,
                                  borderRadius: 10.r,
                                  onPressed: () {
                                    layoutCubit
                                        .createReservation(
                                        checkId: index,
                                        userData: layoutCubit.userModel!,
                                        type: 'Re-revealed',
                                        time: layoutCubit
                                            .datesDay[
                                        index],
                                        date: DateTime(
                                          layoutCubit
                                              .checkTime
                                              .year,
                                          layoutCubit
                                              .checkTime
                                              .month,
                                          layoutCubit
                                              .checkTime
                                              .day,
                                          0, // 5 PM is hour 17 in 24-hour time
                                          0,
                                          0,
                                        ).toString());
                                  })),
                          Expanded(
                              child: CustomButton(
                                  widget: FittedBox(
                                      child: CustomText(
                                        text: 'consultation',
                                        fontSize: 16.sp,
                                        color: textcolor,
                                      )),
                                  buttonColor: maincolor,
                                  borderRadius: 10.r,
                                  onPressed: () {
                                    layoutCubit
                                        .createReservation(
                                        checkId: index,
                                        userData: layoutCubit.userModel!,
                                        type: 'consultation',

                                        time: layoutCubit
                                            .datesDay[
                                        index],
                                        date: DateTime(
                                          layoutCubit
                                              .checkTime
                                              .year,
                                          layoutCubit
                                              .checkTime
                                              .month,
                                          layoutCubit
                                              .checkTime
                                              .day,
                                          0, // 5 PM is hour 17 in 24-hour time
                                          0,
                                          0,
                                        ).toString());
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: layoutCubit.datesDay.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.h),
              ):SizedBox(),
              layoutCubit.datesNight.isNotEmpty?    ListView.separated(
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle),
                                child: Image.network(
                                  '${layoutCubit.doctorInfo!.photo}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text:
                                'Dr/${layoutCubit.doctorInfo!.fullName}',
                                fontSize: 16,
                                color: textcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          CustomText(
                            text: layoutCubit.datesNight[index],
                            fontSize: 16,
                            color: textcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      state is CreateReservationLoadingState && state.checkId ==index
                          ? Center(
                          child: CircularProgressIndicator())
                          : Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                widget: FittedBox(
                                    child: CustomText(
                                      text: 'First time',
                                      fontSize: 16.sp,
                                      color: textcolor,
                                    )),
                                buttonColor: maincolor,
                                borderRadius: 10.r,
                                onPressed: () {
                                  layoutCubit
                                      .createReservation(
                                      checkId: index,
                                      type: 'First time',
                                      userData: layoutCubit.userModel!,
                                      time: layoutCubit
                                          .datesNight[
                                      index],
                                      date: DateTime(
                                        layoutCubit
                                            .checkTime
                                            .year,
                                        layoutCubit
                                            .checkTime
                                            .month,
                                        layoutCubit
                                            .checkTime
                                            .day,
                                        0, // 5 PM is hour 17 in 24-hour time
                                        0,
                                        0,
                                      ).toString());
                                }),
                          ),
                          Expanded(
                              child: CustomButton(
                                  widget: FittedBox(
                                      child: CustomText(
                                        text: 'Re-revealed',
                                        fontSize: 16.sp,
                                        color: textcolor,
                                      )),
                                  buttonColor: maincolor,
                                  borderRadius: 10.r,
                                  onPressed: () {
                                    layoutCubit
                                        .createReservation(
                                        checkId: index,
                                        type: 'Re-revealed',
                                        userData: layoutCubit.userModel!,
                                        time: layoutCubit
                                            .datesNight[
                                        index],
                                        date: DateTime(
                                          layoutCubit
                                              .checkTime
                                              .year,
                                          layoutCubit
                                              .checkTime
                                              .month,
                                          layoutCubit
                                              .checkTime
                                              .day,
                                          0, // 5 PM is hour 17 in 24-hour time
                                          0,
                                          0,
                                        ).toString());
                                  })),
                          Expanded(
                              child: CustomButton(
                                  widget: FittedBox(
                                      child: CustomText(
                                        text: 'consultation',
                                        fontSize: 16.sp,
                                        color: textcolor,
                                      )),
                                  buttonColor: maincolor,
                                  borderRadius: 10.r,
                                  onPressed: () {
                                    layoutCubit
                                        .createReservation(
                                        checkId: index,
                                        type: 'consultation',
                                        userData: layoutCubit.userModel!,
                                        time: layoutCubit
                                            .datesNight[
                                        index],
                                        date: DateTime(
                                          layoutCubit
                                              .checkTime
                                              .year,
                                          layoutCubit
                                              .checkTime
                                              .month,
                                          layoutCubit
                                              .checkTime
                                              .day,
                                          0, // 5 PM is hour 17 in 24-hour time
                                          0,
                                          0,
                                        ).toString());
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: layoutCubit.datesNight.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.h),
              ):SizedBox(),
            ] else ...[
              ListView.separated(
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 150,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle),
                                child: Image.network(
                                  '${layoutCubit.doctorInfo!.photo}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text:
                                'Dr/${layoutCubit.doctorInfo!.fullName}',
                                fontSize: 16,
                                color: textcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          CustomText(
                            text: layoutCubit
                                .reservationModel[index].time!,
                            fontSize: 16,
                            color: textcolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      state is DeleteDocLoadingState && state.checkId ==index? CircularProgressIndicator():    CustomButton(
                          widget: FittedBox(
                              child: CustomText(
                                text: 'Cancel Reservation',
                                fontSize: 16.sp,
                                color: textcolor,
                              )),
                          buttonColor: maincolor,
                          borderRadius: 10.r,
                          onPressed: ()
                          {
                            layoutCubit.deleteDoc(checkId: index,doc: layoutCubit.reservationModel[index].docId.toString());


                          })
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: layoutCubit.reservationModel.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.h),
              ),
            ]
          ],
        )
            : Center(child: CircularProgressIndicator());
      }, listener: (context, state) async {
        if (state is CreateReservationSuccessState) {
          // print('${layoutCubit.dayModel!.toJson()}================');
          // print(layoutCubit.dayModel!.dates![0].check);

        }
      })
          : Center(child: CircularProgressIndicator()),
    );
  }
}