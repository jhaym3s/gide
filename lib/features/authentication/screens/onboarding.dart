// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import 'package:gide/features/authentication/screens/sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 300.dy,
            width: 390.dx,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    AssetsImages.onboarding), // Replace with your SVG file.
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: CircleAvatar(
                    radius: 71,
                    backgroundColor: kBlack,
                    child: Image.asset(
                      AssetsImages.logo,
                      width: 140.dx,
                      height: 140.dy,
                    ))),
          ),
          SpaceY(49.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 61.5.dx),
            child: Text("Learn Anytime. Become Skilled. & Gain Rewards",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.5.dx),
            child: Text(
                "Get access to top tech courses, learn very fast and earn points while you learn.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff667085))),
          ),
          SpaceY(32.dy),
          Consumer(builder: (context, ref, _) {
            final notifier = ref.read(userRepoProvider);
            notifier.saveCurrentState(CurrentState.onboarded);
            return CustomElevatedButton(
                onPressed: () {
                  moveToNextScreen(
                      context: context, page: SignUpScreen.routeName);
                },
                buttonText: "Get Started");
          }),
          SpaceY(24.dy),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: kTextColorsLight),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0xff007BFF),
                          // decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        moveAndClearStack(
                            context: context, page: SignInScreen.routeName);
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
    );
  }
}
