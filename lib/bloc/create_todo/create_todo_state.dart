// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_todo_bloc.dart';

@immutable
abstract class CreateTodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTodoInitial extends CreateTodoState {}

class CreateTodoLoadInProgress extends CreateTodoState {}

class CreateTodoFailure extends CreateTodoState {
  final String error;
  CreateTodoFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class CreateTodoSuccess extends CreateTodoState {
  final String success;
  CreateTodoSuccess({
    required this.success,
  });

  @override
  List<Object?> get props => [success];
}

class CreateTodoCategoryChanged extends CreateTodoState {
  final TodoCategoriesModel todoCategoriesModel;
  CreateTodoCategoryChanged({
    required this.todoCategoriesModel,
  });
  @override
  List<Object?> get props => [todoCategoriesModel];
}

class CreateTodoDateChanged extends CreateTodoState {
  final DateTime selectedStartDate;
  final DateTime? selectedEndDate;

  CreateTodoDateChanged({
    required this.selectedStartDate,
     this.selectedEndDate,
  });
  @override
  List<Object?> get props => [selectedStartDate, selectedEndDate];
}

class CreateTodoTimeChanged extends CreateTodoState {
  final DateTime selectedStartTime;
  final DateTime? selectedEndTime;

  CreateTodoTimeChanged({
    required this.selectedStartTime,
     this.selectedEndTime,
  });
  @override
  List<Object?> get props => [selectedStartTime, selectedEndTime];
}
