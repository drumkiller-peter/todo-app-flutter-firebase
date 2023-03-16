import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/event_swiper_block.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/scrollable_calendar_block.dart';

class CalendarAndTasksBlock extends StatelessWidget {
  const CalendarAndTasksBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AppCalendarBloc, AppCalendarState>(
            buildWhen: (previous, current) => current is AppCalendarSuccess,
            builder: (context, state) {
              return state is AppCalendarSuccess
                  ? ScrollableCalendarBlock(
                      calendarData: state.calendarData,
                    )
                  : const SizedBox();
            },
          ),
          const SizedBox(
            width: 12,
          ),
          const EventSwiperItem(),
        ],
      ),
    );
  }
}
