import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/configs/images.dart';

import '../../../../core/components/components.dart';
import '../../../../core/router/router.dart';
import '../../custom_navigation_bar.dart';

class PaymentSuccessScreen extends StatefulWidget {
  static const routeName = "payment_success_Screen";
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsImages.success,
            height: 120.dy,
            width: 120.dx,
          ),
          SpaceY(16.dy),
          Text("Payment successful",
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
          SpaceY(16.dy),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Your payment for ',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: kGrey),
              children: <TextSpan>[
                TextSpan(
                    text: 'Quick steps to Figma ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color:kTextColorsLight)),
                TextSpan(
                    text: 'design course has been confirmed.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color:kGrey)),
              ],
            ),
          ),
          SpaceY(40.dy),
          CustomElevatedButton(
              onPressed: () {
                moveAndClearStack(
                    context: context, page: CustomNavigationBar.routeName);
              },
              buttonText: "Start course"),
        ],
      ),
    );
  }
}
