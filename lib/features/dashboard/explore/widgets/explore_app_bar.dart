// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      var hour = DateTime.now().hour;

      if (hour < 12) {
        return 'Good Morning';
      } else if (hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getGreeting(),
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff667085))),
            SpaceY(2.dy),
            Consumer(builder: (context, ref, _) {
              final userData = ref.watch(currentUserProvider);
              return Text(userData.fullName ?? '',
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: kTextColorsLight));
            }),
          ],
        ),
      ],
    );
  }
}
