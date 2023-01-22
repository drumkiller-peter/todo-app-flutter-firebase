import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextStyle heading1 = const TextStyle(
    fontSize: 29,
    color: AppColor.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle heading2 = const TextStyle(
    fontSize: 24,
    color: AppColor.white,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColor.white,
  );

  static const TextStyle heading5 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle heading6 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );

  static TextStyle bodyText1 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static TextStyle bodyText2Bold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
    height: 1.4,
  );

  static TextStyle subTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.black.withOpacity(0.54),
  );

  static TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.black.withOpacity(0.54),
  );

  static TextStyle caption2 = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static TextStyle captionSmall = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
}
