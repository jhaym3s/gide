// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enroll.dart';
import 'package:gide/general_widget/app_image_view.dart';

class CompletedCourses extends StatelessWidget {
  final Enroll? model;
  final VoidCallback? onTap;
  const CompletedCourses({super.key, this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.dx),
      child: Container(
        height: 140.dy,
        width: 350.dx,
        margin: EdgeInsets.only(bottom: 16.dy),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEAECF0)),
        ),
        child: Row(children: [
          Container(
            height: 140.dy,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceY(16.dy),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: kSuccess,
                    ),
                    Text("Completed",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: kSuccess)),
                  ],
                ),
                SpaceY(4.dy),
                Text(model?.course?.title ?? "Quick steps to Figma",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: kTextColorsLight)),
                SpaceY(4.dy),
                Text(
                    "With ${model?.course?.instructors?[0].fullName ?? "Tom Lingard"}",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
                SpaceY(16.dy),
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Image.asset(
                        AssetsImages.commentIcon,
                        height: 16.dy,
                        width: 16.dx,
                      ),
                      SpaceX(4.dx),
                      Text("Drop a review",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey)),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
