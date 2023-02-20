import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class TodoDetailTitle extends StatelessWidget {
  const TodoDetailTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: AppText(
        title,
        style: AppTextTheme.bodyText1.copyWith(color: AppColor.greyText),
      ),
    );
  }
}
