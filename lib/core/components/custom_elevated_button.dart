// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/general_widget/app_loader.dart';
import '../configs/configs.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.color = kPrimaryColor,
    this.textColor = kWhite,
    this.width = 343,
    this.isLoading = false,
  }) : super(key: key);
  final Function()? onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final double? width;
  final bool isLoading;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: widget.width!.dx,
        height: 52.dy,
        child: ElevatedButton(
          onPressed: widget.isLoading ? null : widget.onPressed,
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return widget.color;
                } else if (states.contains(MaterialState.disabled)) {
                  return widget.color.withOpacity(0.5);
                }
                return widget.color; // Use the component's default.
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: widget.isLoading
              ? const AppLoader(
                  color: kWhite,
                )
              : Text(widget.buttonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: kWhite)),
        ),
      ),
    );
  }
}
