import 'package:flutter/material.dart';

import '../../../constant/color_manager.dart';
import 'custom_text.dart';

class ReservationCard extends StatelessWidget {
  String date;
  String from;
  String to;
  String remaining_Number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomText(
                    text: "Reservation information  ",
                    fontSize: 18,
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: " Date : ",
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "$date",
                    fontSize: 14,
                    color: textcolor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: " from : ",
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "$from",
                    fontSize: 14,
                    color: textcolor,
                  ),
                  CustomText(
                    text: " to : ",
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "$to",
                    fontSize: 14,
                    color: textcolor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: " Remaining Number: ",
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "$remaining_Number",
                    fontSize: 14,
                    color: textcolor,
                  ),
                ],
              ),
              TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                icon: Icon(
                  Icons.pin_drop,
                  size: 24.0,
                ),
                label: Text('Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReservationCard({
    required this.date,
    required this.from,
    required this.to,
    required this.remaining_Number,
  });
}
