// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/regex_validation.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/authentication/notifier/auth_notifier.dart';
import 'package:gide/features/authentication/notifier/auth_state.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import '../../../core/components/components.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "reset-password-screen";
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final confimPasswController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool eightChars = false;
  bool containsUpperCase = false;
  bool containsSpecialChars = false;
  bool containsLowerCase = false;
  bool hidePassword = true;
  bool hidePassword1 = true;
  bool passwordIsValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          // moveAndClearStack(context: context, page: OnboardingScreen.routeName);
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dx),
                  child: Text("Reset your password",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColorsLight)),
                ),
                SpaceY(8.dy),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dx),
                  child: Text(
                      "Enter your new password below. We are just been extra safe",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff667085))),
                ),
                SpaceY(40.dy),
                const Divider(
                  height: 4,
                  color: Color(0xffEAECF0),
                ),

                //! Password textfield
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.dx, vertical: 10.dy),
                  child: PasswordTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordTextController,
                    hintText: kDummyPassword,
                    hidePassword: hidePassword,
                    labelText: "New Password",
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
                      if (passwordTextController.text.containsSpace()) {
                        return "Space";
                      }
                      return null;
                    },
                  ),
                ),
                //! confirm Password textfield
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.dx, vertical: 10.dy),
                  child: PasswordTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: confimPasswController,
                    hintText: kDummyPassword,
                    hidePassword: hidePassword1,
                    labelText: "Confirm Password",
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    suffixFunction: () {
                      setState(() {
                        hidePassword1 = !hidePassword1;
                      });
                    },
                    onChanged: (value) {
                      confimPasswController.addListener(() {
                        if (confimPasswController.text.length >= 8) {
                          setState(() {
                            eightChars = true;
                          });
                        } else {
                          setState(() {
                            eightChars = false;
                          });
                        }
                        if (confimPasswController.text.containsUpperCase()) {
                          setState(() {
                            containsUpperCase = true;
                          });
                        } else {
                          setState(() {
                            containsUpperCase = false;
                          });
                        }
                        if (confimPasswController.text.containsLowerCase()) {
                          setState(() {
                            containsLowerCase = true;
                          });
                        } else {
                          setState(() {
                            containsLowerCase = false;
                          });
                        }
                        if (confimPasswController.text.containsSpecialChars()) {
                          setState(() {
                            containsSpecialChars = true;
                          });
                        } else {
                          setState(() {
                            containsSpecialChars = false;
                          });
                        }
                        if (confimPasswController.text.passwordValidator()) {
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
                      if (!confimPasswController.text.containsSpecialChars()) {
                        return "Please enter a special character";
                      }
                      if (!confimPasswController.text.containsLowerCase()) {
                        return "Password must contain a lowercase letter";
                      }
                      if (!confimPasswController.text.containsUpperCase()) {
                        return "Password must contain uppercase letter";
                      }
                      if (confimPasswController.text.containsSpace()) {
                        return "Space";
                      }
                      return null;
                    },
                  ),
                ),
                SpaceY(40.dy),
                Consumer(builder: (context, ref, child) {
                  final notifier = ref.read(authProvider.notifier);
                  final state = ref.watch(authProvider);

                  void navToSignIn() {
                    ref.listen<AuthState>(authProvider, (previous, next) {
                      if (next.loadState == LoadState.success) {
                        moveAndClearStack(
                            context: context, page: SignInScreen.routeName);
                        return;
                      }
                    });
                  }

                  navToSignIn();

                  return CustomElevatedButton(
                      onPressed: (confimPasswController.text ==
                              passwordTextController.text)
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                notifier.resetPwd(
                                    password: passwordTextController.text,
                                    confPasswd: confimPasswController.text);
                              }
                            }
                          : null,
                      isLoading: state.loadState == LoadState.loading,
                      buttonText: "Reset Password");
                }),
                SpaceY(40.dy),
              ],
            )),
      ),
    );
  }
}
