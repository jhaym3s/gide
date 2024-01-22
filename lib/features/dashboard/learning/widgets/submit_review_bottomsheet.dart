import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gide/core/components/custom_comment_box.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/components/pop_up.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';

class SendReviewBottomSheet extends StatelessWidget {
  const SendReviewBottomSheet({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.dx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceY(40.dy),
          Center(
            child: Text("Drop a review",
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
          ),
          SpaceY(40.dy),
          CommentTextFormField(
            commentController: commentController,
            hint: 'Your favorite thing about the course',
            labelText: "Drop a message",
          ),
          SpaceY(24.dy),
          Text("How would you rate the course",
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: kTextColorsLight)),
          SpaceY(16.dy),
          RatingBar(
            initialRating: 1,
            minRating: 1,
            maxRating: 5,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: kPrimaryColor),
              half: const Icon(Icons.star_half, color: kPrimaryColor),
              empty: const Icon(Icons.star_border, color: kPrimaryColor),
            ),
            itemSize: 24,
            onRatingUpdate: (rating) {},
          ),
          SpaceY(32.dy),
          CustomElevatedButton(
            buttonText: "Submit Review",
            onPressed: () {
              moveToOldScreen(context: context);
              showModalSheetWithRadius(
                context: context,
                height: 445,
                returnWidget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dx),
                  child: Column(
                    children: [
                      SpaceY(64.dy),
                      Image.asset(
                        AssetsImages.review_success,
                        height: 80.dy,
                        width: 80.dx,
                      ),
                      SpaceY(16.dy),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.dx),
                        child: Text(
                            "Your response have been recorded successful",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kGrey)),
                      ),
                      SpaceY(32.dy),
                      CustomElevatedButton(
                          onPressed: () {
                            moveToOldScreen(context: context);
                          },
                          buttonText: "Go back to learning")
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
