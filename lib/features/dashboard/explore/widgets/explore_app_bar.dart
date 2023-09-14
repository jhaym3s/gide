import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
          "Good morning",
          textAlign: TextAlign.left,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff667085))),
          SpaceY(2.dy),
             Text(
          kDummyName,
          textAlign: TextAlign.left,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: kTextColorsLight)),
          ],
        ),
        const Icon(Icons.notifications),
      ],
    );
  }
}