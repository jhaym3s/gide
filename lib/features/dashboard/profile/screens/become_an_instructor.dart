import 'package:flutter/material.dart';
import 'package:gide/core/router/router.dart';

import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class BecomeAnInstructor extends StatefulWidget {
  static const routeName = "becomeAnInstructor";
  const BecomeAnInstructor({super.key});

  @override
  State<BecomeAnInstructor> createState() => _BecomeAnInstructorState();
}

class _BecomeAnInstructorState extends State<BecomeAnInstructor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("Become an Instructor",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
      ),
      body: Column(
        
      ),
    );
  }
}