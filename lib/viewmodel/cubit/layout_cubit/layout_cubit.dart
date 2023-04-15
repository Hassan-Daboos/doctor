import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:doctor/model/medical_history_model.dart';
import 'package:doctor/view/screens/layouthome/profileScreens/addMedicalHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
      userModel =UserModel.fromMap(value.data()!);
      emailController.text=userModel!.email;
      phoneController.text=userModel!.phone;
      fullNameController.text=userModel!.fullName;

      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      emit(GetUserDataErrorState());
    });
  }
}
