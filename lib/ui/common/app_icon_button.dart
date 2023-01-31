// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.svgPath,
    required this.onTap,
  }) : super(key: key);
  final String svgPath;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.bgColorLight,
          borderRadius: BorderRadius.circular(36),
        ),
        child: SvgPicture.asset(
          svgPath,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
