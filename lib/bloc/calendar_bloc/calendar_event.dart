// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calendar_bloc.dart';

@immutable
abstract class AppCalendarEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppCalendarGenerateRequested extends AppCalendarEvent {
  final DateTime tappedDate;
  AppCalendarGenerateRequested({
    required this.tappedDate,
  });

  @override
  List<Object?> get props => [tappedDate];
}

class AppCalendarDayTapRequested extends AppCalendarEvent {
  final DateTime tappedDate;
  AppCalendarDayTapRequested({
    required this.tappedDate,
  });


  @override
  List<Object?> get props => [tappedDate];
}
