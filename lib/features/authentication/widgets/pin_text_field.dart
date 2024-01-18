// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/configs/constants.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/authentication/notifier/auth_notifier.dart';
import 'package:gide/features/authentication/notifier/auth_state.dart';
import 'package:gide/features/authentication/screens/reset_password_screen.dart';

class PinTextField extends ConsumerWidget {
  const PinTextField({super.key, this.errorController, this.pinController});
  final StreamController<ErrorAnimationType>? errorController;
  final TextEditingController? pinController;

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.read(authProvider.notifier);
    void navToNextScreen() {
      ref.listen<AuthState>(authProvider, (previous, next) {
        if (next.loadState == LoadState.success) {
          moveAndClearStack(
              context: context, page: ResetPasswordScreen.routeName);
          return;
        }
      });
    }

    navToNextScreen();
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoDismissKeyboard: true,
      enableActiveFill: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) {},
      onCompleted: (value) {
        debugPrint('OTP value: $value');
        notifier.verifyOtp(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if (v!.length < 5) {
          return "Field not complete";
        } else {
          return null;
        }
      },
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      pinTheme: PinTheme(
        fieldHeight: (47),
        fieldWidth: (47),
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular((11)),
        selectedFillColor: Colors.white12,
        activeFillColor: Colors.white12,
        inactiveFillColor: Colors.white12,
        inactiveColor: Colors.blue.withOpacity(0.3),
        selectedColor: kPrimaryColor,
        activeColor: Colors.blue,
      ),
      beforeTextPaste: (text) {
        debugPrint('POP UP');
        return true;
      },
      errorAnimationController: errorController,
      controller: pinController,
    );
  }
}
