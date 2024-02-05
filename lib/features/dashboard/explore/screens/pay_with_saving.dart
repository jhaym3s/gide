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

class PayWithSaving extends StatefulWidget {
  static const routeName = "payWithSaving";
  const PayWithSaving({super.key, required this.courseId});
  final String courseId;
  @override
  State<PayWithSaving> createState() => _PayWithSavingState();
}

class _PayWithSavingState extends State<PayWithSaving> {
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        title: Text("Pay with savings",
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: const Color(0xffF2F4F7)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.dx, vertical: 12.dy),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      SpaceX(8.dx),
                      const Icon(
                        Icons.visibility_off,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SpaceY(16.dy),
            CustomTextFieldWithoutLabel(
              hintText: "Input amount",
              controller: amountController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),
            SpaceY(8.dy),
            RichText(
              text: TextSpan(
                text: '*',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffD92D20)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Will be deducted from your balance',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff98A2B3))),
                ],
              ),
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
