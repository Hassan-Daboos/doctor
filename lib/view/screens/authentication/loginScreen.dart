import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/NavigationService.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/data.dart';
import '../../../viewmodel/cubit/auth_cubit/auth_cubit.dart';
import '../../../viewmodel/cubit/auth_cubit/auth_states.dart';
import '../../../viewmodel/cubit/outh.dart';
import '../../component/app_component/custom_button.dart';
import '../../component/app_component/custom_text.dart';
import '../../component/app_component/custom_text_form_filed.dart';
import '../../component/app_component/maxtextcolor.dart';
import '../../component/app_component/toast.dart';
import '../layouthome/layoutScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context,listen:true);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        // SvgPicture.asset(
                        //   'assets/images/Logo.svg',
                        //   semanticsLabel: ' Logo',
                        //   height: MediaQuery.of(context).size.height / 20.0,
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        const CustomMaxColorText(
                          fristtext: 'Welcome',
                          secondtext: 'Back!',
                        ),
                        CustomText(
                          text: 'Login',
                          fontSize: 20,
                          color: textcolor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        TextFormFieldsCustom(
                          controller: emailController,
                          hintText: "email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "email must be not Empty";
                            } else if (!RegExp(validatorEmail)
                                .hasMatch(value.trim())) {
                              return "email is not Valid";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormFieldsCustom(
                            controller: passwordController,
                            hintText: "Password",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            isPassword: true,
                            suffixIcon: Icons.remove_red_eye,
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: maincolor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 90,
                        ),
                        BlocConsumer<AuthCubit,AuthStates>(builder: (context,state)
                        {
                          return  state is ! UserLoginLoading ?Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton(
                              widget: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15),
                                child: CustomText(
                                  text: 'Login',
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              buttonColor: maincolor,
                              borderRadius: 7,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil('LayoutScreen', (Route<dynamic> route) => false);
                                // Authentication.mailSignIn("hassan@gmail.com","H@ssan123");
                                // if (formKey.currentState!.validate()) {
                                //   print("objectvald");
                                // }
                                authCubit.loginUser(email: emailController.text, password: passwordController.text);
                              },
                            ),
                          ):Center(child: CircularProgressIndicator());
                        }, listener: (context,state){
                          if(state is UserLoginSuccess)
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutScreen()));
                          }if(state is UserLoginError)
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
                                  text: "Don't Have an account? ",
                                  style: TextStyle(
                                    color: textcolor
                                  )
                                ),
                                TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: maincolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                       Navigator.pushReplacementNamed(context, 'SignupScreen');                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
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
        ),
      ),
    )
    );
  }
}
