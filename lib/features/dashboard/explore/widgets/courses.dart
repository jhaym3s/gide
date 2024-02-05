// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:info_popup/info_popup.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/dashboard/explore/model/all_courses_model/course_model.dart';
import 'package:gide/general_widget/app_image_view.dart';

class Courses extends StatelessWidget {
  const Courses({super.key, required this.coursemodel});
  final CourseModel coursemodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.dy,
      width: 253.dx,
      margin: EdgeInsets.only(right: 16.dx),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          border: Border.all(color: const Color(0xffEAECF0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 121.dy,
            width: 253.dx,
            color: kBlack,
            child:

                // child:
                AppImageView(
              url: coursemodel.image ?? '',
              height: 121.dy,
              fit: BoxFit.contain,
              // imagePath: 'assets/images/empty_learning.png',
            ),
          ),
          SpaceY(12.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //!here 1
                //!todo change when api is updated
                Text(
                  "Design",
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: kGrey,
                      ),
                ),
                Row(
                  children: [
                    ExplorePointsTile(
                      points: (coursemodel.points ?? 0).toString(),
                    ),
                    SpaceX(4.dx),
                    const InfoPopupWidget(
                      contentTitle:
                          'Points are litte token of rewards awarded whenever you complete a task',
                      dismissTriggerBehavior:
                          PopupDismissTriggerBehavior.anyWhere,
                      child: Icon(
                        Icons.info_outline,
                        color: Color(0xff292D32),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SpaceY(6.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: SizedBox(
              width: 240.dx,
              child: Text(coursemodel.title ?? "Quick steps to Figma",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight)),
            ),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text(
                "With ${(coursemodel.instructors ?? []).first.fullName ?? 'Tom Lingard'}",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${coursemodel.courseLength?.hours ?? 0}h:${coursemodel.courseLength?.minutes ?? 00}mins . ${(coursemodel.modules ?? []).length} Lessons",
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
                Row(
                  children: [
                    Text(
                        double.parse(coursemodel.cummulativeRating.toString()).toStringAsFixed(1),
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
                    const Icon(Icons.star, color: kPrimaryColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExplorePointsTile extends StatelessWidget {
  const ExplorePointsTile({super.key, required this.points});
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.dx, vertical: 3.dy),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffD0D5DD))),
      child: Row(
        children: [
          Image.asset(
            AssetsImages.gift,
            height: 12.dy,
            width: 12.dx,
          ),
          SpaceX(4.dx),
          Text("$points points",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
        ],
      ),
    );
  }
}

class DetailsPointsTile extends StatelessWidget {
  const DetailsPointsTile({super.key, required this.points});
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5.dx, vertical: 7.5.dy),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffD0D5DD))),
      child: Row(
        children: [
          Image.asset(
            AssetsImages.gift,
            height: 12.dy,
            width: 12.dx,
          ),
          SpaceX(4.dx),
          Text("$points points",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
        ],
      ),
    );
  }
}
