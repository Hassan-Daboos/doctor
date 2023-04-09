import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:doctor/constant/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../viewmodel/cubit/layout_cubit/layout_states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var layoutCubit = BlocProvider.of<LayoutCubit>(context);
        // var lang = AppLocalizations.of(context)!;
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(
                  icon: Icons.schedule_outlined,
                  activeIcon: Icons.schedule,
                  title: 'Schedule'),
              TabItem(
                  icon: Icons.person_outline_outlined,
                  activeIcon: Icons.person,
                  title: 'Profile'),
              TabItem(
                  icon: Icons.medical_information_outlined,
                  activeIcon: Icons.medical_information,
                  title: 'About us'),
            ],
            elevation: 5,
            shadowColor: maincolor.withOpacity(0.6),
            activeColor: textcolor,
            color: textcolor,
            backgroundColor: background,
            // currentIndex: layoutCubit.currentIndex,
            //     type: BottomNavigationBarType.fixed,
            //     selectedItemColor: textcolor,
            //     unselectedItemColor: Color(0xffBEBEBE),
            //     backgroundColor: Colors.white,
            //     showSelectedLabels: false,
            //     showUnselectedLabels: false,

            onTap: (index) {
              layoutCubit.changeIndex(index);
            },
          ),
          // bottomNavigationBar: Container(
          //   clipBehavior: Clip.antiAlias,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadiusDirectional.only(
          //         topStart: Radius.circular(10.r),
          //         topEnd: Radius.circular(10.r)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(.08),
          //         offset: Offset(0, -5),
          //         blurRadius: 20,
          //       )
          //     ],
          //   ),
          //   child: BottomNavigationBar(
          //     elevation: 0,
          //     items: [
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.schedule),
          //         activeIcon: Icon(
          //           Icons.schedule,
          //           color: maincolor,
          //         ),
          //         label: '',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.person_outline_outlined),
          //         activeIcon: Icon(
          //           Icons.person,
          //           color: maincolor,
          //         ),
          //         label: '',
          //       ),
          //
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.medical_information_outlined),
          //         activeIcon: Icon(
          //           Icons.medical_information,
          //           color: maincolor,
          //         ),
          //         label: '',
          //       ),
          //     ],
          //     onTap: (index) {
          //       layoutCubit.changeIndex(index);
          //     },
          //     currentIndex: layoutCubit.currentIndex,
          //     type: BottomNavigationBarType.fixed,
          //     selectedItemColor: textcolor,
          //     unselectedItemColor: Color(0xffBEBEBE),
          //     backgroundColor: Colors.white,
          //     showSelectedLabels: false,
          //     showUnselectedLabels: false,
          //   ),
          // ),
          body: layoutCubit.screen[layoutCubit.currentIndex],
        );
      },
    );
  }
}
