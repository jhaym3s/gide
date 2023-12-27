import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String text;
  final Widget content;

  const ExpandableContainer(
      {super.key, required this.text, required this.content});
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
        height: _isExpanded ? 700 : 64,
        width: 396,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.arrow_left_outlined,
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
