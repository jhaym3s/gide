import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';

class Courses extends StatelessWidget {
  const Courses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.dy,
      width: 253.dx,
      margin: EdgeInsets.only(right: 16.dx),
      decoration:  BoxDecoration(
        borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
        border: Border.all(color: const Color(0xffEAECF0))
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: 121.dy, width: 253.dx,
              color: kBlack,
            ),
            SpaceY(12.dy),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text("Design",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: kGrey)), 
                Row(
                  children: [
                    const ExplorePointsTile(points: "500",),
                  SpaceX(4.dx),
                  const Icon(Icons.info_outline, color: Color(0xff292D32),size: 16,)
                  ],
                ),
            ],
          ),
        ),
        SpaceY(6.dy), 
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Text("Quick steps to Figma",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
        ),
        SpaceY(8.dy),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Text("With Tom Lingard",
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
        ),
        SpaceY(8.dy),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.dx),
          child: Text("8h:20mins . 12 Lessons",
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

class ExplorePointsTile extends StatelessWidget {
  const ExplorePointsTile({
    super.key, required this.points
  });
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.5.dx, vertical: 3.dy),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffD0D5DD))
      ),
      child:  Row(
        children: [
         Image.asset(AssetsImages.gift,height: 12.dy, width: 12.dx,),
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
  const DetailsPointsTile({
    super.key, required this.points
  });
  final String points;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5.dx, vertical: 7.5.dy),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffD0D5DD))
      ),
      child:  Row(
        children: [
         Image.asset(AssetsImages.gift,height: 12.dy, width: 12.dx,),
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