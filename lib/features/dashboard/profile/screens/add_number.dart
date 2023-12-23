// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/helpers/helper_fxn.dart';
import 'package:gide/domain/model_response/phone_numer_model.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_notifier.dart';
import 'package:gide/features/dashboard/profile/notifiers/profile_state.dart';
import '../../../../core/router/router.dart';

class AddNumber extends StatefulWidget {
  static const routeName = "addNumber";
  const AddNumber({super.key});

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("Add Phone Number",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
            NormalTextFormField(
                hintText: "",
                labelText: "Phone Number",
                controller: numberController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
            SpaceY(55.dy),
            Builder(builder: (context) {
              return Consumer(builder: (context, ref, _) {
                final notifier = ref.read(profileProvider.notifier);
                final state = ref.watch(profileProvider);
                void navToHome() {
                  ref.listen<ProfileState>(profileProvider, (previous, next) {
                    if (next.loadState == LoadState.success) {
                      Navigator.pop(context);
                      return;
                    }
                  });
                }

                navToHome();
                return CustomElevatedButton(
                    onPressed: () async {
                      if (numberController.text.length < 10) {
                        errorToastMessage('Phone number not complete');
                      } else {
                        await notifier.updatePhoneNum(PhoneNumerModel(
                            phoneNumber: numberController.text));
                      }
                    },
                    isLoading: state.loadState == LoadState.loading,
                    buttonText: "Add Number");
              });
            })
          ],
        ),
      ),
    );
  }
}
