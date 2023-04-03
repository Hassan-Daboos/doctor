import 'package:doctor/constant/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../component/app_component/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:  CustomText(
          text: 'Profile',
          fontSize: 22,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Timeline(
        primary: true,
        children: <TimelineModel>[
          TimelineModel(

            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(5),
              child: Card(
                shadowColor: grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-vector/prescription-template-design_23-2149731344.jpg?t=st=1680474235~exp=1680474835~hmac=4ba6940816fbca6e30827aac32b6c2c9be78d737482dbc6c4b4667f57f386026",
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    CustomText(
                      text: '20/5/2022',
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: maincolor,

          ),
          TimelineModel(

            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(5),
              child: Card(
                shadowColor: grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-vector/prescription-template-design_23-2149731344.jpg?t=st=1680474235~exp=1680474835~hmac=4ba6940816fbca6e30827aac32b6c2c9be78d737482dbc6c4b4667f57f386026",
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    CustomText(
                      text: '20/5/2022',
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: maincolor,

          ),
          TimelineModel(

            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(5),
              child: Card(
                shadowColor: grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-vector/prescription-template-design_23-2149731344.jpg?t=st=1680474235~exp=1680474835~hmac=4ba6940816fbca6e30827aac32b6c2c9be78d737482dbc6c4b4667f57f386026",
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    CustomText(
                      text: '20/5/2022',
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: maincolor,

          ),

        ],
        position: TimelinePosition.Center,
        iconSize: 50,
        lineColor: textcolor,
      ),
    );
  }
}
