import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/app_config/app_config_bloc.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/get_category_icon_widget.dart';

class CategoriesBottomSheet extends StatelessWidget {
  const CategoriesBottomSheet({
    super.key,
    required this.ctx,
  });
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Wrap(
      children: context
          .read<AppConfigBloc>()
          .allCategories
          .map(
            (e) => ListTile(
              onTap: () {
                ctx.read<CreateTodoBloc>().add(
                      CreateTodoCategoryChangeRequested(todoCategoriesModel: e),
                    );
                Navigator.pop(context);
              },
              leading: GetCategoryIcon(
                categoryId: e.categoryId,
                bgColor: AppColor.bgColor,
                iconColor: AppColor.primary,
              ),
              title: AppText(
                e.category,
                style: textTheme.bodyText1,
              ),
              subtitle: AppText(
                e.categoryDescription,
                style: textTheme.caption?.copyWith(
                  color: AppColor.white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
