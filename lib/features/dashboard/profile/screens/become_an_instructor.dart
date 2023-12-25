// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/alerts.dart';
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/third_party_services/file_picker_services.dart';
import 'package:gide/core/services/third_party_services/image_picker_services.dart';
import 'package:gide/features/dashboard/profile/become_instructor_model.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_notifier.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/components/components.dart';
import '../../../../core/configs/configs.dart';

class BecomeAnInstructor extends StatefulHookConsumerWidget {
  static const routeName = "becomeAnInstructor";
  const BecomeAnInstructor({super.key});

  @override
  ConsumerState<BecomeAnInstructor> createState() => _BecomeAnInstructorState();
}

class _BecomeAnInstructorState extends ConsumerState<BecomeAnInstructor> {
  final genderController = TextEditingController();
  final commentController = TextEditingController();
  final imageController = TextEditingController();
  final resumeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<File>> imageList = useState([]);
    ValueNotifier<List<File>> fileList = useState([]);
    final imageServices = ref.read(imagePickerService);
    final fileServices = ref.read(filePickerProvider);
    final state = ref.watch(profileProvider);
    final notifer = ref.read(profileProvider.notifier);
    void selectImage(AppImagePicker picker, ImageSource source) async {
      await picker.pickImage(source: source, images: imageList).then((value) {
        imageController.text = imageList.value.last.path.split('/').last;
      });
    }

    void selectFile() async {
      await fileServices.pickFile(files: fileList).then((value) {
        resumeController.text = fileList.value.last.path.split('/').last;
      });
    }

    Future<String> sendFiles(String filePath) async =>
        await (notifer.uploadFileData(filePath: File(filePath))) ?? 'no-data';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        physics: const BouncingScrollPhysics(),
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
              onTap: () {
                generalDialog(
                    children: Container(
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        height: 250.dy,
                        width: 350.dx,
                        child: Column(
                          children: [
                            SpaceY(32.dy),
                            Text("Select Gender",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColorsLight)),
                            SpaceY(24.dy),
                            PaymentListTile(
                              option: "Male",
                              onTap: () {
                                genderController.text = 'MALE';
                                Navigator.pop(context);
                              },
                            ),
                            SpaceY(4.dy),
                            PaymentListTile(
                              option: "Female",
                              onTap: () {
                                genderController.text = 'FEMALE';
                                Navigator.pop(context);
                              },
                            ),
                            SpaceY(32.dy)
                          ],
                        )),
                    context: context);
              },
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
              onTap: () => selectImage(imageServices, ImageSource.gallery),
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
              onTap: selectFile,
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
                isLoading: state.uploadLoadState == LoadState.loading || state.loadState == LoadState.loading,
                onPressed: () async {
                  if (genderController.text.isNotEmpty &&
                      imageController.text.isNotEmpty &&
                      resumeController.text.isNotEmpty &&
                      commentController.text.isNotEmpty) {
                    final imageUrl = await sendFiles(imageList.value.last.path);
                    final fileUrl = await sendFiles(fileList.value.last.path);
                    final data = BecomeInstructorModel(
                      bio: commentController.text,
                      gender: genderController.text,
                      image: imageUrl,
                      resume: fileUrl,
                    );

                    notifer.becomeInstru(data);
                  } else {
                    errorToastMessage('Please fill up the field');
                  }
                },
                buttonText: "Submit Details")
          ],
        ),
      ),
    );
  }

  void successDialog() {
    ref.listen<ProfileState>(profileProvider, (previous, next) {
      if (next.loadState == LoadState.success) {
        showSuccessDialog(context: context, onPressed: () {});
        return;
      }
    });
  }
}
