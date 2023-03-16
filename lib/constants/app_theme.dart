import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';

// overall theme of app
class AppTheme {
  AppTheme._();

  static final defaultTheme = ThemeData(
    fontFamily: "Quicksand",
    scaffoldBackgroundColor: AppColor.bgColor,
    textTheme: TextTheme(
      displayLarge: AppTextTheme.heading1,
      displayMedium: AppTextTheme.heading2,
      displaySmall: AppTextTheme.heading3,
      headlineMedium: AppTextTheme.heading4,
      headlineSmall: AppTextTheme.heading5,
      titleLarge: AppTextTheme.heading6,
      bodyLarge: AppTextTheme.bodyText1,
      bodyMedium: AppTextTheme.bodyText2,
      titleMedium: AppTextTheme.subTitle,
      bodySmall: AppTextTheme.caption,
    ),
    useMaterial3: true,
  );
}
