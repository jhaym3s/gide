// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/features/dashboard/explore/screens/explore_screen.dart';
import 'package:gide/features/dashboard/profile/model/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_notifier.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import '../../../../core/router/router.dart';

class AllCategorieScreen extends StatelessWidget {
  static const routeName = "allCategorieScreen";
  const AllCategorieScreen({super.key, required this.cat});

  final List<String?> cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("All Categories",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.dx),
        child: cat.isEmpty
            ? const Center(
                child: Text('No categories yet 😔'),
              )
            : Wrap(
                spacing: 0.0,
                runSpacing: 16.0,
                children: cat
                    .map((cat) => ExploreCategories(
                          name: cat ?? '',
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
