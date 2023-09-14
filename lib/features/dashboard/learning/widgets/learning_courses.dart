import 'package:flutter/material.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';

class LearningCourses extends StatelessWidget {
  const LearningCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.dx),
      child: Container(
        height: 111.dy, width: 350.dx,
        margin: EdgeInsets.only(bottom: 16.dy),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEAECF0)),
        ),
        child: Row(
          children:[
            Container(
               height: 111.dy, width: 122.dx,
              decoration: const BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
              ),
            ),
            SpaceX(16.dx),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.dy),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quick steps to Figma",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: kTextColorsLight)),
                    SpaceY(2.dy),
                    Text("With Tom Lingard",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
                            SpaceY(15.dy),
                    const CustomProgressIndicator(progress: 0.3,),
                    SpaceY(6.dy),
                    Text("5/12 courses covered",
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
          ]
        ),
      ),
    );
  }
}