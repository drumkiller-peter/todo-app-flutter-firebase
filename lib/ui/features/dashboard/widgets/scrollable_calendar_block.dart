import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:todo_app_flutter/bloc/dashboard/dashboard_bloc.dart';
import 'package:todo_app_flutter/data/models/app_calendar_model/app_calendar_model.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/calendar_item.dart';

class ScrollableCalendarBlock extends StatefulWidget {
  const ScrollableCalendarBlock({
    Key? key,
    required this.calendarData,
  }) : super(key: key);

  final List<TodoAppCalendarModelWithDayAndMonth> calendarData;

  @override
  State<ScrollableCalendarBlock> createState() =>
      _ScrollableCalendarBlockState();
}

class _ScrollableCalendarBlockState extends State<ScrollableCalendarBlock> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = context.read<AppCalendarBloc>().index!;
      context.read<AppCalendarBloc>().scrollController.jumpTo(index * 112.00);
    });

    super.initState();
  }

  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: context.read<AppCalendarBloc>().scrollController,
      child: Column(
          children: widget.calendarData
              .map(
                (e) => CalendarItem(
                  calendarData: e,
                  onPressed: () {
                    final now = DateTime.now();
                    final tappedDate = DateTime(
                      now.year,
                      e.monthId,
                      int.parse(e.day),
                    );

                    context.read<AppCalendarBloc>().add(
                        AppCalendarDayTapRequested(tappedDate: tappedDate));

                    context.read<DashboardBloc>().add(
                          DashboardEventGetTodoRequested(
                            dateTime: tappedDate,
                          ),
                        );
                  },
                ),
              )
              .toList()),
    );
  }
}
