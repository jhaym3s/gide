import 'package:flutter/material.dart';
import 'package:gide/core/components/alerts.dart';
import 'package:gide/core/components/components.dart';
import 'package:gide/core/components/custom_back_button.dart';
import 'package:gide/core/configs/configs.dart';
import 'package:gide/core/configs/constants.dart';

class FundAccountScreen extends StatefulWidget {
  static const routeName = "fund_account_screen";
  const FundAccountScreen({super.key});

  @override
  State<FundAccountScreen> createState() => _FundAccountScreenState();
}

class _FundAccountScreenState extends State<FundAccountScreen> {
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: kTransparent,
        title: Text("Fund Account",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: kTextColorsLight)),
        leading: CustomBackButton(onTap: () {
          Navigator.of(context).pop();
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.dx),
          child: Column(
            children: [
              SpaceY(24.dy),
              Padding(
                padding: EdgeInsets.only(right: 30.dx),
                child: Text(
                    "Gain more then 1000 reward points each time you fund your account.",
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff667085))),
              ),
              SpaceY(24.dy),
              NormalTextFormField(
                  hintText: "\$0",
                  labelText: "Enter amount",
                  controller: amountController,
                  onChanged: (p0) {
                    setState((){});
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                  }),
                  SpaceY(67.dy),
                  CustomElevatedButton(
                  onPressed: amountController.text.isEmpty?null:(){
                    showFundingOption(context: context, onPressed: (){});
                  }, 
                  buttonText: "Proceed")
            ],
          ),
        ),
      ),
    );
  }
}
