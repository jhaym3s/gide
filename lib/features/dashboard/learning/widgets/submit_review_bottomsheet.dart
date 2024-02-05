// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/components/custom_comment_box.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/components/pop_up.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/domain/model_response/create_review.dart';
import 'package:gide/features/dashboard/learning/notifiers/enroll_notifier.dart';

class SendReviewBottomSheet extends StatefulWidget {
  const SendReviewBottomSheet({
    super.key,
    required this.commentController,
    required this.enrollID,
    // this.onItemClicked,
  });

  final TextEditingController commentController;
  final String enrollID;
  // final Function(int index)? onItemClicked;

  @override
  State<SendReviewBottomSheet> createState() => _SendReviewBottomSheetState();
}

class _SendReviewBottomSheetState extends State<SendReviewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double startRating = 0;
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
            commentController: widget.commentController,
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
            onRatingUpdate: (rating) {
              setState(() {
                startRating = rating;
              });
            },
          ),
          SpaceY(32.dy),
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(enrollProv);
            final notifier = ref.read(enrollProv.notifier);
            return CustomElevatedButton(
              isLoading: state.loadState == LoadState.loading,
              buttonText: "Submit Review",
              onPressed: () async {
                final data = CreateReview(
                    comment: widget.commentController.text,
                    enrollment: widget.enrollID,
                    starRating: int.parse(startRating.toString()[0]));
                if (widget.commentController.text.isEmpty) {
                  errorToastMessage('Comment field cannot be empty');
                } else {
                  final bool isSuccess = await notifier.createReview(
                    createReview: data,
                  );
                  if (isSuccess) {
                    successReponse(
                      context,
                    );
                  }
                }
              },
            );
          })
        ],
      ),
    );
  }

  Future<void> successReponse(
    BuildContext context,
  ) {
    return showModalSheetWithRadius(
      context: context,
      height: 445,
      returnWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            SpaceY(64.dy),
            Image.asset(
              AssetsImages.reviewSuccess,
              height: 80.dy,
              width: 80.dx,
            ),
            SpaceY(16.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.dx),
              child: Text("Your response have been recorded successful",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: kGrey)),
            ),
            SpaceY(32.dy),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                buttonText: "Go back to learning")
          ],
        ),
      ),
    );
  }
}
