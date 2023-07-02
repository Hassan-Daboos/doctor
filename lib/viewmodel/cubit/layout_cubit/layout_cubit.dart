import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doctor/model/medical_history_model.dart';
import 'package:doctor/model/patient_booked_apponitments_model.dart';
import 'package:doctor/view/screens/layouthome/profileScreens/addMedicalHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../model/reservation_model.dart';
import '../../../model/user_model.dart';
import '../../../view/screens/layouthome/aboutusScreens/AboutusScreen.dart';
import '../../../view/screens/layouthome/homescreen/HomeScreen.dart';
import '../../../view/screens/layouthome/profileScreens/ProfileScreen.dart';
import 'layout_states.dart';
import 'package:path/path.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  // String userToken = CacheHelper.getData(key: 'accessToken') ?? '';

  List<Widget> screen = [
    HomeScreen(),
    ProfileScreen(),
    AboutusScreen(),
  ];
  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

// void setState(() {
  //  choice
  //      .forEach((element) {
  //  for (var element in element.subTitle) {
  //  element.select = false;
  //  }
  //  });
  //  choice[index].subTitle[index2].select =
  //  !choice[index]
  //      .subTitle[index2]
  //      .select;
  //  });
  var picker = ImagePicker();

  File? file;
  XFile? image;
  String? imageName;

  uploadMedicalImages({
    required String title,
    required String date,
  }) {
    emit(CreateMedicalHistoryLoadingState());
    Reference ref =
    FirebaseStorage.instance.ref('medicalImages').child('$imageName');
    ref.putFile(file!).then((p0) {
      ref.getDownloadURL().then((value) {
        print(value);
        createMedicalHistory(date: date, title: title, imageUrl: value);
      });
    });
  }

  List<MedicalHistoryModel> patientMedicalHistoryModel = [];

  Future<void> createMedicalHistory({
    required String title,
    required String date,
    required String imageUrl,
  }) async {
    MedicalHistoryModel medicalHistoryModel = MedicalHistoryModel(
      title: title,
      date: date,
      medicalPhoto: imageUrl,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );
    await FirebaseFirestore.instance
        .collection('medicalHistory')
        .add(medicalHistoryModel.toMap())
        .then((value) async {
      emit(CreateMedicalHistorySuccessState());
    }).catchError((onError) {
      emit(CreateMedicalHistoryErrorState());
    });
  }

  Future<void> getPatientMedicalHistory() async {
    patientMedicalHistoryModel = [];
    emit(PatientMedicalHistoryLoadingState());

    await FirebaseFirestore.instance
        .collection('medicalHistory')
        .where(
      'userId',
      isEqualTo: FirebaseAuth.instance.currentUser!.uid,
    )
        .get()
        .then((value) {
      value.docs.forEach((element) {
        patientMedicalHistoryModel
            .add(MedicalHistoryModel.fromMap(element.data()));
      });

      emit(PatientMedicalHistorySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      print('Amr');
      emit(PatientMedicalHistoryErrorState());
    });
  }

  Future<void> getMedicalImage(
      {required ImageSource source, required BuildContext context}) async {
    final selectedImages = await picker.pickImage(source: source);
    if (selectedImages != null) {
      image = selectedImages;
      file = File(selectedImages.path);
      Navigator.of(context).pop();
      var random = Random().nextInt(10000000);
      imageName = '$random${basename(selectedImages.path)}';
      print(file);
      print('+++++++++++========0');
      print(imageName);

      emit(PhotoPickedSuccessState());
    } else {
      print('no');
      emit(PhotoPickedErrorState());
    }
  }

  removeMedicalImage() {
    image = null;
    emit(PhotoPickedRemovedState());
  }

  Future<void> updateUserInfo({
    required String email,
    required String phone,
    required String fullName,
    // required String name,

    // required String role,
  }) async {
    emit(UpdateDataLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'fullName': fullName,
      'phone': phone,
      'email': email,
    }).then((value) {
      emit(UpdateDataSuccessState());
    }).catchError((onError) {
      emit(UpdateDataErrorState());
    });
  }

  UserModel? userModel;
  TextEditingController emailController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future<void> getUserInfo() async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      print(value.data());
      print('=============================');
      userModel = UserModel.fromMap(value.data()!);
      emailController.text = userModel!.email;
      phoneController.text = userModel!.phone;
      fullNameController.text = userModel!.fullName;

      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      emit(GetUserDataErrorState());
    });
  }

  // List<PatientBookedAppointmentModel> patientMedicalHistoryModel = [];
  DateTime fiveOclock = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    17, // 5 PM is hour 17 in 24-hour time
    0,
    0,
  );
  DateTime dateTimeCheck = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    // DateFormat('hh:mm:ss a').parse('2023-04-28 00:00:00.000').hour,
    // DateFormat('hh:mm:ss a').parse('2023-04-28 00:00:00.000').minute,
    // DateFormat('hh:mm:ss a').parse('2023-04-28 00:00:00.000').second,
  );
  MyModel? nightModel;
  MyModel? dayModel;
  List<String> datesNight = [];
  List<String> datesDay = [];
  DateTime dateTime = DateTime.now();

  Future<void> getPatientsBookedAppointments({String? doc}) async {
    datesNight = [];
    datesDay = [];
    dayModel = null;
    emit(PatientMedicalHistoryLoadingState());

    await FirebaseFirestore.instance
        .collection('appointments')
        .doc(doc)
        .get()
        .then((value) {
      print('${value.data()}===========');

      dayModel = MyModel.fromJson((value.data()!));

      dayModel!.dates!.forEach((element) {

        DateTime dateTime = DateTime(
          checkTime.year,
          checkTime.month,
          checkTime.day,
          DateFormat('hh:mm:ss a').parse(element.time!).hour,
          DateFormat('hh:mm:ss a').parse(element.time!).minute,
          DateFormat('hh:mm:ss a').parse(element.time!).second,
        );


        var dateTime2 = DateTime(
          checkTime.year,
          checkTime.month,
          checkTime.day,
          0, // 5 PM is hour 17 in 24-hour time
          0,
          0,
        );
        var dateTime3 = DateTime(
          checkTime.year,
          checkTime.month,
          checkTime.day,
          17, // 5 PM is hour 17 in 24-hour time
          0,
          0,
        );
        if (dateTime == fiveOclock) {
          //
        } else if (dateTime.isBefore(dateTime3) &&
            dateTime2.isBefore(dateTime) &&
            !nonReservationModel.any((elementR) =>
            elementR.time == element.time &&
                elementR.date ==
                    dateTime2.toString())) {
          print('true=========');
          print('The date in the string is earlier');
          datesDay.add(element.time!);
        } else if (dateTime.isAfter(dateTime3) &&
            dateTime2.isBefore(dateTime) &&!nonReservationModel.any((elementR) => elementR.time==element.time && elementR.date==dateTime2.toString())) {
          datesNight.add(element.time!);
        } else {
          print('null');
        }
      });
      print(datesNight);
      print(datesDay);

      emit(PatientMedicalHistorySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      print('Amr');
      emit(PatientMedicalHistoryErrorState());
    });
  }

  DateTime checkTime = DateTime.now();

  Future<void> createReservation({
    required String time,
    required String date,
    required String type,
    required int checkId,
    required UserModel userData,
  }) async {
    emit(CreateReservationLoadingState(checkId));
    var newDocId = Random().nextInt(100000);

    print(time);
    await FirebaseFirestore.instance
        .collection('checked')
        .doc(newDocId.toString())
        .set({
      'time': time,
      'date': date,
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'docId': newDocId,
      'type': type,
      "userData": userData.toMap()
    }).then((value) async {
      emit(CreateReservationSuccessState());
      getReservation();
    }).catchError((onError) {
      emit(CreateReservationErrorState());
    });
  }

  List<ReservationModel> reservationModel = [];
  List<ReservationModel> nonReservationModel = [];

  Future<void> getReservation() async {
    getAllReservation();
    reservationModel = [];

    emit(GetReservationLoadingState());
    print( '${DateTime.now().add(const Duration(hours: 3))}DateTime.now()');


    await FirebaseFirestore.instance
        .collection('checked')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('date',
        isEqualTo: DateTime(
          checkTime.year,
          checkTime.month,
          checkTime.day,
          0, // 5 PM is hour 17 in 24-hour time
          0,
          0,
        ).toString())
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((elementOne) {
          DateTime dateTime = DateTime(
            checkTime.year,
            checkTime.month,
            checkTime.day,
            DateFormat('hh:mm:ss ').parse(elementOne.data()['time']).hour,
            DateFormat('hh:mm:ss ').parse(elementOne.data()['time']).minute,
            DateFormat('hh:mm:ss ').parse(elementOne.data()['time']).second,
          );

          var dateTime2 = DateTime(
            checkTime.year,
            checkTime.month,
            checkTime.day,
            22, // 5 PM is hour 17 in 24-hour time
            0,
            0,
          );
          if (dateTime == DateTime.now()) {
            print('DateTime.now()');

            deleteDoc(doc: elementOne.id);
            //delete
          } else if (dateTime.isBefore(dateTime2)) {
            print('dateTime.isBefore(DateTime.now()');

            // deleteDoc(doc: elementOne.id);
            reservationModel.add(ReservationModel.fromMap(elementOne.data()));
            // reservationModel.add(ReservationModel.fromMap(elementOne.data()));


          } else {
            // deleteDoc(doc: elementOne.id);

            // reservationModel.add(ReservationModel.fromMap(elementOne.data()));

            print('dateTime.isafter(DateTime.now()');

            // deleteDoc(doc: elementOne.id);
          }
        });
      } else {
        getPatientsBookedAppointments(doc: checkTime.weekday.toString());
      }

      emit(GetReservationSuccessState());
    }).catchError((onError) {
      emit(GetReservationErrorState());
    });
  }

  Future<void> getAllReservation() async {
    nonReservationModel = [];
    emit(GetAllReservationLoadingState());

    await FirebaseFirestore.instance
        .collection('checked')
        .where('date',
        isEqualTo: DateTime(
          checkTime.year,
          checkTime.month,
          checkTime.day,
          0, // 5 PM is hour 17 in 24-hour time
          0,
          0,
        ).toString())
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          nonReservationModel.add(ReservationModel.fromMap(element.data()));
          print('${element.data()}nonReservation');
        });
      }

      emit(GetAllReservationSuccessState());
    }).catchError((onError) {
      emit(GetAllReservationErrorState());
    });
  }

  UserModel? doctorInfo;

  Future<void> deleteDoc({String? doc,int? checkId}) {
    emit(DeleteDocLoadingState(checkId!));
    return FirebaseFirestore.instance
        .collection('checked')
        .doc(doc)
        .delete()
        .then((value) {
      getReservation();

      emit(DeleteDocSuccessState());

    }).catchError((error) {
      print("Failed to delete user: $error");
      emit(DeleteDocErrorState());

    });
  }

  Future<void> getDoctorInfo() async {
    emit(DoctorInfoLoadingState());

    await FirebaseFirestore.instance
        .collection('doctors')
        .doc('vNdSJgvWUDUwntUvMrm8vbQroBn2')
        .get()
        .then((value) {
      print(value.data());
      doctorInfo = UserModel.fromMap(value.data()!);

      emit(DoctorInfoSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      print('Amr');
      emit(DoctorInfoErrorState());
    });
  }
}