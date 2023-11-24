import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.icon, {
    this.color,
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final String icon;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: height,
      width: width,
      // color: activeColor,
      semanticsLabel: icon,
    );
  }
}
