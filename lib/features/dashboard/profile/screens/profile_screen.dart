import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/router/router.dart';
import 'package:gide/features/dashboard/profile/screens/edit_personal_details_screen.dart';

import '../widgets/profile_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "profile_screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoopActive = false;
  bool isSubtitleActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: false,
        title: 
      Text("Settings",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kTextColorsLight)
                  ),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.dx),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
              SpaceY(24.dy),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Personal information",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor)),
                   GestureDetector(
                    onTap: () {
                      moveFromBottomNavBarScreen(context: context, targetScreen: const EditPersonalDetailsScreen());
                    },
                     child: Row(
                       children: [
                         Text("Edit",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor)),
                          Image.asset(AssetsImages.edit, height: 14.dy,width: 14.dx,),
                       ],
                     ),
                   ),
                ],
              ),
              SpaceY(8.dy),
                const ProfileCard(
                  children: [
            PersonalInfoDetails(sub: "Brownmax001@mail.com",title: "Email address",image:AssetsImages.mail),
            PersonalInfoDetails(sub: "Br.......021",title: "Password",image:AssetsImages.lock),
             PersonalInfoDetails(sub: "N/A",title: "Phone Number",image:AssetsImages.phone),
                  ],
                ),
              SpaceY(24.dy), 
              Text("Support",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor)),
                SpaceY(8.dy), 
                const ProfileCard(
                  children: [
            SupportListTile(title: "Become an Instructor",image:AssetsImages.tutor, suffixWidget:  Icon(Icons.arrow_forward_ios,size: 18,),),
            SupportListTile(title: "About Us",image:AssetsImages.info,suffixWidget:  Icon(Icons.arrow_forward_ios,size: 18,),),
            SupportListTile(title: "Contact Us",image:AssetsImages.message, suffixWidget:  Icon(Icons.arrow_forward_ios,size: 18,),),
                  ],
                ),
                  SpaceY(24.dy), 
              Text("Video Player settings",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor)),
                SpaceY(8.dy), 
             ProfileCard(
             children: [
             SupportListTile(title: "Video Loop",image:AssetsImages.videoLoop, suffixWidget: CustomSwitch(isActive: isLoopActive,onChanged: (p0) {
               setState(() {
                 isLoopActive = !isLoopActive;
               });
             },)),
             SupportListTile(title: "Video Subtitle",image:AssetsImages.videoSubtitle,suffixWidget: CustomSwitch(isActive: isSubtitleActive,onChanged: (p0) {
               setState(() {
                 isSubtitleActive = !isSubtitleActive;
               });}
               ),),
                ],
                ),
                SpaceY(24.dy),
                Row(
                  children: [
                    Image.asset(AssetsImages.logout, height: 24.dy, width: 24.dx,),
                    SpaceX(8.dx),
                    Text("Logout",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: kError)),
                  ],
                ),
                SpaceY(32.dy),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key, required this.isActive, required this.onChanged
  });
  final bool isActive;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
    scale: 0.5, // Adjust the scale factor as needed to change the size
    child: CupertinoSwitch(
      activeColor: kPrimaryColor,
    value: isActive, // Example value
    onChanged: onChanged
  ),
);
  }
}



class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key, required this.children
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24.dy,left: 16.dx, bottom: 8.dy),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffF2F4F7))
      ),
      child:  Column(
        children: children
      ),
    );
  }
}

