import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/data/models/app_calendar_model/app_calendar_model.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class AppCalendarBloc extends Bloc<AppCalendarEvent, AppCalendarState> {
  AppCalendarBloc() : super(AppCalendarInitial()) {
    on<AppCalendarGenerateRequested>((event, emit) async {
      emit(AppCalendarLoadInProgress());
      DateTime today = DateTime.now();
      int year = DateTime.now().year;
      int month = DateTime.now().month;

      int daysInMonth = DateUtils.getDaysInMonth(year, month);

      int firstDayOfMonth = DateTime(year, month, 1).weekday;

      for (int i = 0; i <= daysInMonth + firstDayOfMonth; i++) {
        if (i > firstDayOfMonth) {
          myList.add(
            TodoAppCalendarModelWithDayAndMonth(
              day: "${i - firstDayOfMonth}",
              month: _getMonthName(month),
              monthId: month,
            ),
          );
        }
      }
      index = myList.indexWhere((date) => date.day == today.day.toString());

      emit(
        AppCalendarSuccess(
          calendarData: myList,
          selectedDateTime: event.tappedDate,
        ),
      );
    });

    on<AppCalendarDayTapRequested>(
      (event, emit) => emit(
        AppCalendarSuccess(
            calendarData: myList, selectedDateTime: event.tappedDate),
      ),
    );
  }

  ScrollController scrollController = ScrollController();
  List<TodoAppCalendarModelWithDayAndMonth> myList =
      <TodoAppCalendarModelWithDayAndMonth>[];

  int? index;

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
