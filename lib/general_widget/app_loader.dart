import 'package:flutter/cupertino.dart';
import 'package:gide/core/configs/constants.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({
    Key? key,
    this.color,
    this.size = 35,
  }) : super(key: key);
  final Color? color;
  final double size;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: widget.color ?? lightScaffoldBackgroundColor,
        animating: true,
      ),
    );
  }
}
