import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';
import '../../../../core/router/router.dart';

class PayWithEarning extends StatefulWidget {
  static const routeName = "pay_with_earning";
  const PayWithEarning({super.key});

  @override
  State<PayWithEarning> createState() => _PayWithEarningState();
}

class _PayWithEarningState extends State<PayWithEarning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding:  EdgeInsets.symmetric(horizontal: 20.dx),
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
              color: Color(0xffF2F4F7)
            ),
            padding: EdgeInsets.symmetric(horizontal: 7.5.dx,vertical: 8.dy),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: kWhite,
                  child: Image.asset(AssetsImages.gift,height: 15.dy, width: 15.dx,)),
                Flexible(
                  child: Text("5000 points ",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: kTextColorsLight)),
                ),
              ],
            ),
          ),
              ],
            ),
            SpaceY(60),
            Text("Development has been paused",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: kTextColorsLight)),
          ],
        ),
      ),
    );
  }
}