import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/loading_indicator.dart';

class AppLoadingDialog {
  AppLoadingDialog._();
  static Future openLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.black.withOpacity(0.2),
          child: const LoadingIndicator(),
        );
      },
    );
  }
}
