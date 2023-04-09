import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:doctor/constant/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../component/app_component/custom_text.dart';
import 'MedicalHistoryScreen.dart';
import 'editprofile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin  {
  int segmentedControlGroupValue = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: Colors.transparent,
        title:  CustomText(
          text: 'Patient profile',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),


      ),
      body: ContainedTabBarView(
        tabs: [
          Text('Medical History'),
          Text('Edit Profile'),
        ],
        tabBarProperties: TabBarProperties(
          width: MediaQuery.of(context).size.width/1.2,
          height: 50,
          background: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
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

          unselectedLabelColor: textcolor,
        ),
        views: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MedicalHistoryScreen(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: editprofileScreen(),
          ),

        ],
      )


    );
  }
}
