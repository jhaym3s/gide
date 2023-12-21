// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';

class CheckoutCourses extends StatelessWidget {
  const CheckoutCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.dy,
      width: 253.dx,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          //border: Border.all(color: const Color(0xffEAECF0)),
          color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 121.dy,
            width: 253.dx,
            color: kBlack,
          ),
          SpaceY(12.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text("Design",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: kGrey)),
          ),
          SpaceY(6.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text("Quick steps to Figma",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text("With Tom Lingard",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text("8h:20mins . 12 Lessons",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
          ),
        ],
      ),
    );
  }
}
