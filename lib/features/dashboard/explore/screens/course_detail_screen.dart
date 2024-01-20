// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_popup/info_popup.dart';

// Project imports:
import 'package:gide/core/components/app_enums.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/third_party_services/web_link.dart';
import 'package:gide/features/dashboard/explore/notifier.dart/course_notifier.dart';
import 'package:gide/features/dashboard/explore/screens/checkout_screen.dart';
import 'package:gide/features/dashboard/explore/widgets/checkout_course.dart';
import 'package:gide/features/dashboard/explore/widgets/courses.dart';
import 'package:gide/features/dashboard/explore/widgets/expandable_widget.dart';
import 'package:gide/general_widget/app_image_view.dart';
import 'package:gide/general_widget/app_loader.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  static const routeName = "course_detail_screen";
  const CourseDetailScreen({
    super.key,
    required this.courseId,
  });
  final String courseId;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  @override
  void initState() {
    super.initState();
    //!call api
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(courseProvider.notifier);
      await notifier.getSingleCou(id: widget.courseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(courseProvider);
    final singleCourse = state.singleCourseModel;
    final webService = ref.read(webLinkProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 224.dy,
              width: kScreenWidth(context),
              color: kBlack,
              child: SafeArea(
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: (singleCourse?.image ?? '').isEmpty ||
                              (singleCourse?.image) == null
                          ? AppImageView(
                              url: singleCourse?.image ?? '',
                              height: 121.dy,
                              fit: BoxFit.contain,
                              imagePath: 'assets/images/empty_learning.png',
                            )
                          : AppImageView(
                              url: singleCourse?.image ?? '',
                              height: 121.dy,
                              fit: BoxFit.contain,
                              imagePath: 'assets/images/empty_learning.png',
                            ),
                    ),
                    Positioned(
                      top: 10,
                      left: 30,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kWhite,
                        ),
                        onPressed: () {
                          moveToOldScreen(context: context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.loadState == LoadState.loading)
              const Center(
                child: AppLoader(
                  color: kPrimaryColor,
                ),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.dx),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceY(18.dy),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //!change when there is a dynamic data
                        Text("Design",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kGrey)),
                        Row(
                          children: [
                            DetailsPointsTile(
                                points: (singleCourse?.points ?? 0).toString()),
                            SpaceX(4.dx),
                            const InfoPopupWidget(
                              contentTitle:
                                  'Points are litte token of rewards awarded whenever you complete a task',
                              dismissTriggerBehavior:
                                  PopupDismissTriggerBehavior.anyWhere,
                              child: Icon(
                                Icons.info_outline,
                                color: Color(0xff292D32),
                                size: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(singleCourse?.title ?? "Introduction to programming",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: kTextColorsLight)),
                    SpaceY(8.dy),
                    Text(
                        "With ${(singleCourse?.instructors ?? []).first.fullName ?? 'Tom Lingard'}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
                    SpaceY(8.dy),
                    Text(
                        "${singleCourse?.courseLength?.hours ?? 0}h:${singleCourse?.courseLength?.minutes ?? 00}mins . ${(singleCourse?.modules ?? []).length} Lessons",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGrey)),
                    SpaceY(32.dy),
                    Divider(
                      height: 1.dy,
                    ),
                    SpaceY(20.dy),
                    Text("Course description",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                    SpaceY(8.dy),
                    ExpandableText(
                      singleCourse?.description ?? '',

                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kGrey),
                      linkTextStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor),
                      readMoreText: 'Read more',
                      readLessText: 'Read less',
                      trim:
                          3, // You can set the maximum number of lines to display
                    ),
                    SpaceY(24.dy),
                    Divider(
                      height: 1.dy,
                    ),
                    SpaceY(32.dy),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Modules",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColorsLight)),
                        Text("${(singleCourse?.modules ?? []).length} in total",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kTextColorsLight)),
                      ],
                    ),
                    SpaceY(16.dy),
                    SizedBox(
                      height: 250.dy,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: (singleCourse?.modules ?? []).length,
                        itemBuilder: (context, index) {
                          final moduleData = singleCourse?.modules?[index];
                          return ExpandableContainer(
                            hour: moduleData?.length?.hours ?? 0,
                            minutes: moduleData?.length?.minutes ?? 0,
                            content: SizedBox(
                              height: 150.dy,
                              child: ListView.builder(
                                itemCount: (moduleData?.lessons ?? []).length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final lesson = moduleData?.lessons?[index];
                                  return CoursesListTile(
                                    icon: index == 0
                                        ? Icons.arrow_forward_ios
                                        : Icons.lock_outline,
                                    title: lesson?.description ?? '',

                                    //? 18/01/24, 8:00pm GST (3pts)
                                    // subtitle: (lesson?.points ?? 0).toString(),
                                    //todo: Change this hardcoded data to datetime
                                    //? like this => lesson?.labsesson?.datetime conversion
                                    subtitle: (lesson?.labSession ?? '')
                                                .isNotEmpty ||
                                            (lesson?.labSession) != null
                                        ? '18/01/24, 8:00pm GST (${(lesson?.points ?? 0)}pts)'
                                        : '${(lesson?.points ?? 0).toString()} pts',
                                    onTap: () => webService.webLink(
                                        urlLink:
                                            lesson?.virtualSessionUrl ?? ''),
                                  );
                                },
                              ),
                            ),
                            text: moduleData?.name ?? '',
                          );
                          // CoursesListTile(
                          //   icon: index == 0
                          //       ? Icons.arrow_forward_ios
                          //       : Icons.lock_outline,
                          //   title: moduleData?.name ?? '',
                          //   hours: moduleData?.length?.hours ?? 0,
                          //   minutes: moduleData?.length?.minutes ?? 0,
                          // );
                        },
                      ),
                    ),
                    SpaceY(24.dy),
                    Text("About Tutor",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                    SpaceY(16.dy),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0XFFEAECF0),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: kWhite),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              //!no profile image of instructor
                              AppImageView(
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                                radius: BorderRadius.circular(20),
                                url: (singleCourse?.instructors ?? [])
                                        .first
                                        .profilePicture ??
                                    '',
                                // imagePath: 'assets/images/active_learning.png',
                                imagePath: 'assets/images/active_profile.png',
                              ),

                              SpaceX(8.dx),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      (singleCourse?.instructors ?? [])
                                              .first
                                              .fullName ??
                                          kDummyName,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: kTextColorsLight)),
                                  Text(
                                      ((singleCourse?.instructors ?? [])
                                                          .first
                                                          .occupation ??
                                                      '')
                                                  .isEmpty ||
                                              ((singleCourse?.instructors ?? [])
                                                          .first
                                                          .occupation ??
                                                      '') ==
                                                  ''
                                          ? "Author role"
                                          : (singleCourse?.instructors ?? [])
                                                  .first
                                                  .occupation ??
                                              "Author role",
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: kGrey)),
                                ],
                              ),
                            ],
                          ),
                          SpaceY(8.dy),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                ((singleCourse?.instructors ?? []).first.bio ??
                                                '')
                                            .isEmpty ||
                                        ((singleCourse?.instructors ?? [])
                                                    .first
                                                    .bio ??
                                                '') ==
                                            ''
                                    ? "Author bio"
                                    : (singleCourse?.instructors ?? [])
                                            .first
                                            .bio ??
                                        "Author bio",
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kGrey)),
                          ),
                        ],
                      ),
                    ),
                    SpaceY(35.dy),
                    Divider(
                      height: 1.dy,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          moveToNextScreen(
                              context: context,
                              arguments: CheckOutCourseModel(
                                  courseId: singleCourse?.id ?? '',
                                  category: 'Design',
                                  hours: singleCourse?.courseLength?.hours ?? 0,
                                  minutes:
                                      singleCourse?.courseLength?.minutes ?? 0,
                                  instructor: (singleCourse?.instructors ?? [])
                                          .first
                                          .fullName ??
                                      '',
                                  lessons: (singleCourse?.modules ?? []).length,
                                  price: singleCourse?.price ?? 0,
                                  title: singleCourse?.title ?? ''),
                              page: CheckoutScreen.routeName);
                        },
                        buttonText:
                            "Enroll Now for - \$${singleCourse?.price ?? 0}"),
                    SpaceY(21.dy),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          "Get ${singleCourse?.points ?? 0} reward point at the end of the course.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kTextColorsLight)),
                    ),
                    SpaceY(30.dy)
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CoursesListTile extends StatelessWidget {
  const CoursesListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final String title, subtitle;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64.dy,
        width: 350.dx,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xffEAECF0))),
        margin: EdgeInsets.only(
            bottom: 8.dy, top: 16.dy, left: 16.dx, right: 16.dx),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.dy, horizontal: 16.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240,
                    child: Text(title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                  ),
                  Text(subtitle,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: kGrey)),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 12,
                  color: Color(0xff292D32),
                )),
          ],
        ),
      ),
    );
  }
}
