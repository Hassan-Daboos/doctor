import 'dart:convert';
import 'dart:io';

import 'package:doctor/constant/color_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../component/app_component/custom_text.dart';

class addMedicalHistory extends StatefulWidget {
  const addMedicalHistory({Key? key}) : super(key: key);

  @override
  State<addMedicalHistory> createState() => _addMedicalHistoryState();
}

class _addMedicalHistoryState extends State<addMedicalHistory> {
  File? imageFile;
  var base64Imageteam;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("File"),
                      onTap: () {
                        _getFromFile();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->$imageFile");

        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Imageteam = base64Encode(imageBytes);
        print(base64Imageteam);
        // updatimge(base64Image, id);
      });
    }
  }

  /// Get from File
  _getFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      imageFile = File(result.files.single.path!);

      print("File----------------------------->$imageFile");

      List<int> fileBytes = imageFile!.readAsBytesSync();
      base64Imageteam = base64Encode(fileBytes);
      print(base64Imageteam);
      print(imageFile!.path);
    } else {
      // User canceled the picker
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print("imageFile----------------------------->$imageFile");
        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print("dddd$imageBytes");
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Imageteam = base64Encode(imageBytes);
        print(base64Imageteam);

        // updatimge(base64Image, id);
      });
    }
  }

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
        title: CustomText(
          text: 'Add Medical History',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.save_alt,
                color: textcolor,
              )),
        ],
        leading: IconButton(
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
