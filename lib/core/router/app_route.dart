import 'package:flutter/material.dart';
import 'package:gide/features/authentication/screens/forgot_password_screen.dart';
import 'package:gide/features/authentication/screens/interest_screen.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import 'package:gide/features/authentication/screens/sign_up_screen.dart';
import 'package:gide/features/authentication/screens/splash_screen.dart';
import 'package:gide/features/dashboard/explore/screens/checkout_screen.dart';
import 'package:gide/features/dashboard/explore/screens/course_detail_screen.dart';

import '../../features/dashboard/custom_navigation_bar.dart';

class AppRouter {
  static Route onGenerated(RouteSettings settings) {
    //print("Route name is ${settings.name}");
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
         case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
         case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
         case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
         case ForgotPassword.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
        case InterestScreen.routeName:
        return MaterialPageRoute(builder: (_) => const InterestScreen());
        case CustomNavigationBar.routeName:
        return MaterialPageRoute(builder: (_) => const CustomNavigationBar());
        case CourseDetailScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CourseDetailScreen());
        case CheckoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      default:
        return onError();
    }
  }

  static Route onError() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text(
                  "Error Screen",
                  style: Theme.of(_).textTheme.displayLarge,
                ),
              ),
            ));
  }
}
