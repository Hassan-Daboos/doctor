import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/model/user_model.dart';
import 'package:doctor/viewmodel/cubit/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class AuthCubit extends Cubit<AuthStates>
{
  AuthCubit():super(AuthInitialStates());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  UserModel? userModel;
  Future<void> registerUser({
    required String email,
    required String password,

    required String phone,
    required String fullName,
  }) async {
    bool phoneFound = false;
    // register function start
    emit(RegisterLoadingState());



      await FirebaseAuth
          .instance // firebase auth this library i use it to register i send request Email and password
          .createUserWithEmailAndPassword(
          email: email, password: password
      ).then((value) async {
        // if register successful i will add user data to firebase
        userModel = UserModel(


          email: email,
          phone: phone,

          photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH6PjyUR8U-UgBWkOzFe38qcO29regN43tlGGk4sRd&s',

          fullName: fullName,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set(userModel!.toMap())
            .then((value) async {
          emit(RegisterSuccessState());
        });
      }).catchError((onError) {
        if (onError is FirebaseAuthException) {
          print(onError.message);
          emit(RegisterErrorState(onError.message!));
        }
      }).catchError((e) {
        print(e.toString());
      });
    }

  Future<void> loginUser(
      {
        required String email, required String password,
      }) async
  {
    emit(UserLoginLoading());
    userModel = null; // here i remove all old data to receive New Data
    await FirebaseAuth
        .instance // firebase auth this library i use it to login i send request Email and password
        .signInWithEmailAndPassword
      (
        email: email,
        password: password
    )
        .then((value) async {


      // if login successful i will get user id and i will use it to get user data from firebase
      await FirebaseFirestore.instance
          .collection('users')
          .doc(value.user!.uid)
          .get()
          .then((value) async {
        userModel = UserModel.fromMap(value.data()!);
        // save user id in cashHelper
        emit(UserLoginSuccess());
        // here i will store user data in userModel
        //  cashing role user
      });
    }).catchError((onError) {
      // if email Error or password Error show message :D
      if (onError is FirebaseAuthException) {
        print(onError.message);
        emit(UserLoginError( onError.message!.trim()));
      }
    });
  }

  }
