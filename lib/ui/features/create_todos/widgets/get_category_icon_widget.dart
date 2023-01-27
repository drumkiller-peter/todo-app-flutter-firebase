// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';
import 'package:todo_app_flutter/ui/common/app_icon_with_bg.dart';

class GetCategoryIcon extends StatelessWidget {
  const GetCategoryIcon({
    Key? key,
    required this.categoryId,
    this.svgPath,
    this.bgColor,
    this.iconColor,
    this.radius,
  }) : super(key: key);

  final int categoryId;
  final String? svgPath;
  final Color? bgColor;
  final Color? iconColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return AppIconWithBg(
      svgPath: svgPath ?? _getAssetPath(categoryId),
      bgColor: bgColor,
      iconColor: iconColor,
      radius: radius,
    );
  }

  String _getAssetPath(int categoryId) {
    return AppConstants.categoryIcon[categoryId - 1];
  }
}
