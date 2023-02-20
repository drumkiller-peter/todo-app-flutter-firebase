// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
    return AppText(
      title,
      style: AppTextTheme.heading6,
    );
  }
}
