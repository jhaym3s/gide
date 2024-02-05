// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';

class NormalTextFormField extends StatelessWidget {
  const NormalTextFormField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.width = 343,
      this.suffixIcon,
      this.onChanged,
      this.keyboardType,
      this.inputFormatters,
      required this.validator})
      : super(key: key);
  final String? hintText;
  final String labelText;
  final TextEditingController controller;
  final double width;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: const Color(0xff1C1C1E)),
        ),
        SpaceY(4.dy),
        TextFormField(
          controller: controller,
          // maxLength: ,
          // maxLengthEnforcement: ,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: kTextColorsLight,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          cursorHeight: 20.dy,
          cursorColor: kTextColorsLight,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: const Color(0xFFB7B7B9),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            filled: true,
            fillColor: const Color(0xffF9FAFB),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0.dy, horizontal: 10.0.dx),
            // border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffEAECF0)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffEAECF0)),
              borderRadius: BorderRadius.circular(8),
            ),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          onSaved: (newValue) {},
          validator: validator,
        ),
      ],
    );
  }
}
