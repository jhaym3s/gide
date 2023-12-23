// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gide/core/components/app_enums.dart';

// Project imports:
import 'package:gide/core/components/search_bar.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/core/services/config/configure_dependencies.dart';
import 'package:gide/features/authentication/notifier/auth_notifier.dart';
import 'package:gide/features/dashboard/explore/screens/course_detail_screen.dart';
import 'package:gide/features/dashboard/explore/widgets/explore_app_bar.dart';
import 'package:gide/general_widget/app_loader.dart';
import '../../../../core/configs/configs.dart';
import '../widgets/courses.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  static const routeName = "explore_screen";
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(authProvider.notifier);
      final catListresp = await notifier.getCatergories();
      final catList = (catListresp ?? []).map((e) => e.name);
      interestList = [...catList];
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(currentUserProvider);
    final catState = ref.watch(authProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.dx),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceY(15.dy),
                const ExploreAppBar(),
                SpaceY(21.dy),
                const CustomSearchBar(),
                SpaceY(32.dy),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColorsLight)),
                    Text("View All",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor)),
                  ],
                ),
                SpaceY(16.dy),
                Container(
                  height: 44.dy,
                  margin: EdgeInsets.zero, // Remove margin
                  padding: EdgeInsets.zero, // Remove padding
                  child: catState.loadState == LoadState.loading
                      ? const AppLoader(
                          color: kPrimaryColor,
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero, // Remove padding
                          scrollDirection: Axis.horizontal,
                          itemCount: interestList.length,
                          itemBuilder: (context, index) {
                            return ExploreCategories(
                              name: interestList[index] ?? '',
                            );
                          }),
                ),
                SpaceY(30.dy),
                Text("New Courses",
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                SpaceY(14.dy),
                SizedBox(
                  height: 260.dy,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              moveFromBottomNavBarScreen(
                                  context: context,
                                  targetScreen: const CourseDetailScreen());
                            },
                            child: const Courses());
                      }),
                ),
                SpaceY(30.dy),
                Text("Featured courses",
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColorsLight)),
                SpaceY(14.dy),
                Container(
                  height: 260.dy,
                  margin: EdgeInsets.zero, // Remove margin
                  padding: EdgeInsets.zero, // Remove padding
                  child: ListView.builder(
                      padding: EdgeInsets.zero, // Remove padding
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Courses();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.dx, top: 8.dy),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.dx, vertical: 9.5.dy),
        child: Text(name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: kTextColorsLight)),
      ),
    );
  }
}
