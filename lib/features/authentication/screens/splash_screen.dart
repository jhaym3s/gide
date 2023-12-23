// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import 'package:gide/features/authentication/screens/sign_up_screen.dart';
import 'package:gide/features/dashboard/custom_navigation_bar.dart';
import '../../../core/configs/configs.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isFirstTime = true;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationController.forward();
    navigateto();
    // Future.delayed(const Duration(seconds: 5)).then((value) {
    //   moveAndClearStack(context: context, page: OnboardingScreen.routeName);
    //   // Navigator.of(context).(isFirstTime? WelcomeScreen.routeName:CustomNavigationBar.routeName);
    // });
    super.initState();
  }

  navigateto() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      var data = ref.read(userRepoProvider).getCurrentState();
      switch (data) {
        case CurrentState.loggedIn:
          moveAndClearStack(
              context: context, page: CustomNavigationBar.routeName);
          break;
        case CurrentState.onboarded:
          moveAndClearStack(context: context, page: SignUpScreen.routeName);
          break;
        case CurrentState.initial:
          moveAndClearStack(context: context, page: OnboardingScreen.routeName);
          break;
        default:
          moveAndClearStack(context: context, page: SignInScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff007BFF),
      body: Stack(
        children: [
          Container(
              height: kScreenHeight(context),
              width: kScreenWidth(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      AssetsImages.splash), // Replace with your SVG file.
                  fit: BoxFit.cover,
                ),
              ),
              child: ScaleTransition(
                scale: animation,
                child: Center(
                    child: Image.asset(
                  AssetsImages.logo,
                  width: 140.dx,
                  height: 140.dy,
                )),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
