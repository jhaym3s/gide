import 'package:flutter/material.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';

import '../../../../core/router/router.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = "changePassword";
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPassWord = TextEditingController();
  final newPassWord = TextEditingController();
  final confirmPassWord = TextEditingController();
  bool showPassword = true;
  bool showNewPassWord = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("Change Password",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            PasswordTextFormField(hidePassword: showPassword, labelText: "Old Password", suffixFunction: (){
              setState(() {
                showPassword = !showPassword;
              });
            }, controller: oldPassWord, validator: (String? value){
              if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
            }),
            SpaceY(16.dy),
            PasswordTextFormField(hidePassword: showNewPassWord, labelText: "New Password", suffixFunction: (){
              setState(() {
                showNewPassWord = !showNewPassWord;
              });
            }, controller: newPassWord, validator: (String? value){
              if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
            }),
            SpaceY(16.dy),
            PasswordTextFormField(hidePassword: showNewPassWord, labelText: "Confirm New Password", suffixFunction: (){
              setState(() {
                showNewPassWord = !showNewPassWord;
              });
            }, controller: confirmPassWord, validator: (String? value){
              if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
            }),
            SpaceY(40.dy),
            CustomElevatedButton(onPressed: (){}, buttonText: "Update Password")
          ],
        ),
      ),
    );
  }
}