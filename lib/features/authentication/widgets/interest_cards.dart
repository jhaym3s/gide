import 'package:flutter/material.dart';

import '../../../core/configs/configs.dart';

class InterestCards extends StatelessWidget {
   const InterestCards({
    super.key, required this.name, required this.index, required this.selectedItems
  });
  final String name;
  final List<int> selectedItems;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.dx, top: 8.dx),
      decoration:  BoxDecoration(
        color: selectedItems.contains(index)?kPrimaryColor: const Color(0xffF2F4F7), borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dx, vertical: 13.5.dy),
                  child: Text(
    name,
    textAlign: TextAlign.center,
    softWrap: true,
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: selectedItems.contains(index)?kWhite:kTextColorsLight)),
                ),
    );
  }
}