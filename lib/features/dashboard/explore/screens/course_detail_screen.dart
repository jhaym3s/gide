// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/explore/notifier.dart/course_notifier.dart';
import 'package:gide/features/dashboard/explore/screens/checkout_screen.dart';
import 'package:gide/features/dashboard/explore/widgets/courses.dart';
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
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: FlutterLogo(),
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
            state.loadState == LoadState.loading
                ? const Center(
                    child: AppLoader(
                      color: kPrimaryColor,
                    ),
                  )
                : Padding(
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
                                    points:
                                        (singleCourse?.points ?? 0).toString()),
                                SpaceX(4.dx),
                                const Icon(
                                  Icons.info_outline,
                                  color: Color(0xff292D32),
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                            singleCourse?.title ??
                                "Introduction to programming",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kTextColorsLight)),
                        SpaceY(8.dy),
                        Text(
                            "With ${(singleCourse?.instructors ?? []).first.fullName ?? 'Tom Lingard'}",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kGrey)),
                        SpaceY(8.dy),
                        Text(
                            "${singleCourse?.courseLength?.hours ?? 0}h:${singleCourse?.courseLength?.minutes ?? 00}mins . ${(singleCourse?.modules ?? []).length} Lessons",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColorsLight)),
                        SpaceY(8.dy),
                        ExpandableText(
                          singleCourse?.description ?? '',
                          // 'In this course you will learn the range of features and capabilities of figma, including: UI design, prototyping, collaboration, plugins and design systems Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          // 'Suspendisse potenti. Nulla aliquam, justo eu convallis vehicula, '
                          // 'elit libero dignissim purus, non tempus arcu tortor at metus. '
                          // 'Read more about this text...',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                            Text("Courses",
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColorsLight)),
                            Text(
                                "${(singleCourse?.modules ?? []).length} in total",
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
                          height: 200.dy,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: (singleCourse?.modules ?? []).length,
                            itemBuilder: (context, index) {
                              final moduleData = singleCourse?.modules?[index];
                              return CoursesListTile(
                                icon: index == 0
                                    ? Icons.arrow_forward_ios
                                    : Icons.lock_outline,
                                title: moduleData?.name ?? '',
                                hours: moduleData?.length?.hours ?? 0,
                                minutes: moduleData?.length?.minutes ?? 0,
                              );
                            },
                          ),
                        ),
                        SpaceY(24.dy),
                        Text("About Tutor",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
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
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: kGrey,
                                  ),
                                  SpaceX(8.dx),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          (singleCourse?.instructors ?? [])
                                                  .first
                                                  .accountType ??
                                              "Figma Designer",
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
                              //!no instructor bio yet
                              Text(
                                  "I bring a wealth of experience and expertise to the table. With 8 years of hands-on experience in the field, I have had the privilege of working on a diverse range of projects, from mobile apps and web interfaces to physical product design. ",
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
                        ),
                        SpaceY(35.dy),
                        Divider(
                          height: 1.dy,
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              moveToNextScreen(
                                  context: context,
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
  const CoursesListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.hours,
      required this.minutes});
  final IconData icon;
  final String title;
  final int hours, minutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.dy,
      width: 350.dx,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEAECF0))),
      margin: EdgeInsets.only(bottom: 8.dy),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.dy, horizontal: 16.dx),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                Text("${hours}hrs:${minutes}mins",
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey)),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Color(0xff292D32),
              )),
        ],
      ),
    );
  }
}
