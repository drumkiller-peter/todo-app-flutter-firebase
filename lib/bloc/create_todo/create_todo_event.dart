// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTodoRequested extends CreateTodoEvent {}

class CreateTodoCategoryChangeRequested extends CreateTodoEvent {
  final TodoCategoriesModel todoCategoriesModel;
  CreateTodoCategoryChangeRequested({
    required this.todoCategoriesModel,
  });
  @override
  List<Object?> get props => [todoCategoriesModel];
}

class CreateTodoDateUpdateRequested extends CreateTodoEvent {
  final DateTime selectedEventStartDate;
  final DateTime? selectedEventEndDate;
  CreateTodoDateUpdateRequested({
    required this.selectedEventStartDate,
    this.selectedEventEndDate,
  });
  @override
  List<Object?> get props => [selectedEventStartDate, selectedEventEndDate];
}

class CreateTodoTimeUpdateRequested extends CreateTodoEvent {
  final DateTime selectedEventStartTime;
  final DateTime? selectedEventEndTime;
  CreateTodoTimeUpdateRequested({
    required this.selectedEventStartTime,
    this.selectedEventEndTime,
  });
  @override
  List<Object?> get props => [selectedEventStartTime, selectedEventEndTime];
}
