// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';

class CheckOutCourseModel {
  final String category, title, instructor, courseId;
  final int hours, minutes, lessons, price;

  CheckOutCourseModel(
      {required this.category,
      required this.title,
      required this.instructor,
      required this.hours,
      required this.price,
      required this.minutes,
      required this.courseId,
      required this.lessons});
}

class CheckoutCourses extends StatelessWidget {
  const CheckoutCourses({
    super.key,
    required this.model,
  });
  final CheckOutCourseModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.dy,
      width: 253.dx,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          //border: Border.all(color: const Color(0xffEAECF0)),
          color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 121.dy,
            width: 253.dx,
            //!pass in course url here
            color: kBlack,
          ),
          SpaceY(12.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text(model.category,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: kGrey)),
          ),
          SpaceY(6.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: SizedBox(
              child: Text(model.title,
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
            child: Text("With ${model.instructor}",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
          ),
          SpaceY(8.dy),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.dx),
            child: Text(
                "${model.hours}h:${model.minutes}mins . ${model.lessons} Lessons",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
          ),
        ],
      ),
    );
  }
}
