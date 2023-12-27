import 'package:flutter/material.dart';
import 'package:gide/core/configs/configs.dart';

class ExpandableContainer extends StatefulWidget {
  final String text;
  final Widget content;
  final int hour, minutes;

  const ExpandableContainer(
      {super.key,
      required this.text,
      required this.content,
      required this.hour,
      required this.minutes});
  @override
  // ignore: library_private_types_in_public_api
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        duration: const Duration(milliseconds: 300),
        height: _isExpanded ? 350 : 64,
        width: 396,
        margin: EdgeInsets.only(bottom: 16.dy),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.text,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColorsLight)),
                        Text("${widget.hour}hrs:${widget.minutes}mins",
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kGrey)),
                      ],
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              if (_isExpanded)
                Container(
                  width: 390,
                  height: 410,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: widget.content,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
