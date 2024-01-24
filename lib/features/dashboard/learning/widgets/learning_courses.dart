// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enroll.dart';
import 'package:gide/general_widget/app_image_view.dart';

class LearningCourses extends StatelessWidget {
  final Enroll? model;
  const LearningCourses({
    super.key,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.dx),
      child: Container(
        height: 131.dy,
        width: 350.dx,
        margin: EdgeInsets.only(bottom: 16.dy),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEAECF0)),
        ),
        child: Row(children: [
          Container(
            height: 131.dy,
            width: 122.dx,
            decoration: const BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            child: AppImageView(
              url: model?.course?.image ?? '',
              // height: 121.dy,
              fit: BoxFit.contain,
              imagePath: 'assets/images/empty_learning.png',
            ),
          ),
          SpaceX(16.dx),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.dy),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model?.course?.title ?? "Quick steps to Figma",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: kTextColorsLight)),
                  SpaceY(2.dy),
                  Text(
                      "With ${model?.course?.instructors?[0].fullName ?? "Tom Lingard"}",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: kGrey)),
                  SpaceY(15.dy),
                  CustomProgressIndicator(
                    progress: double.parse(
                        (model?.progress?.percentageCompleted ?? 0).toString()),
                  ),
                  SpaceY(6.dy),
                  Text(
                      "${model?.progress?.totalModulesCompleted ?? 0}/${model?.totalModulesEnrolled ?? 0} modules covered",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor)),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
