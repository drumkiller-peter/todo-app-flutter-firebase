import 'package:flutter/material.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';

class AppSnackBar {
  AppSnackBar._();

  static showSnackbar(
      BuildContext context, String message, MessageType messageType) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(
              _setIconData(messageType),
              size: 20,
              color: _setTextColor(messageType),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Text(
                message,
                style: AppTextTheme.bodyText2.copyWith(
                  color: _setTextColor(messageType),
                ),
              ),
            ),
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: Icon(
                Icons.close,
                size: 20,
                color: _setTextColor(messageType),
              ),
            ),
          ],
        ),
        backgroundColor: _setBgColor(messageType),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      ),
    );
  }

  static _setBgColor(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return AppColor.successBg;
      case MessageType.error:
        return AppColor.errorBg;
      case MessageType.warning:
        return AppColor.warning;
      default:
        return AppColor.successBg;
    }
  }

  static Color _setTextColor(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return AppColor.success;
      case MessageType.error:
        return AppColor.error;
      case MessageType.warning:
        return AppColor.black;
      default:
        return AppColor.success;
    }
  }

  static IconData _setIconData(MessageType messageType) {
    switch (messageType) {
      case MessageType.success:
        return Icons.check_circle;
      case MessageType.error:
        return Icons.cancel;
      case MessageType.warning:
        return Icons.warning;
      default:
        return Icons.check_circle;
    }
  }
}
