// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';

class GetCategoryIcon extends StatelessWidget {
  const GetCategoryIcon({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _getAssetPath(categoryId),
      color: AppColor.cyan,
    );
  }

  String _getAssetPath(int categoryId) {
    return AppConstants.categoryIcon[categoryId - 1];
  }
}
