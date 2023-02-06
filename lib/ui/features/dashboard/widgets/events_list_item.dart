import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/get_category_icon_widget.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.bgColor.withOpacity(0.7),
            border: const Border(
              bottom: BorderSide(color: AppColor.greyText),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GetCategoryIcon(
                    categoryId: todoModel.todoCategoriesModel.categoryId,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      Assets.images.svg.collab,
                      height: 14,
                      width: 14,
                      color: AppColor.cyan,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      todoModel.title,
                      style: textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                    AppText(
                      todoModel.todoCategoriesModel.category,
                      style: textTheme.bodyText2!.copyWith(
                        color: AppColor.warning,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      todoModel.eventStartTime.getTimeOnly(),
                      style: textTheme.caption?.copyWith(color: AppColor.blue),
                    ),
                    AppText(
                      todoModel.eventEndTime?.getTimeOnly() ?? "",
                      style: textTheme.caption?.copyWith(color: AppColor.blue),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
