// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/regex_validation.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/features/authentication/model/login_model.dart';
import 'package:gide/features/authentication/notifier/auth_notifier.dart';
import 'package:gide/features/authentication/notifier/auth_state.dart';
import 'package:gide/features/authentication/screens/forgot_password_screen.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import 'package:gide/features/authentication/screens/sign_up_screen.dart';
import 'package:gide/features/dashboard/custom_navigation_bar.dart';
import '../../../core/components/components.dart';
import '../../../core/router/router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeName = "signInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
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
    navToHome();
    final state = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        leading: CustomBackButton(onTap: () {
          moveAndClearStack(context: context, page: OnboardingScreen.routeName);
        }),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColorsLight)),
                  SpaceY(8.dy),
                  Text("Keep learning something new everyday.",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff667085))),
                  SpaceY(40.dy),
                  NormalTextFormField(
                    controller: emailTextController,
                    keyboardType: TextInputType.emailAddress,
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
                  SpaceY(16.dy),
                  //! Password textfield
                  PasswordTextFormField(
                    keyboardType: TextInputType.visiblePassword,
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
                        // if (passwordTextController.text.containsUpperCase()) {
                        //   setState(() {
                        //     containsUpperCase = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     containsUpperCase = false;
                        //   });
                        // }
                        // if (passwordTextController.text.containsLowerCase()) {
                        //   setState(() {
                        //     containsLowerCase = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     containsLowerCase = false;
                        //   });
                        // }
                        // if (passwordTextController.text
                        //     .containsSpecialChars()) {
                        //   setState(() {
                        //     containsSpecialChars = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     containsSpecialChars = false;
                        //   });
                        // }
                        // if (passwordTextController.text.passwordValidator()) {
                        //   setState(() {
                        //     passwordIsValid = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     passwordIsValid = false;
                        //   });
                        // }
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 7) {
                        return 'Password must be up to 8 ';
                      }
                      // if (!passwordTextController.text.containsSpecialChars()) {
                      //   return "Please enter a special character";
                      // }
                      // if (!passwordTextController.text.containsLowerCase()) {
                      //   return "Password must contain a lowercase letter";
                      // }
                      // if (!passwordTextController.text.containsUpperCase()) {
                      //   return "Password must contain uppercase letter";
                      // }
                      // if (passwordTextController.text.containsSpace()) {
                      //   return "Space";
                      // }
                      return null;
                    },
                  ),
                  SpaceY(16.dy),
                  GestureDetector(
                    onTap: () {
                      moveToNextScreen(
                          context: context, page: ForgotPassword.routeName);
                    },
                    child: Text("Forgot Password?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor)),
                  ),
                  SpaceY(40.dy),
                  CustomElevatedButton(
                      onPressed: emailIsValidated
                          //  && passwordIsValid
                          ? () {
                              debugLog('In OnPressed');
                              final loginData = LoginModel(
                                  email: emailTextController.text,
                                  password: passwordTextController.text);
                              _formKey.currentState!.validate()
                                  ? notifier.login(loginData)
                                  : null;
                            }
                          : null,
                      isLoading: state.loginLoadState == LoginLoadState.loading,
                      buttonText: "Sign In"),
                  SpaceY(40.dy),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: kTextColorsLight),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: kPrimaryColor,
                                  // decoration: TextDecoration.underline,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                moveAndClearStack(
                                    context: context,
                                    page: SignUpScreen.routeName);
                                // moveToNextScreen(
                                //     context: context,
                                //     page: SignUpScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void navToHome() {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.loginLoadState == LoginLoadState.success) {
        moveAndClearStack(
            context: context, page: CustomNavigationBar.routeName);
        return;
      }
    });
  }
}
