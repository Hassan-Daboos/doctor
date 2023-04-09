import 'package:doctor/constant/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../component/app_component/custom_text.dart';

class addMedicalHistory extends StatefulWidget {
  const addMedicalHistory({Key? key}) : super(key: key);

  @override
  State<addMedicalHistory> createState() => _addMedicalHistoryState();
}

class _addMedicalHistoryState extends State<addMedicalHistory> {
  var dateTime;

  TextEditingController dateTimeController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: Colors.transparent,
        title:  CustomText(
          text: 'Add Medical History',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
actions: [IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: Icon(
      Icons.save_alt,
      color: textcolor,
    )),],
        leading:  IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textcolor,
            )),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  labelStyle: TextStyle(color: textcolor),
                  labelText: "Title",
                  helperStyle: TextStyle(color: textcolor),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                readOnly: true,
                controller: dateTimeController,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());

                  DatePicker.showDatePicker(
                    context,
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                    maxTime: DateTime(2030, 1, 1),
                    minTime: DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day),
                    onChanged: (data) {
                      setState(() {
                        dateTime = "${data.year}/${data.month}/${data.day}";
                        dateTimeController.text = dateTime;
                      });
                    },
                    onConfirm: (data) {
                      setState(() {
                        dateTime = "${data.year}/${data.month}/${data.day}";
                        dateTimeController.text = dateTime;
                      });
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: "",
                  labelStyle: TextStyle(color: textcolor),
                  labelText: "Date",
                  helperStyle: TextStyle(color: textcolor),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //
              //
              //     child: Text("$dateTime")),
              // SizedBox(
              //   height: 10,
              // ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: maincolor),
                onPressed: () {},
                icon: Icon(Icons.add, color: textcolor),
                label: Text(
                  "picture",
                  style: TextStyle(color: textcolor),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
