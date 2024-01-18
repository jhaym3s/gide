// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/features/dashboard/learning/notifiers/enroll_notifier.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../../../core/router/router.dart';
import 'payment_success_screen.dart';

class PayWithEarning extends StatefulWidget {
  static const routeName = "pay_with_earning";
  const PayWithEarning({super.key, required this.courseId});
  final String courseId;
  @override
  State<PayWithEarning> createState() => _PayWithEarningState();
}

class _PayWithEarningState extends State<PayWithEarning> {
  final amountController = TextEditingController();
  final processAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        title: Text("Pay with earnings",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            SpaceY(64.dy),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reward Balance",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF2F4F7)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 7.5.dx, vertical: 8.dy),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: kWhite,
                          child: Image.asset(
                            AssetsImages.gift,
                            height: 15.dy,
                            width: 15.dx,
                          )),
                      Flexible(
                        child: Text("5000 points ",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kTextColorsLight)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SpaceY(16.dy),
            CustomTextFieldWithoutLabel(
              suffixIcon: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.dx, vertical: 19.dy),
                child: Text("Points",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD0D5DD))),
              ),
              hintText: "Enter the amount",
              controller: amountController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
            SpaceY(6.dy),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AssetsImages.swap,
                  height: 20.dy,
                  width: 20.dx,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.dx, vertical: 7.5.dy),
                  color: const Color(0xffF2F4F7),
                  child: Text("500 points = \$5 ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor)),
                )
              ],
            ),
            SpaceY(18.dy),
            CustomTextFieldWithoutLabel(
              suffixIcon: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.dx, vertical: 19.dy),
                child: Text("\$0",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD0D5DD))),
              ),
              hintText: "Processed amount",
              controller: processAmountController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
            SpaceY(40.dy),
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(enrollProv);
              final notifier = ref.read(enrollProv.notifier);
              return CustomElevatedButton(
                  isLoading: state.loadState == LoadState.loading,
                  onPressed: () async {
                    //! update this to only send and nav if payment is was successful
                    await notifier.createEnroll(courseId: widget.courseId);
                    moveToNextScreen(
                        context: context, page: PaymentSuccessScreen.routeName);
                  },
                  buttonText: "Proceed to payment");
            })
          ],
        ),
      ),
    );
  }
}
