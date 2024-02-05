// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/components/custom_back_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/profile/screens/add_number.dart';
import 'package:gide/features/dashboard/profile/screens/change_password.dart';

class EditPersonalDetailsScreen extends StatefulWidget {
  static const routeName = "edit_personal_screen";
  const EditPersonalDetailsScreen({super.key});

  @override
  State<EditPersonalDetailsScreen> createState() =>
      _EditPersonalDetailsScreenState();
}

class _EditPersonalDetailsScreenState extends State<EditPersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("Personal Information",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            SpaceY(46.dy),
            GestureDetector(
                onTap: () {
                  moveFromBottomNavBarScreen(
                      context: context, targetScreen: const ChangePassword());
                },
                child: const EditListTile(
                  title: "Change Password",
                )),
            GestureDetector(
                onTap: () {
                  moveFromBottomNavBarScreen(
                      context: context, targetScreen: const AddNumber());
                  // moveToNextScreen(context: context, page: AddNumber.routeName);
                },
                child: const EditListTile(
                  title: "Add Phone Number",
                )),
          ],
        ),
      ),
    );
  }
}

class EditListTile extends StatelessWidget {
  const EditListTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.dx),
      margin: EdgeInsets.only(bottom: 16.dx),
      height: 56.dy,
      width: kScreenWidth(context),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor)),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: kTextColorsLight,
          )
        ],
      ),
    );
  }
}
