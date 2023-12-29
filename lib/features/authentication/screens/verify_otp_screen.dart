// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pin_code_fields/pin_code_fields.dart';

// Project imports:
import 'package:gide/core/components/custom_back_button.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/components/normal_text_form_field.dart';
import 'package:gide/core/helpers/regex_validation.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/authentication/screens/reset_password_screen.dart';
import 'package:gide/features/authentication/widgets/pin_text_field.dart';
import '../../../../../core/configs/configs.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const routeName = "verify_otp_screen";
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailTextController = TextEditingController();
  bool emailIsValidated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
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
                    Text("Verify OTP",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                    SpaceY(8.dy),
                    Padding(
                      padding: EdgeInsets.only(right: 30.dx),
                      child: Text("Enter your OTP code here",
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff667085))),
                    ),
                    SpaceY(40.dy),
                    PinTextField(
                        errorController: errorController,
                        pinController: controller),
                    SpaceY(40.dy),
                    CustomElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.validate();
                          if (controller.text.length != 6) {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                          } else {
                            //!verified: send api request
                            moveAndClearStack(
                                context: context,
                                page: ResetPasswordScreen.routeName);
                          }
                        },
                        buttonText: "Verify OTP"),
                  ],
                ),
              ))),
    );
  }
}
