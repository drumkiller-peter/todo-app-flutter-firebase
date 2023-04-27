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
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;

  CreateTodoDateChanged({
    this.selectedStartDate,
    this.selectedEndDate,
  });
  @override
  List<Object?> get props => [selectedStartDate, selectedEndDate];
}

class CreateTodoTimeChanged extends CreateTodoState {
  final DateTime? selectedStartTime;
  final DateTime? selectedEndTime;

  CreateTodoTimeChanged({
    this.selectedStartTime,
    this.selectedEndTime,
  });
  @override
  List<Object?> get props => [selectedStartTime, selectedEndTime];
}

class CreateTodoSyncCalendarChanged extends CreateTodoState {
  final bool isEnabled;
  CreateTodoSyncCalendarChanged({
    required this.isEnabled,
  });

  @override
  List<Object?> get props => [isEnabled];
}

class CreateTodoMediaUploadSuccess extends CreateTodoState {
  final String fileUrl;
  final bool isImage;
  final String fileName;
  CreateTodoMediaUploadSuccess({
    required this.fileUrl,
    required this.isImage,
    required this.fileName,
  });

  @override
  List<Object?> get props => [fileUrl, isImage];
}

class CreateTodoMediaUploadLoadInProgress extends CreateTodoState {}

class CreateTodoMediaUploadOnSwitchChanged extends CreateTodoState {
  final bool isEnabled;
  CreateTodoMediaUploadOnSwitchChanged({
    required this.isEnabled,
  });

  @override
  List<Object?> get props => [isEnabled];
}

class CreateTodoMediaUploadFailure extends CreateTodoState {
  final String error;
  CreateTodoMediaUploadFailure({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
