import 'package:flutter/material.dart';
import 'package:gide/core/components/custom_back_button.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/components/normal_text_form_field.dart';
import 'package:gide/core/helpers/regex_validation.dart';
import 'package:gide/core/router/router.dart';
import '../../../../../core/configs/configs.dart';

//? move here from sign in
class ForgotPassword extends StatefulWidget {
  static const routeName = "forgot_password_screen";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailTextController = TextEditingController();
  bool emailIsValidated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Text("Forgot password?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24.sp, fontWeight: FontWeight.w500,color: kTextColorsLight)),
                    SpaceY(8.dy),
                    Padding(
                      padding: EdgeInsets.only(right: 30.dx),
                      child: Text(
                          "Enter your email address below to receive password reset instructions.",
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff667085))),
                    ),
                    SpaceY(40.dy),
                    NormalTextFormField(
                      controller: emailTextController,
                      labelText: "Email address",
                      hintText: kDummyEmail,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value){
                        emailTextController.addListener(() {
                          if(emailTextController.text.emailIsValidated()){
                              setState(() {
                                emailIsValidated = true;
                              });
                          }else{
                            setState(() {
                              emailIsValidated = false;
                            });
                          }
                         });
                      },
                    ),
                    SpaceY(40.dy),
                    CustomElevatedButton(
                        onPressed: 
                        emailIsValidated ?() {
                          
                        }: null,
                        buttonText: "Send Password"),
                  ],
                ),
              ))),
    );
  }
}
