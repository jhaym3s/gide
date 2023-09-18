import 'package:flutter/material.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/configs/configs.dart';

import '../../../../core/router/router.dart';

class AddNumber extends StatefulWidget {
  static const routeName = "addNumber";
  const AddNumber({super.key});

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  final numberController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: CustomBackButton(onTap: () {
          moveToOldScreen(context: context);
        }),
        title: Text("Add Phone Number",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColorsLight)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.dx),
        child: Column(
          children: [
           NormalTextFormField(hintText: "", labelText: "Phone Number", controller: numberController, validator: (String? value){
            if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
           }),
            SpaceY(55.dy),
            CustomElevatedButton(onPressed: (){}, buttonText: "Add Number")
          ],
        ),
      ),
    );
  }
}