import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
import '../../../../constant/data.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/custom_text_form_filed.dart';

class editprofileScreen extends StatefulWidget {
  const editprofileScreen({Key? key}) : super(key: key);

  @override
  State<editprofileScreen> createState() => _editprofileScreenState();
}

class _editprofileScreenState extends State<editprofileScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              } else if (RegExp(validatorEmail)
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: CustomText(
                                text: "Edit Profile",
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buttonColor: maincolor,
                            borderRadius: 7,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print("objectvald");
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
