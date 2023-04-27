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
  final DateTime? selectedEventStartDate;
  final DateTime? selectedEventEndDate;
  CreateTodoDateUpdateRequested({
    this.selectedEventStartDate,
    this.selectedEventEndDate,
  });
  @override
  List<Object?> get props => [selectedEventStartDate, selectedEventEndDate];
}

class CreateTodoSyncWithCalendarRequested extends CreateTodoEvent {
  final bool isEnabled;

  CreateTodoSyncWithCalendarRequested(this.isEnabled);

  @override
  List<Object?> get props => [isEnabled];
}

class CreateTodoMediaUploadRequested extends CreateTodoEvent {
  final bool isEnabled;
  CreateTodoMediaUploadRequested({
    required this.isEnabled,
  });

  @override
  List<Object?> get props => [isEnabled];
}
