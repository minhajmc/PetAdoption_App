
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/services/sharedprefernces/emailsave.dart';

import 'package:pet_adoption_app/viewmodels/auth_provider/login_provider.dart';
import 'package:pet_adoption_app/views/auth/loginscreen/image.dart';
import 'package:pet_adoption_app/views/auth/signupscreen/signup.dart';
import 'package:pet_adoption_app/views/ui/root_scaffold/rootscaffold.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';

import 'package:pet_adoption_app/widgets/authwidgets/snackbar.dart';
import 'package:pet_adoption_app/widgets/authwidgets/textbutton.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textFormFieldWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final passController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    super.dispose();
  }

//Login Page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Stack(
            children: [
              //image with text

              const ImageLogin(),

              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Padding(
                    padding: constraints.maxWidth <= 360
                        ? EdgeInsets.only(left: 23.w, right: 60.w, top: 0.2.sh)
                        : EdgeInsets.only(left: 23.w, right: 60.w, top: 0.3.sh),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              words: "Login",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 60.spMin),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              words: "Please sign in to continue.",
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp.spMin),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Textformfieldwidget(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocus,
                          hintText: "Email",
                          icons: Icons.email_outlined,
                          whereToFocus: passFocus,
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Textformfieldwidget(
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: passFocus,
                          hintText: "Password",
                          icons: Icons.lock_outline,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                        ElevatedButtonWidget(
                          text: "Login",
                          height: 60.h,
                          width: 1.sw,
                          elevation: 8,
                          backgroundColor: 0xFFFF6B81,
                          borderColor: 0xFFFF6B81,
                          textColor: Colors.white,
                          fontSize: 20.spMin,
                          borderRadius: 13.r,
                          tap: () async {
                            final providerLogin = Provider.of<LoginProvider>(
                                context,
                                listen: false);

                            if (_formKey.currentState!.validate()) {
                              await providerLogin.login(
                                  emailController.text.trim(),
                                  passController.text.trim());

                              if (providerLogin.isLogged == true) {
                                
                                EmailSave.saveEmail(
                                    emailController.text.trim());
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => RootScaffold()));

                                snackbar(context, providerLogin.errorMessage,
                                    0xFF6BCB77,Icons.check_circle_outline_outlined);
                                   
                              } else {
                                snackbar(context, "Login Failed", 0xFFE63946,Icons.close_outlined);
                              }
                            } else {
                              snackbar(context, "Oops! All fields are required",
                                  0xFFFF8E3C,Icons.close_rounded);
                            }
                          },
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        TextbuttonAuth(
                          text: "Don’t have an account?",
                          buttonText: "Sign up",
                          navigateTo: const Regscreen(),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
