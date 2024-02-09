// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/features/authentication/screens/forgot_password_screen.dart';
import 'package:gide/features/authentication/screens/interest_screen.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import 'package:gide/features/authentication/screens/reset_password_screen.dart';
import 'package:gide/features/authentication/screens/sign_in_screen.dart';
import 'package:gide/features/authentication/screens/sign_up_screen.dart';
import 'package:gide/features/authentication/screens/splash_screen.dart';
import 'package:gide/features/authentication/screens/verify_otp_screen.dart';
import 'package:gide/features/dashboard/explore/screens/checkout_screen.dart';
import 'package:gide/features/dashboard/explore/screens/course_detail_screen.dart';
import 'package:gide/features/dashboard/explore/screens/pay_with_card.dart';
import 'package:gide/features/dashboard/explore/screens/pay_with_earnings.dart';
import 'package:gide/features/dashboard/explore/screens/pay_with_saving.dart';
import 'package:gide/features/dashboard/explore/screens/payment_success_screen.dart';
import 'package:gide/features/dashboard/explore/widgets/checkout_course.dart';
import 'package:gide/features/dashboard/profile/screens/add_number.dart';
import 'package:gide/features/dashboard/profile/screens/become_an_instructor.dart';
import 'package:gide/features/dashboard/profile/screens/change_password.dart';
import 'package:gide/features/dashboard/profile/screens/edit_personal_details_screen.dart';
import 'package:gide/features/dashboard/wallet/screens/fund_account_screen.dart';
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
        return MaterialPageRoute(
            builder: (_) => InterestScreen(
                categoryList: settings.arguments as List<CategoryResp>?));

      case CustomNavigationBar.routeName:
        return MaterialPageRoute(
          builder: (_) => CustomNavigationBar(
            index: settings.arguments as int?,
          ),
        );
      case VerifyOTPScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerifyOTPScreen());
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case CourseDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => CourseDetailScreen(
                  courseId: settings.arguments as String,
                  hasEnrolled: false,
                ));
      case CheckoutScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => CheckoutScreen(
                  model: settings.arguments as CheckOutCourseModel,
                ));
      case FundAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FundAccountScreen());
      case EditPersonalDetailsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const EditPersonalDetailsScreen());
      case ChangePassword.routeName:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case AddNumber.routeName:
        return MaterialPageRoute(builder: (_) => const AddNumber());
      case PayWithCard.routeName:
        return MaterialPageRoute(
            builder: (_) => PayWithCard(
                  courseId: settings.arguments as String,
                ));
      case PayWithEarning.routeName:
        return MaterialPageRoute(
            builder: (_) => PayWithEarning(
                  courseId: settings.arguments as String,
                ));
      case BecomeAnInstructor.routeName:
        return MaterialPageRoute(builder: (_) => const BecomeAnInstructor());
      case PayWithSaving.routeName:
        return MaterialPageRoute(
            builder: (_) => PayWithSaving(
                  courseId: settings.arguments as String,
                ));
      case PaymentSuccessScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
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
