// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/components/search_bar.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/learning/notifiers/enroll_notifier.dart';
import 'package:gide/features/dashboard/learning/widgets/learning_courses.dart';
import 'package:gide/general_widget/app_loader.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/custom_tab_bar.dart';
import '../widgets/completed_courses.dart';

class LearningScreen extends ConsumerStatefulWidget {
  static const routeName = "learning_screen";
  const LearningScreen({super.key});

  @override
  ConsumerState<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends ConsumerState<LearningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(enrollProv.notifier);
      await notifier.getEnrolled();
    });
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
                      child: const CustomSearchBar(),
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
                                ? const Center(
                                    child: Text('No enrolled course yet 😔'))
                                : ListView.builder(
                                    itemCount:
                                        state.enrollmentModel?.data?.length ??
                                            0,
                                    itemBuilder: (context, index) {
                                      final singleData =
                                          state.enrollmentModel?.data?[index];
                                      return LearningCourses(
                                        model: singleData,
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
                      child: const CustomSearchBar(),
                    ),
                    SpaceY(24.dy),
                    Divider(
                      height: 4.dy,
                      color: kBlack.withOpacity(.4),
                    ),
                    SpaceY(10.dy),
                    enrollState.loadState == LoadState.loading
                        ? const AppLoader(
                            color: kPrimaryColor,
                          )
                        : (enrollState.completedCourses ?? []).isEmpty
                            ? const Center(
                                child: Text('No course completed yet 😔'))
                            : Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        (enrollState.completedCourses ?? [])
                                            .length,
                                    itemBuilder: (context, index) {
                                      final singleCourse =
                                          (enrollState.completedCourses ??
                                              [])[index];
                                      return GestureDetector(
                                          onTap: () {
                                            showModalSheetWithRadius(
                                                context: context,
                                                returnWidget: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.dx),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SpaceY(40.dy),
                                                      Center(
                                                        child: Text(
                                                            "Drop a review",
                                                            softWrap: true,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color:
                                                                        kTextColorsLight)),
                                                      ),
                                                      SpaceY(40.dy),
                                                      CommentTextFormField(
                                                        commentController:
                                                            commentController,
                                                        hint:
                                                            'Your favorite thing about the course',
                                                        labelText:
                                                            "Drop a message",
                                                      ),
                                                      SpaceY(24.dy),
                                                      Text(
                                                          "How would you rate the course",
                                                          softWrap: true,
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextColorsLight)),
                                                      SpaceY(16.dy),
                                                      RatingBar(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        maxRating: 5,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: false,
                                                        itemCount: 5,
                                                        ratingWidget:
                                                            RatingWidget(
                                                          full: const Icon(
                                                              Icons.star,
                                                              color:
                                                                  kPrimaryColor),
                                                          half: const Icon(
                                                              Icons.star_half,
                                                              color:
                                                                  kPrimaryColor),
                                                          empty: const Icon(
                                                              Icons.star_border,
                                                              color:
                                                                  kPrimaryColor),
                                                        ),
                                                        itemSize: 24,
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                      SpaceY(32.dy),
                                                      CustomElevatedButton(
                                                        buttonText:
                                                            "Submit Review",
                                                        onPressed: () {
                                                          moveToOldScreen(
                                                              context: context);
                                                          showModalSheetWithRadius(
                                                            context: context,
                                                            height: 445,
                                                            returnWidget:
                                                                Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20.dx),
                                                              child: Column(
                                                                children: [
                                                                  SpaceY(64.dy),
                                                                  Image.asset(
                                                                    AssetsImages
                                                                        .review_success,
                                                                    height:
                                                                        80.dy,
                                                                    width:
                                                                        80.dx,
                                                                  ),
                                                                  SpaceY(16.dy),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            50.dx),
                                                                    child: Text(
                                                                        "Your response have been recorded successful",
                                                                        softWrap:
                                                                            true,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                                            fontSize:
                                                                                16.sp,
                                                                            fontWeight: FontWeight.w400,
                                                                            color: kGrey)),
                                                                  ),
                                                                  SpaceY(32.dy),
                                                                  CustomElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        moveToOldScreen(
                                                                            context:
                                                                                context);
                                                                      },
                                                                      buttonText:
                                                                          "Go back to learning")
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                height: 418);
                                          },

                                          //!HERE
                                          child: CompletedCourses(
                                            model: singleCourse,
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

class EmptyLearningScreen extends StatelessWidget {
  const EmptyLearningScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.emptyLearning,
              height: 120.dy,
              width: 120.dx,
            ),
            SpaceY(16.dy),
            Text("Nothing yet",
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kTextColorsLight)),
            SpaceY(8.dy),
            Text(
                "You have not started any course yet. Keep browsing to and learn.",
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey)),
            SpaceY(16.dy),
            CustomElevatedButton(
                onPressed: () {}, buttonText: "Explore Courses")
          ],
        ),
      ),
    );
  }
}
