import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/regex_validation.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/authentication/screens/interest_screen.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';

import '../../../core/components/components.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool emailIsValidated = false;
  bool eightChars = false;
  bool containsUpperCase = false;
  bool containsSpecialChars = false;
  bool containsLowerCase = false;
  bool hidePassword = true;
  bool passwordIsValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveAndClearStack(context: context, page: OnboardingScreen.routeName);
        }),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                  child: Text("Create your account",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColorsLight)),
                ),
                SpaceY(8.dy),
                Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                  child: Text("Lets get your account started in few steps.",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff667085))),
                ),
                SpaceY(40.dy),
                const Divider(height: 4,color: Color(0xffEAECF0),),
                SpaceY(40.dy),
                Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                  child: NormalTextFormField(
                    controller: nameTextController,
                    labelText: "Full Name",
                    hintText: kDummyName,
                    inputFormatters: const [],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                
                  ),
                ),
                SpaceY(16.dy),
                Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                  child: NormalTextFormField(
                    controller: emailTextController,
                    labelText: "Email address",
                    hintText: kDummyEmail,
                    inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      ],
                    onChanged: (value) {
                      emailTextController.addListener(() {
                        if (emailTextController.text.emailIsValidated()) {
                          setState(() {
                            emailIsValidated = true;
                          });
                        } else {
                          setState(() {
                            emailIsValidated = false;
                          });
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SpaceY(16.dy),
                //! Password textfield
                Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                  child: PasswordTextFormField(
                    //keyboardType: TextInputType.phone,
                    controller: passwordTextController,
                    hintText: kDummyPassword,
                    hidePassword: hidePassword,
                    labelText: "Password",
                    inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      ],
                    suffixFunction: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    onChanged: (value) {
                      passwordTextController.addListener(() {
                        if (passwordTextController.text.length >= 8) {
                          setState(() {
                            eightChars = true;
                          });
                        } else {
                          setState(() {
                            eightChars = false;
                          });
                        }
                        if (passwordTextController.text.containsUpperCase()) {
                          setState(() {
                            containsUpperCase = true;
                          });
                        } else {
                          setState(() {
                            containsUpperCase = false;
                          });
                        }
                        if (passwordTextController.text.containsLowerCase()) {
                          setState(() {
                            containsLowerCase = true;
                          });
                        } else {
                          setState(() {
                            containsLowerCase = false;
                          });
                        }
                        if (passwordTextController.text
                            .containsSpecialChars()) {
                          setState(() {
                            containsSpecialChars = true;
                          });
                        } else {
                          setState(() {
                            containsSpecialChars = false;
                          });
                        }
                        if (passwordTextController.text.passwordValidator()) {
                          setState(() {
                            passwordIsValid = true;
                          });
                        } else {
                          setState(() {
                            passwordIsValid = false;
                          });
                        }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!passwordTextController.text.containsSpecialChars()) {
                        return "Please enter a special character";
                      }
                      if (!passwordTextController.text.containsLowerCase()) {
                        return "Password must contain a lowercase letter";
                      }
                      if (!passwordTextController.text.containsUpperCase()) {
                        return "Password must contain uppercase letter";
                      }
                      if(passwordTextController.text.containsSpace()){
                        return "Space";
                      }
                      return null;
                    },
                  ),
                ),
                SpaceY(40.dy),
                CustomElevatedButton(
                    onPressed: emailIsValidated && passwordIsValid
                        ? () {
                          _formKey.currentState!.validate()?
                           Navigator.of(context).pushNamed(InterestScreen.routeName):null;
                          }
                        : null,
                    buttonText: "Sign Up"),
                   SpaceY(40.dy), 
                 Center(child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color(0xff9E9E9E)),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: const Color(0xff007BFF),
                                     // decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    moveAndClearStack(context: context, page: SignInScreen.routeName);
                                    // moveToNextScreen(
                                    //     context: context,
                                    //     page: SignInScreen.routeName);
                                 },
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            )),
      ),
    );
  }
}
