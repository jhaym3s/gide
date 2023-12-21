// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.dy,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24.dy),
      padding: EdgeInsets.only(left: 20.dx, right: 20.dx),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_outward_rounded,
              color: kError,
            ),
            SpaceX(8.dx),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cash Deposit",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                SpaceY(2.dy),
                Text("Aug 03,2022",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
              ],
            ),
          ],
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 20.dx),
            child: Text("\$50.00",
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: kTextColorsLight)),
          ),
        ),
      ]),
    );
  }
}
