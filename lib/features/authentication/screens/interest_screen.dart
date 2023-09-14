import 'package:flutter/material.dart';
import 'package:gide/features/authentication/widgets/interest_cards.dart';
import 'package:gide/features/dashboard/custom_navigation_bar.dart';

import '../../../core/components/components.dart';
import '../../../core/configs/configs.dart';
import '../../../core/router/router.dart';

//? sign up
class InterestScreen extends StatefulWidget {
  static const routeName = "interest_screen";
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final interestList = [
    "UI/UX Design","Product Management","Mobile","Frontend Development","Digital Marketing","Backend Development","Copy Writing","Data Science",
  ];
   final List<int> selectedItems = [];
   
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
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
                        fontSize: 24.sp, fontWeight: FontWeight.w500,color: kTextColorsLight)),
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
                        onTap: (){
                       if (selectedItems.contains(index)) {
                        setState(() {
                         selectedItems.remove(index);
                        });
                       } else {
                        setState(() {
                         selectedItems.add(index);
                        });
                       }
                        },
                        child: InterestCards(name: interestList[index],index: index,selectedItems: selectedItems,));
                })
                ),
                SpaceY(40.dy),
                CustomElevatedButton(
                    onPressed: () {
                      moveAndClearStack(context: context, page: CustomNavigationBar.routeName);
                    },
                    buttonText: "Get Started"),
              ],
            ),
          )),
    );
  }
}

