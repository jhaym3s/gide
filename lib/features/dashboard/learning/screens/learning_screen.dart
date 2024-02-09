// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/components/search_bar.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/config/exception/logger.dart';
import 'package:gide/features/dashboard/explore/screens/course_detail_screen.dart';
import 'package:gide/features/dashboard/learning/model/enrollment_model/enroll.dart';
import 'package:gide/features/dashboard/learning/notifiers/enroll_notifier.dart';
import 'package:gide/features/dashboard/learning/widgets/empty_learning.dart';
import 'package:gide/features/dashboard/learning/widgets/learning_courses.dart';
import 'package:gide/features/dashboard/learning/widgets/submit_review_bottomsheet.dart';
import 'package:gide/general_widget/app_loader.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/custom_tab_bar.dart';
import '../widgets/completed_courses.dart';

class LearningScreen extends ConsumerStatefulWidget {
  static const routeName = "learning_screen";
  const LearningScreen({
    required this.onItemClicked,
    super.key,
  });
  final Function(int index)? onItemClicked;

  @override
  ConsumerState<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends ConsumerState<LearningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Enroll>? _searchedCourses = [];
  late final TextEditingController _textEditingController;

  List<Enroll>? _searchedEnrolled = [];
  late final TextEditingController _enrolltextEditingController;

  void _searchListener() {
    final state = ref.watch(enrollProv);
    if (_textEditingController.text.trim().isNotEmpty) {
      String searchQuery = _textEditingController.text.trim().toLowerCase();
      List<Enroll> tempList = [];

      for (int i = 0; i < (state.enrollmentModel?.data ?? []).length; i++) {
        final singleItem = (state.enrollmentModel?.data ?? [])[i];

        if ((singleItem.course?.title ?? '')
                .toLowerCase()
                .contains(searchQuery) ||
            (singleItem.course?.instructors?.first.fullName ?? '')
                .toLowerCase()
                .contains(searchQuery)) {
          tempList.add(singleItem);
        }
      }

      setState(() {
        _searchedCourses = tempList;
      });
    } else {
      // debugLog('controller is empty');
    }
  }

  void _searchEnrolledListener() {
    final state = ref.watch(enrollProv);
    if (_enrolltextEditingController.text.trim().isNotEmpty) {
      String searchQuery =
          _enrolltextEditingController.text.trim().toLowerCase();
      List<Enroll> tempList = [];
      debugLog('Completed courses controller not empty');

      for (int i = 0; i < (state.completedCourses ?? []).length; i++) {
        final singleItem = (state.completedCourses ?? [])[i];

        if ((singleItem.course?.title ?? '')
                .toLowerCase()
                .contains(searchQuery) ||
            (singleItem.course?.instructors?.first.fullName ?? '')
                .toLowerCase()
                .contains(searchQuery)) {
          debugLog('FOUND A MATCH ${singleItem.course?.title ?? ""}');
          tempList.add(singleItem);
        }
      }

      setState(() {
        _searchedEnrolled = tempList;
      });
      debugLog(
          '_searched completed courses length => ${(_searchedEnrolled ?? []).length}');
    } else {
      debugLog('controller is empty');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
    _enrolltextEditingController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(enrollProv.notifier);
      await notifier.getEnrolled();
    });
    _textEditingController.addListener(_searchListener);
    _enrolltextEditingController.addListener(_searchEnrolledListener);
  }

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final enrollState = ref.watch(enrollProv);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceY(32.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: Text("Learning",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight)),
            ),
            SpaceY(16.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: CustomThreeTabBar(
                tabController: _tabController,
                label1: "Learning",
                label2: "Completed",
                label3: "Wishlist",
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    SpaceY(16.dy),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.dx),
                      child: CustomSearchBar(
                        controller: _textEditingController,
                        onChangedFxn: (p0) {},
                      ),
                    ),
                    SpaceY(24.dy),
                    Divider(
                      height: 4.dy,
                      color: kBlack.withOpacity(.4),
                    ),
                    SpaceY(10.dy),
                    Expanded(
                      child: Consumer(builder: (context, ref, _) {
                        final state = ref.watch(enrollProv);

                        return state.loadState == LoadState.loading
                            ? const AppLoader(
                                color: kPrimaryColor,
                              )
                            : (state.enrollmentModel?.data ?? []).isEmpty
                                ? EmptyLearningScreen(
                                    onItemClicked: widget.onItemClicked,
                                  )
                                // const Center(
                                //     child: Text('No enrolled course yet 😔'))
                                : (_searchedCourses ?? []).isEmpty &&
                                        _textEditingController.text.isNotEmpty
                                    ? const Center(
                                        child: Text(
                                            'Searched course not found 😔'))
                                    : _textEditingController.text.isNotEmpty
                                        ? ListView.builder(
                                            itemCount:
                                                (_searchedCourses ?? []).length,
                                            itemBuilder: (context, index) {
                                              final singleData =
                                                  (_searchedCourses ??
                                                      [])[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  moveFromBottomNavBarScreen(
                                                      context: context,
                                                      targetScreen:
                                                          CourseDetailScreen(
                                                        courseId: singleData
                                                                .course?.id ??
                                                            "",
                                                        hasEnrolled: true,
                                                      ));
                                                },
                                                child: LearningCourses(
                                                  model: singleData,
                                                ),
                                              );
                                            })
                                        : ListView.builder(
                                            itemCount: state.enrollmentModel
                                                    ?.data?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              final singleData = state
                                                  .enrollmentModel
                                                  ?.data?[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  moveFromBottomNavBarScreen(
                                                      context: context,
                                                      targetScreen:
                                                          CourseDetailScreen(
                                                        courseId: singleData
                                                                ?.course?.id ??
                                                            "",
                                                        hasEnrolled: true,
                                                      ));
                                                },
                                                child: LearningCourses(
                                                  model: singleData,
                                                ),
                                              );
                                            });
                      }),
                    )
                  ],
                ),
                //!Second tab
                Column(
                  children: [
                    SpaceY(16.dy),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.dx),
                      child: CustomSearchBar(
                        controller: _enrolltextEditingController,
                        onChangedFxn: (p0) {},
                      ),
                    ),
                    SpaceY(24.dy),
                    Divider(
                      height: 4.dy,
                      color: kBlack.withOpacity(.4),
                    ),
                    SpaceY(10.dy),
//todo: change the location of the loader
                    enrollState.loadState == LoadState.loading
                        ? const AppLoader(
                            color: kPrimaryColor,
                          )
                        : (enrollState.completedCourses ?? []).isEmpty
                            ? EmptyLearningScreen(
                                onItemClicked: widget.onItemClicked,
                              )
                            // const Center(
                            //     child: Text('No course completed yet 😔'))
                            : (_searchedEnrolled ?? []).isEmpty &&
                                    _enrolltextEditingController.text.isNotEmpty
                                ? const Center(
                                    child: Text('Searched course not found 😔'))
                                : _enrolltextEditingController.text.isNotEmpty
                                    ? Expanded(
                                        child: ListView.builder(
                                            itemCount: (_searchedEnrolled ?? [])
                                                .length,
                                            itemBuilder: (context, index) {
                                              final singleData =
                                                  (_searchedEnrolled ??
                                                      [])[index];

                                              return GestureDetector(
                                                onTap: () {
                                                  moveFromBottomNavBarScreen(
                                                      context: context,
                                                      targetScreen:
                                                          CourseDetailScreen(
                                                        courseId: singleData
                                                                .course?.id ??
                                                            "",
                                                        hasEnrolled: true,
                                                      ));
                                                },
                                                child: CompletedCourses(
                                                  model: singleData,
                                                  onTap: () {
                                                    showModalSheetWithRadius(
                                                        context: context,
                                                        returnWidget:
                                                            SendReviewBottomSheet(
                                                          commentController:
                                                              commentController,
                                                          // onItemClicked: widget
                                                          //     .onItemClicked,
                                                          enrollID:
                                                              singleData.id ??
                                                                  '',
                                                        ),
                                                        height: 418);
                                                  },
                                                ),
                                              );
                                            }),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                            itemCount:
                                                (enrollState.completedCourses ??
                                                        [])
                                                    .length,
                                            itemBuilder: (context, index) {
                                              final singleCourse = (enrollState
                                                      .completedCourses ??
                                                  [])[index];
                                              return GestureDetector(
                                                  onTap: () {
                                                    moveFromBottomNavBarScreen(
                                                        context: context,
                                                        targetScreen:
                                                            CourseDetailScreen(
                                                          courseId: singleCourse
                                                                  .course?.id ??
                                                              "",
                                                          hasEnrolled: true,
                                                        ));
                                                  },
                                                  child: CompletedCourses(
                                                    model: singleCourse,
                                                    onTap: () {
                                                      showModalSheetWithRadius(
                                                          context: context,
                                                          returnWidget:
                                                              SendReviewBottomSheet(
                                                            commentController:
                                                                commentController,
                                                            // onItemClicked: widget
                                                            //     .onItemClicked,
                                                            enrollID:
                                                                singleCourse
                                                                        .id ??
                                                                    '',
                                                          ),
                                                          height: 418);
                                                    },
                                                  ));
                                            }),
                                      )
                  ],
                ),
                //! third tab
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
