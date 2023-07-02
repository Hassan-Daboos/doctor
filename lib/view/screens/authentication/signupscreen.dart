import 'package:doctor/view/screens/layouthome/homescreen/HomeScreen.dart';
import 'package:doctor/view/screens/layouthome/layoutScreen.dart';
import 'package:doctor/viewmodel/cubit/auth_cubit/auth_states.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/NavigationService.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/data.dart';
import '../../../viewmodel/cubit/auth_cubit/auth_cubit.dart';
import '../../../viewmodel/database/CacheHelper.dart';
import '../../component/app_component/custom_button.dart';
import '../../component/app_component/custom_text.dart';
import '../../component/app_component/custom_text_form_filed.dart';
import '../../component/app_component/maxtextcolor.dart';
import '../../component/app_component/toast.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool? value = false;

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context,listen:true);
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: SvgPicture.asset(
                  'assets/images/2.svg',
                  height: MediaQuery.of(context).size.height / 10.0,
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Form(
                      key: formKey,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 10,
                                ),
                                const CustomMaxColorText(
                                  fristtext: 'Hello,',
                                  secondtext: 'Friend!',
                                ),
                                CustomText(
                                  text: "Sign Up",
                                  fontSize: 20,
                                  color: textcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormFieldsCustom(
                                    controller: fullNameController,
                                    hintText: "Full Name",
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Full Name must be not Empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormFieldsCustom(
                                    controller: phoneController,
                                    hintText: "Phone number",
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Phone number must be not Empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormFieldsCustom(
                                    controller: emailController,
                                    hintText: "E-mail",
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Email must be not Empty";
                                      } else if (!RegExp(validatorEmail)
                                          .hasMatch(value.trim())) {
                                        return "Email is not Valid";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormFieldsCustom(
                                    controller: passwordController,
                                    hintText: "Password",
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    isPassword: authCubit.isPassword,
                                    // suffixIcon: authCubit.isPassword ?Icons.remove_red_eye:Icons.visibility_off,
                                    suffixIcon:authCubit.isPassword ? GestureDetector(onTap: ()
                                    {
                                      authCubit.changeEyeIcon();
                                    },child: Icon(Icons.remove_red_eye,color: textcolor,)):GestureDetector(onTap: (){
                                      authCubit.changeEyeIcon();

                                    },child: Icon(Icons.visibility_off,color: maincolor,)),
                                    suffix: true,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Password must be not Empty";
                                      } else if (!value
                                          .trim()
                                          .contains(RegExp(r'[A-Z]'))) {
                                        return "Password must Contains UpperCase Letter";
                                      } else if (!value
                                          .trim()
                                          .contains(RegExp(r'[0-9]'))) {
                                        return "Password must Contains Digit";
                                      } else if (!value
                                          .trim()
                                          .contains(RegExp(r'[a-z]'))) {
                                        return "Password must Contains LowerCase Letter";
                                      } else if (!value.trim().contains(
                                          RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                        return "Password must Contains Special Character";
                                      } else if (value.trim().length < 8) {
                                        return "Password must be more 8 Letters";
                                      } else if (!RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$')
                                          .hasMatch(value.trim())) {
                                        return "Password is not Valid";
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                Row(
                                  children: <Widget>[
                                    /** Checkbox Widget **/
                                    Checkbox(
                                      activeColor: maincolor,
                                      value: this.value,

                                      onChanged: (bool? value) {
                                        this.value = value;
                                        setState(() {
                                          this.value = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ), //SizedBox
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: BlackArrowBack,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Do you agree to our  ",
                                            style: TextStyle(
                                              color: textcolor
                                            )
                                          ),
                                          TextSpan(
                                              text: "Privacy Policy",
                                              style: TextStyle(
                                                color: maincolor,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline,
                                                fontSize: 14,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  NavigationService
                                                      .instance.navigationKey!.currentState!
                                                      .pushNamed(
                                                    "PrivacyPolicyScreen",
                                                  );                                                 }),
                                        ],
                                      ),
                                    ), //Text
                                    SizedBox(width: 10), //SizedBox
                                    //Checkbox
                                  ], //<Widget>[]
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 90,
                                ),
                               BlocConsumer<AuthCubit,AuthStates>(builder: (context,state)
                               {
                                 return  state is ! RegisterLoadingState ?Container(
                                   width: MediaQuery.of(context).size.width,
                                   child: CustomButton(
                                     widget: const Padding(
                                       padding: EdgeInsets.symmetric(
                                           horizontal: 20.0, vertical: 15),
                                       child: CustomText(
                                         text: "Sign Up",
                                         fontSize: 12,
                                         color: Colors.white,
                                         fontWeight: FontWeight.w600,
                                       ),
                                     ),
                                     buttonColor: maincolor,
                                     borderRadius: 7,
                                     onPressed: () {
                                       if (formKey.currentState!.validate()) {
                                         authCubit.registerUser(email: emailController.text, password: passwordController.text, phone: phoneController.text, fullName: fullNameController.text);
                                       }
                                     },
                                   ),
                                 ):Center(child: CircularProgressIndicator());
                               }, listener: (context,state){
                                 if(state is RegisterSuccessState)
                                 {
                                   CacheHelper.put(key: 'uid', value: state.uid).then((value)
                                   {
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));

                                   });
                                 }if(state is RegisterErrorState)
                                 {
                                   showToast(state.msg);
                                 }
                               }),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height / 20,
                                ),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: BlackArrowBack,
                                        fontSize: 14,
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: "Already Have an Account?  ",
                                          style: TextStyle(
                                            color: textcolor
                                          )
                                        ),
                                        TextSpan(
                                            text: "Login",
                                            style: TextStyle(
                                              color: maincolor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                NavigationService
                                                    .instance.navigationKey!.currentState!
                                                    .pushNamed(
                                                  "LoginScreen",
                                                );                                              }),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: SvgPicture.asset(
                              'assets/images/1.svg',
                              height: MediaQuery.of(context).size.height / 10.0,
                            ),
                          ),
                        ],
                      )),
                ),
              ),

            ],
          ),
        ),);
  }
}
