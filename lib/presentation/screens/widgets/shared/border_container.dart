import 'package:flutter/widgets.dart';

class BorderContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color colorTheme;
  final Widget widget;
  const BorderContainer({super.key, required this.width, required this.height, required this.colorTheme, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorTheme.withOpacity(.2),
              width: 2.0,
            ),
          ),
          child: widget,
        );
  }
}