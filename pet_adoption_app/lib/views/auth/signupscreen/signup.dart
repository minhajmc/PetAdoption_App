

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/viewmodels/auth_provider/register_provider.dart';
import 'package:pet_adoption_app/views/auth/loginscreen/login.dart';
import 'package:pet_adoption_app/views/commonscreens/loading_animation.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/authwidgets/pawImagewithText.dart';
import 'package:pet_adoption_app/widgets/authwidgets/snackbar.dart';
import 'package:pet_adoption_app/widgets/authwidgets/textbutton.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textFormFieldWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';

class Regscreen extends StatefulWidget {
const  Regscreen({super.key});

  @override
  State<Regscreen> createState() => _RegscreenState();
}

class _RegscreenState extends State<Regscreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final nameFocusNode = FocusNode();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  final confirmPasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF5F0E6),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.only(top: 10.r),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const PawImagewithText(),
                    Lottie.asset(
                        "assets/registerImages/animation/Animation - 1744004189946.json",
                        alignment: Alignment.topCenter,
                        repeat: true,
                        height: constraints.maxWidth <= 360 ? 150.h : 200.h,
                        width: 200.w),
                    TextWidget(
                        words: "Create Account",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            constraints.maxWidth <= 360 ? 40.spMin : 50.spMin),
                    SizedBox(
                      height: constraints.maxWidth <= 360 ? 10.h : 20.h,
                    ),
                    Padding(
                      padding: constraints.maxWidth <= 360
                          ? EdgeInsets.only(right: 40.w, left: 40.w)
                          : EdgeInsets.only(right: 30.w, left: 30.w),
                      child: Column(
                        children: [
                          Textformfieldwidget(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            focusNode: nameFocusNode,
                            hintText: "Full Name",
                            icons: Icons.email_outlined,
                            isPassword: false,
                            whereToFocus: emailFocusNode,
                          ),
                          SizedBox(
                            height: constraints.maxWidth <= 360 ? 10.h : 30.h,
                          ),
                          Textformfieldwidget(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            hintText: "Email",
                            icons: Icons.email_outlined,
                            isPassword: false,
                            whereToFocus: passwordFocusNode,
                          ),
                          SizedBox(
                            height: constraints.maxWidth <= 360 ? 10.h : 30.h,
                          ),
                          Textformfieldwidget(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: passwordFocusNode,
                            hintText: "Password",
                            icons: Icons.lock_outline_rounded,
                            isPassword: true,
                            whereToFocus: confirmPasswordFocusNode,
                          ),
                          SizedBox(
                            height: constraints.maxWidth <= 360 ? 10.h : 30.h,
                          ),
                          Textformfieldwidget(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: confirmPasswordFocusNode,
                            hintText: "Confirm Password",
                            icons: Icons.lock_outline_rounded,
                            isPassword: true,
                            ogPassword: passwordController,
                          ),
                          SizedBox(
                            height: constraints.maxWidth <= 360 ? 30.h : 40.h,
                          ),
                          ElevatedButtonWidget(
                            text: "SIGN UP",
                            height: 0.07.sh,
                            width: 1.sw,
                            elevation: 7,
                            backgroundColor: 0xFFFF8E3C,
                            borderColor: 0xFFFF8E3C,
                            fontSize: 20,
                            textColor: Colors.black,
                            borderRadius: 10,
                            tap: () async {
                              final regProvider = Provider.of<RegisterProvider>(
                                  context,
                                  listen: false);
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>const LoadingAnimation(
                                            text: "Creating your account....",
                                            path:
                                                "assets/registerImages/animation/Animation - 1744131570858.json")));
                                await regProvider.registerUser(
                                    emailController.text,
                                    nameController.text,
                                    passwordController.text);

                                Navigator.pop(context);

                                if (regProvider.isRegistered == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>const LoginScreen(),
                                      ));
                                  snackbar(context, regProvider.errorMessage,
                                      0xFF6BCB77,Icons.check_circle_outline_outlined);
                                } else {
                                  snackbar(context, regProvider.errorMessage,
                                      0xFFE63946,Icons.close_rounded);
                                }
                              } else {
                                snackbar(
                                    context,
                                    "Oops! All fields are required",
                                    0xFFFF8E3C,Icons.close_rounded);
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextbuttonAuth(
                            text: "Already have a account?",
                            buttonText: "Login",
                            navigateTo:const LoginScreen(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
