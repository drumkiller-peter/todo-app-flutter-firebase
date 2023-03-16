// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calendar_bloc.dart';

@immutable
abstract class AppCalendarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppCalendarInitial extends AppCalendarState {}

class AppCalendarLoadInProgress extends AppCalendarState {}

class AppCalendarFailure extends AppCalendarState {}

class AppCalendarSuccess extends AppCalendarState {
  final List<TodoAppCalendarModelWithDayAndMonth> calendarData;
  final DateTime selectedDateTime;
  AppCalendarSuccess({
    required this.calendarData,
    required this.selectedDateTime,
  });

  @override
  List<Object?> get props => [calendarData, selectedDateTime];
}
