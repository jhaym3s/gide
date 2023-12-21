// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../core/configs/configs.dart';

class PersonalInfoDetails extends StatelessWidget {
  const PersonalInfoDetails({
    required this.sub,
    required this.title,
    required this.image,
    super.key,
  });
  final String title, sub, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.dy),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xffF2F4F7),
            child: Image.asset(
              image,
              height: 20.dy,
              width: 20.dx,
            ),
          ),
          SpaceX(8.dx),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                SpaceY(2.dy),
                Text(sub,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SupportListTile extends StatelessWidget {
  const SupportListTile(
      {super.key,
      required this.title,
      required this.image,
      required this.suffixWidget});
  final String title, image;
  final Widget suffixWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.dy),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xffF2F4F7),
            child: Image.asset(
              image,
              height: 20.dy,
              width: 20.dx,
            ),
          ),
          SpaceX(8.dx),
          Text(title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorsLight)),
          const Spacer(),
          suffixWidget,
          SpaceX(16.dx)
        ],
      ),
    );
  }
}
