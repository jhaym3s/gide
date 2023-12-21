// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';

class CompletedCourses extends StatelessWidget {
  const CompletedCourses({
    super.key,
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
                Text("Quick steps to Figma",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: kTextColorsLight)),
                SpaceY(4.dy),
                Text("With Tom Lingard",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
                SpaceY(16.dy),
                Row(
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
