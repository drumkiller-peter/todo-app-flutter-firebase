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
      headline1: AppTextTheme.heading1,
      headline2: AppTextTheme.heading2,
      headline3: AppTextTheme.heading3,
      headline4: AppTextTheme.heading4,
      headline5: AppTextTheme.heading5,
      headline6: AppTextTheme.heading6,
      bodyText1: AppTextTheme.bodyText1,
      bodyText2: AppTextTheme.bodyText2,
      subtitle1: AppTextTheme.subTitle,
      caption: AppTextTheme.caption,
    ),
    useMaterial3: true,
    backgroundColor: AppColor.bgColor,
    // primaryColor: AppColor.primary,
    // colorScheme: const ColorScheme.light(primary: Colors.green),
    // dialogBackgroundColor: AppColor.primary,
    // dialogTheme: DialogTheme(
    //   iconColor: AppColor.primary,
    //   backgroundColor: AppColor.bgColor,
    //   titleTextStyle: AppTextTheme.bodyText2.copyWith(color: AppColor.white),
    //   contentTextStyle: AppTextTheme.bodyText2.copyWith(color: AppColor.white),
    // ),
  );
}
