// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/components/alerts.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/explore/widgets/checkout_course.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = "checkout_screen";
  const CheckoutScreen({super.key, required this.model});
  final CheckOutCourseModel model;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
      ),
      body: Column(
        children: [
          SpaceY(33.dy),
          Text("Course check out",
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorsLight)),
          SpaceY(40.dy),
          Container(
            height: 335.dy,
            width: 335.dx,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 25.dx),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage(AssetsImages
                    .checkoutBackground), // Replace with your image path
                fit: BoxFit
                    .cover, // You can adjust the BoxFit to your preference
              ),
            ),
            child: Center(
                child: CheckoutCourses(
              model: widget.model,
            )),
          ),
          SpaceY(40.dy),
          CustomElevatedButton(
              onPressed: () {
                showPaymentOption(
                    context: context,
                    onPressed: () {},
                    price: (widget.model.price).toString());
              },
              buttonText: "Pay now - \$${widget.model.price}")
        ],
      ),
    );
  }
}
