// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardEventGetTodoRequested extends DashboardEvent {
  final DateTime dateTime;
  DashboardEventGetTodoRequested({
    required this.dateTime,
  });

  @override
  List<Object?> get props => [dateTime];
}
