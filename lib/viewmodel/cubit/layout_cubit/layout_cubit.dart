
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/screens/layouthome/AboutusScreen.dart';
import '../../../view/screens/layouthome/HomeScreen.dart';
import '../../../view/screens/layouthome/ProfileScreen.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());
  static LayoutCubit get(context)=> BlocProvider.of<LayoutCubit>(context);
  // String userToken = CacheHelper.getData(key: 'accessToken') ?? '';


  List<Widget> screen =
  [
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


}