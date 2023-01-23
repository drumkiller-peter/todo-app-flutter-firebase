import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class AppBottomSheet {
  AppBottomSheet._();
  static openBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColor.bgColorLight,
      context: context,
      builder: (context) {
        return child;
      },
    );
  }
}
