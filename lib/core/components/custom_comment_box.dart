import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';

class CommentTextFormField extends StatelessWidget {
  const CommentTextFormField({
    super.key,
    required this.commentController, required this.hint, required this.labelText
  });

  final TextEditingController commentController;
  final String hint,labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,
        softWrap: true,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: kTextColorsLight)),
    SpaceY(8.dy),
        Container(
          height: 115.dy,
          width: kScreenWidth(context),
          decoration: BoxDecoration(
              color: const Color(0xffF9FAFB),
              border: Border.all(
                  color:
                      const Color(0xffEAECF0))),
          child: TextFormField(
            controller: commentController,
            maxLines: 4,
            decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                        fontSize: 14.sp,
                        fontWeight:
                            FontWeight.w400,
                        color: kGrey),
                hintText:
                    hint,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}