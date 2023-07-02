import 'package:flutter/material.dart';

import '../../../constant/color_manager.dart';
import '../../component/app_component/custom_text.dart';
import '../../component/app_component/maxtextcolor.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: textcolor,
            size: 33,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomMaxColorText(
                fristtext: 'Privacy ',
                secondtext: 'Policy',
              ),
              SizedBox(
                height: 20,
              ),
              const CustomText(
                text:
                    "This privacy policy abstract provides an overview of the key points covered in the complete privacy policy for a clinic reservation app. The app collects personal information, such as name, contact details, date of birth, and medical history, to facilitate seamless clinic reservations. Usage data, including device information and app usage statistics, may also be collected. The information is used to manage appointments, communicate updates, improve services, and analyze usage patterns. Personal information may be shared with trusted third parties, disclosed as required by law, or in the event of a merger or acquisition. The app takes security measures to protect personal information but cannot guarantee absolute security. It may contain links to third-party websites, and the app is not intended for individuals under 16 years old. The privacy policy may be updated, and contact information is provided for questions or concerns. Users are encouraged to read the full privacy policy for detailed information on data handling and protection.",
                fontSize: 14,
                color: textcolor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
