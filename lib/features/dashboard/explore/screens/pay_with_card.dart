// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/router/router.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import 'payment_success_screen.dart';

class PayWithCard extends StatefulWidget {
  static const routeName = "payWithCard";
  const PayWithCard({super.key});

  @override
  State<PayWithCard> createState() => _PayWithCardState();
}

class _PayWithCardState extends State<PayWithCard> {
  final cardNumberController = TextEditingController();
  bool saveCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        title: Text("Pay with card",
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
            NormalTextFormField(
                hintText: "xxxx xxxx xxxx xxxx",
                labelText: "Card Number",
                controller: cardNumberController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  }
                  return null;
                }),
            SpaceY(16.dy),
            Row(
              children: [
                Expanded(
                  child: NormalTextFormField(
                      width: 170,
                      hintText: "MM/YY",
                      labelText: "Expiry Date",
                      controller: cardNumberController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        }
                        return null;
                      }),
                ),
                SpaceX(10.dx),
                Expanded(
                  child: NormalTextFormField(
                      width: 170,
                      hintText: "XXX",
                      labelText: "CVV",
                      controller: cardNumberController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        }
                        return null;
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox.adaptive(
                    value: saveCard,
                    onChanged: (value) {
                      setState(() {
                        saveCard = !saveCard;
                      });
                    }),
                Text("Fund Account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: kTextColorsLight)),
              ],
            ),
            SpaceY(40.dy),
            CustomElevatedButton(
                onPressed: saveCard
                    ? () {
                        moveToNextScreen(
                            context: context,
                            page: PaymentSuccessScreen.routeName);
                      }
                    : null,
                buttonText: "Proceed To Payment"),
          ],
        ),
      ),
    );
  }
}
