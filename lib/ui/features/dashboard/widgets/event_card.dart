// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/video_player_screen/mini_video_player.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.todoModel,
    required this.totalTodos,
    required this.itemIndex,
  }) : super(key: key);

  final TodoModel todoModel;
  final int totalTodos;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xff3C4680),
            offset: Offset(5, 2),
            // blurStyle: BlurStyle.outer,
            blurRadius: 2,
          ),
          BoxShadow(
            color: AppColor.bgColorLight,
            offset: Offset(-5, -2),
            // blurStyle: BlurStyle.outer,
            blurRadius: 2,
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff454D8F),
              Color(0xff262B4F),
            ]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppText(
                    "${todoModel.eventStartDate.getTimeOnly()} - ${todoModel.eventEndDate.getTimeOnly()}"),
              ),
              SvgPicture.asset(
                Assets.images.svg.icEdit,
                color: AppColor.white,
                height: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          AppText(
            todoModel.title,
            style: AppTextTheme.heading1,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(
            height: 16,
          ),
          AppText(
            todoModel.description,
            style: AppTextTheme.bodyText1,
            maxLines: todoModel.mediaUrl != null ? 1 : 5,
            overflow: TextOverflow.ellipsis,
          ),
          todoModel.mediaUrl != null
              ? todoModel.isImage ?? false
                  ? AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl: todoModel.mediaUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: 16 / 12,
                      child: MiniVideoPlayerScreen(source: todoModel.mediaUrl!))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 28,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.pink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppText(todoModel.todoCategoriesModel.category),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: AppColor.bgColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.bgColorLight,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      )
                    ]),
                child: AppText("$itemIndex/$totalTodos")),
          ),
        ],
      ),
    );
  }
}
