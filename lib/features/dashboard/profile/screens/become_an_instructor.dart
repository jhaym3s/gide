// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/components/alerts.dart';
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
  final genderController = TextEditingController();
  final commentController = TextEditingController();
  final imageController = TextEditingController();
  final resumeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            SpaceY(55.dy),
            DropDownTextFormField(
              hintText: "Select option",
              labelText: "Gender",
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              controller: genderController,
              onTap: () {},
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a gender';
                }
                return null;
              },
            ),
            SpaceY(16.dy),
            DropDownTextFormField(
              hintText: "Select image",
              labelText: "Upload image",
              suffixIcon: const Icon(
                Icons.description_rounded,
              ),
              controller: imageController,
              onTap: () {},
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SpaceY(16.dy),
            DropDownTextFormField(
              hintText: "Select Resume",
              labelText: "Upload resume",
              suffixIcon: const Icon(
                Icons.description_rounded,
              ),
              controller: resumeController,
              onTap: () {},
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SpaceY(16.dy),
            CommentTextFormField(
              commentController: commentController,
              hint: "Work experience, hobbies, just make it short.",
              labelText: "Tell us about yourself",
            ),
            SpaceY(34.dy),
            CustomElevatedButton(
                onPressed: () {
                  showSuccessDialog(context: context, onPressed: () {});
                },
                buttonText: "Submit Details")
          ],
        ),
      ),
    );
  }
}
