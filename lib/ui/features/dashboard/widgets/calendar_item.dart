// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';
import 'package:todo_app_flutter/data/models/app_calendar_model/app_calendar_model.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    Key? key,
    required this.calendarData,
    required this.onPressed,
  }) : super(key: key);

  final TodoAppCalendarModelWithDayAndMonth calendarData;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return BlocBuilder<AppCalendarBloc, AppCalendarState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onPressed,
          child: Stack(
            key: key,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: state is AppCalendarSuccess
                      ? state.selectedDateTime.day.toString() ==
                              calendarData.day
                          ? AppColor.bgColorLight
                          : Colors.transparent
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    AppText(
                      calendarData.day,
                      style: AppTextTheme.superHeader44,
                    ),
                    AppText(calendarData.month, style: AppTextTheme.bodyText1)
                  ],
                ),
              ),
              calendarData.day == DateTime.now().day.toString()
                  ? const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColor.bgColor,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColor.primary,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
