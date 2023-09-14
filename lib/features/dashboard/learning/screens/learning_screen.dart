import 'package:flutter/material.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/components/search_bar.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/dashboard/learning/widgets/learning_courses.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/custom_tab_bar.dart';
import '../widgets/completed_courses.dart';

class LearningScreen extends StatefulWidget {
  static const routeName = "learning_screen";
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceY(32.dy),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.dx),
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
           padding:  EdgeInsets.symmetric(horizontal: 20.dx),
            child: CustomTabBar(tabController: _tabController, label1: "Learning",label2: "Completed",label3: "Wishlist",),
          ),
                       Expanded(child: TabBarView(
                          controller: _tabController,
                          children: [
                          Column(
                            children: [
                              SpaceY(16.dy),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                                child: const CustomSearchBar(),
                              ),
                               SpaceY(24.dy),
                               Divider(height: 4.dy,color: kBlack.withOpacity(.4),),
                               SpaceY(10.dy),
                               Expanded(
                                 child: ListView.builder(itemBuilder: (context,index){
                                  return const LearningCourses();
                                 }),
                               )
                            ],
                          ),
                          Column(
                            children: [
                              SpaceY(16.dy),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.dx),
                                child: const CustomSearchBar(),
                              ),
                               SpaceY(24.dy),
                               Divider(height: 4.dy,color: kBlack.withOpacity(.4),),
                               SpaceY(10.dy),
                               Expanded(
                                 child: ListView.builder(itemBuilder: (context,index){
                                  return const CompletedCourses();
                                 }),
                               )
                            ],
                          ),
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
        padding:  EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImages.emptyLearning,height: 120.dy, width: 120.dx,),
            SpaceY(16.dy),
            Text("Nothing yet",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: kTextColorsLight)),
              SpaceY(8.dy),
             Text("You have not started any course yet. Keep browsing to and learn.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: kGrey)),
              SpaceY(16.dy),
              CustomElevatedButton(onPressed: (){
                
              }, buttonText: "Explore Courses")
          ],
        ),
      ),
    );
  }
}