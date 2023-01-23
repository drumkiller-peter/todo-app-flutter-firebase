// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class AppIconWithBg extends StatelessWidget {
  const AppIconWithBg({
    Key? key,
    required this.svgPath,
    this.radius,
    this.bgColor,
    this.iconColor,
  }) : super(key: key);
  final String svgPath;
  final Color? bgColor;
  final Color? iconColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 24,
      backgroundColor: bgColor ?? AppColor.bgColorLight,
      child: SvgPicture.asset(
        svgPath,
        color: iconColor ?? AppColor.primary,
      ),
    );
  }
}
