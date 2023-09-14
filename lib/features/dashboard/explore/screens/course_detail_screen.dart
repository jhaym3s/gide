import 'package:flutter/material.dart';
import 'package:gide/core/components/custom_elevated_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/explore/screens/checkout_screen.dart';
import 'package:gide/features/dashboard/explore/widgets/courses.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';


class CourseDetailScreen extends StatefulWidget {
  static const routeName = "course_detail_screen";
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              height: 224.dy, width: kScreenWidth(context),
              color: kBlack,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceY(18.dy),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   Text("Design",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: kGrey)), 
                  Row(
                    children: [
                      const DetailsPointsTile(points: "500"),
                      SpaceX(4.dx),
                  const Icon(Icons.info_outline, color: Color(0xff292D32),)
                    ],
                  )
                    ],
                  ),
                Text("Quick steps to Figma",
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: kTextColorsLight)),
        SpaceY(8.dy),
        Text("With Tom Lingard",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: kGrey)),
        SpaceY(8.dy),
        Text("8h:20mins . 12 Lessons",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: kGrey)),
                SpaceY(32.dy),
                 Divider(height: 1.dy,),
               SpaceY(20.dy),
             Text("Course description",
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColorsLight)),
              SpaceY(8.dy),
            ExpandableText(
          'In this course you will learn the range of features and capabilities of figma, including: UI design, prototyping, collaboration, plugins and design systems Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
          'Suspendisse potenti. Nulla aliquam, justo eu convallis vehicula, '
          'elit libero dignissim purus, non tempus arcu tortor at metus. '
          'Read more about this text...',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: kGrey),
          linkTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
          readMoreText: 'Read more',
          readLessText: 'Read less',
          trim: 3, // You can set the maximum number of lines to display
        ),
        SpaceY(24.dy),
        Divider(height: 1.dy,),
         SpaceY(32.dy),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Courses",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextColorsLight)),
                Text("5 in total",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: kTextColorsLight)),
          ],
         ),
         SpaceY(16.dy),
            const CoursesListTile(icon: Icons.arrow_forward_ios,),
            const CoursesListTile(icon: Icons.lock_outline,),
            const CoursesListTile(icon: Icons.lock_outline,),
            const CoursesListTile(icon: Icons.lock_outline,),
            const CoursesListTile(icon: Icons.lock_outline,),
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
                  border: Border.all(color: Color(0XFFEAECF0), ),
                  borderRadius: BorderRadius.circular(8),
                  color: kWhite
                ),
                child:  Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 20,backgroundColor: kGrey,),
                        SpaceX(8.dx),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(kDummyName,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: kTextColorsLight)),
                        Text("Figma Designer",
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kGrey)),
                          ],
                        ),
                      ],
                    ),
                    SpaceY(8.dy),
                  Text("I bring a wealth of experience and expertise to the table. With 8 years of hands-on experience in the field, I have had the privilege of working on a diverse range of projects, from mobile apps and web interfaces to physical product design. ",
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kGrey)),
                  ],
                ),
              ),
              SpaceY(35.dy),
              Divider(height: 1.dy,),
              CustomElevatedButton(onPressed: (){
                moveToNextScreen(context: context, page: CheckoutScreen.routeName);
              }, buttonText: "Enroll Now for - \$20"),
              SpaceY(21.dy),
              Text("Get 500 reward point at the end of the course.",
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kTextColorsLight)),
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
    super.key, required this.icon
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 64.dy, width: 350.dx,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(8),
       border: Border.all(color: const Color(0xffEAECF0))
     ),
     margin: EdgeInsets.only(bottom: 8.dy),
     child:  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Padding(
           padding:  EdgeInsets.symmetric(vertical: 11.dy, horizontal: 16.dx),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text("Introduction to about course",
           softWrap: true,
           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               fontSize: 14.sp,
               fontWeight: FontWeight.w500,
               color: kTextColorsLight)), 
             Text("2hrs:20mins",
           softWrap: true,
           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
               fontSize: 14.sp,
               fontWeight: FontWeight.w400,
               color: kGrey)), 
             ],
           ),
         )
         ,
         IconButton(onPressed: (){}, icon: Icon(icon, color: Color(0xff292D32),)),
       ],
     ),
    );
  }
}