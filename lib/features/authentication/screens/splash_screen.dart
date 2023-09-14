import 'package:flutter/material.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/authentication/screens/onboarding.dart';
import '../../../core/configs/configs.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
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
      Future.delayed(const Duration(seconds: 5)).then((value) {
        moveAndClearStack(context: context, page: OnboardingScreen.routeName);
      // Navigator.of(context).(isFirstTime? WelcomeScreen.routeName:CustomNavigationBar.routeName);
      });
      super.initState();
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
                image: AssetImage(AssetsImages.splash), // Replace with your SVG file.
                fit: BoxFit.cover,
              ),
              ),
              child:  ScaleTransition(
                scale: animation,
                child: Center(
                  child: Image.asset(AssetsImages.logo,width: 140.dx,height: 140.dy,)
                ),
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
