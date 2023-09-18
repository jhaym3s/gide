import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/wallet/screens/fund_account_screen.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key, required this.viewAmount
  });
  final bool viewAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.dy, width: 349.dx,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffF2F4F7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Available Balance",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
          SpaceY(4.dy),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(viewAmount?"\$0.0":"*****",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kTextColorsLight)),
              ),
              SpaceX(8.dx),
            Icon(viewAmount?Icons.visibility_off:Icons.visibility)
            ],
          ),
          SpaceY(15.dy),
          GestureDetector(
            onTap: () {
              moveFromBottomNavBarScreen(context: context, targetScreen: const FundAccountScreen());
            },
            child: Container(
              height: 32.dy, width: 114.dx,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kPrimaryColor, ),
                ),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            const Icon(Icons.add_circle_outline_sharp, color: kPrimaryColor,size: 16,),
            Text("Add Money",
            // softWrap: true,
            // overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor)),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}

class RewardBalanceCard extends StatelessWidget {
  const RewardBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.dy, width: 349.dx,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffF2F4F7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Reward Balance",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
          SpaceY(4.dy),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF9FAFB)
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.dx,vertical: 6.dy),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(0xffE5F2FF),
                  child: Image.asset(AssetsImages.gift,height: 15.dy, width: 15.dx,)),
                Flexible(
                  child: Text("5000 points ",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                ),
              ],
            ),
          ),
          SpaceY(12.dy),
          Text("500 points = \$5 ",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor))
          
        ],
      ),
    );
  }
}