// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/configs/configs.dart';

class EmptyLearningScreen extends StatelessWidget {
  const EmptyLearningScreen({
    super.key,
    this.onItemClicked,
  });
  final Function(int index)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.emptyLearning,
              height: 120.dy,
              width: 120.dx,
            ),
            SpaceY(16.dy),
            Text("Nothing yet",
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
            SpaceY(8.dy),
            Text(
                "You have not started any course yet. Keep browsing to and learn.",
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
            SpaceY(16.dy),
            CustomElevatedButton(
                onPressed: () {
                  onItemClicked!(0);
                },
                buttonText: "Explore Courses")
          ],
        ),
      ),
    );
  }
}
