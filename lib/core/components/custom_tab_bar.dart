import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';


class CustomThreeTabBar extends StatelessWidget {
  const CustomThreeTabBar({
    super.key,
    required this.tabController,
    required this.label1,
    required this.label2,
     required this.label3
  });
  final TabController tabController;
  final String label1, label2, label3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.dy,
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TabBar(
        isScrollable: false,
        dividerColor: kBlack,
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPrimaryColor,
        ),
        labelColor: kWhite,
        indicatorColor: kWarning,
        unselectedLabelColor: kBlack,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: kWhite),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: kTextColorsLight),
        tabs:  [
          Tab(
            text: label1,
          ),
          Tab(
            text: label2,
          ),
        Tab(
            text: label3,
          ),
        ],
      ),
    );
  }
}

class CustomTwoTabBar extends StatelessWidget {
  const CustomTwoTabBar({
    super.key,
    required this.tabController,
    required this.label1,
    required this.label2,
  });
  final TabController tabController;
  final String label1, label2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.dy,
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TabBar(
        isScrollable: false,
        dividerColor: kBlack,
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPrimaryColor,
        ),
        labelColor: kWhite,
        indicatorColor: kWarning,
        unselectedLabelColor: kBlack,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: kWhite),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: kTextColorsLight),
        tabs:  [
          Tab(
            text: label1,
          ),
          Tab(
            text: label2,
          ),
       
        ],
      ),
    );
  }
}