// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import 'package:gide/features/dashboard/profile/model/change_password_model.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_notifier.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import '../../../../core/router/router.dart';

class ChangePassword extends ConsumerStatefulWidget {
  static const routeName = "changePassword";
  const ChangePassword({super.key});

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final oldPassWord = TextEditingController();
  final newPassWord = TextEditingController();
  final confirmPassWord = TextEditingController();
  bool showPassword = true;
  bool showNewPassWord = true;
  bool showConfPassWord = true;
  void navToHome() {
    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (next.loadState == LoadState.success) {
        moveAndClearStack(context: context, page: SignInScreen.routeName);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);
    navToHome();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Form(
          child: Column(
            children: [
              SpaceY(56.dy),
              PasswordTextFormField(
                  hidePassword: showPassword,
                  labelText: "Old Password",
                  suffixFunction: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  controller: oldPassWord,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              SpaceY(16.dy),
              PasswordTextFormField(
                  hidePassword: showNewPassWord,
                  labelText: "New Password",
                  suffixFunction: () {
                    setState(() {
                      showNewPassWord = !showNewPassWord;
                    });
                  },
                  controller: newPassWord,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              SpaceY(16.dy),
              PasswordTextFormField(
                  hidePassword: showConfPassWord,
                  labelText: "Confirm New Password",
                  suffixFunction: () {
                    setState(() {
                      showConfPassWord = !showConfPassWord;
                    });
                  },
                  controller: confirmPassWord,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    if (newPassWord.text != confirmPassWord.text) {
                      return 'Password do not match';
                    }
                    return null;
                  }),
              SpaceY(40.dy),
              CustomElevatedButton(
                  onPressed: () async {
                    // if (_formKey.currentState!.validate()) {
                    final data = ChangePasswordModel(
                        confirmPassword: confirmPassWord.text.trim(),
                        newPassword: newPassWord.text.trim(),
                        oldPassword: oldPassWord.text.trim());
                    await notifier.changePwd(data);
                    // }
                  },
                  isLoading: state.loadState == LoadState.loading,
                  buttonText: "Update Password")
            ],
          ),
        ),
      ),
    );
  }
}
