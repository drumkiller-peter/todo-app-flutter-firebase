part of 'dashboard_bloc.dart';

@immutable
class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadInProgress extends DashboardState {}

class DashboardFailure extends DashboardState {
  final String error;
  DashboardFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class DashboardSuccess extends DashboardState {
  final List<TodoModel> allTodosForToday;
  DashboardSuccess({
    required this.allTodosForToday,
  });

  @override
  List<Object?> get props => [allTodosForToday];
}
