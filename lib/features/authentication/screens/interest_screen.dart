// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/domain/model_response/signup_response/category_resp.dart';
import 'package:gide/features/authentication/model/signup_model.dart';
import 'package:gide/features/authentication/notifier/auth_notifier.dart';
import 'package:gide/features/authentication/notifier/auth_state.dart';
import 'package:gide/features/authentication/widgets/interest_cards.dart';
import 'package:gide/features/dashboard/custom_navigation_bar.dart';
import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/router/router.dart';

//? sign up
class InterestScreen extends StatefulWidget {
  static const routeName = "interest_screen";
  const InterestScreen({super.key, this.categoryList});
  final List<CategoryResp>? categoryList;

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  void initState() {
    super.initState();

    final catList = (widget.categoryList ?? []).map((e) => e.name);
    interestList = [...catList];
  }

  List<String?> interestList = [
    // "UI/UX Design",
    // "Product Management",
    // "Mobile",
    // "Frontend Development",
    // "Digital Marketing",
    // "Backend Development",
    // "Copy Writing",
    // "Data Science",
  ];
  final List<int> selectedItems = [];
  final List<String> selectedInterest = [];

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        centerTitle: true,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.dx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What are you learning?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: kTextColorsLight)),
            SpaceY(8.dy),
            Padding(
              padding: EdgeInsets.only(right: 30.dx),
              child: Text(
                  "You can select more than one course. Don’t worry you can make changes to it.",
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff667085))),
            ),
            SpaceY(40.dy),
            Wrap(
                children: List.generate(interestList.length, (index) {
              // List<bool> isSelectedList = List.generate(interestList.length, (index) => false);
              return InkWell(
                  onTap: () {
                    if (selectedItems.contains(index)) {
                      setState(() {
                        selectedItems.remove(index);
                        final removedValue = interestList[index];
                        selectedInterest.remove(removedValue);
                      });
                    } else {
                      setState(() {
                        selectedItems.add(index);
                        selectedInterest.add(interestList[index] ?? '');
                      });
                    }
                  },
                  child: InterestCards(
                    name: interestList[index] ?? '',
                    index: index,
                    selectedItems: selectedItems,
                  ));
            })),
            SpaceY(40.dy),
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(authProvider);
              final notifier = ref.read(authProvider.notifier);

              void navToHome() {
                ref.listen<AuthState>(authProvider, (previous, next) {
                  if (next.loadState == LoadState.success) {
                    moveAndClearStack(
                        context: context, page: CustomNavigationBar.routeName);
                    return;
                  }
                });
              }

              navToHome();

              return CustomElevatedButton(
                  isLoading: state.loadState == LoadState.loading,
                  onPressed: () {
                    List<dynamic> interestListId = [];
                    for (var element in selectedInterest) {
                      for (var single in widget.categoryList!) {
                        if ((single.name ?? '') == element) {
                          interestListId.add(single.id ?? '');
                        }
                      }
                    }
                    debugLog(
                      'interest list $selectedInterest, \n index => $selectedItems\ninterestsid after loop => $interestListId',
                    );
                    final data = SignupModel(
                      accountType: state.signupModel?.accountType ?? '',
                      email: state.signupModel?.email ?? '',
                      firstName: state.signupModel?.firstName ?? '',
                      interests: [...interestListId],
                      lastName: state.signupModel?.lastName ?? '',
                      password: state.signupModel?.password ?? '',
                    );
                    notifier.signup(data);
                  },
                  buttonText: "Get Started");
            }),
          ],
        ),
      )),
    );
  }
}
