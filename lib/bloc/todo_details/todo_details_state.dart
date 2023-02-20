part of 'todo_details_bloc.dart';

class TodoDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoDetailsInitial extends TodoDetailsState {}

class TodoDetailsLoadInProgress extends TodoDetailsState {}

class TodoDetailsFailure extends TodoDetailsState {
  final String failure;
  TodoDetailsFailure({
    required this.failure,
  });
  @override
  List<Object?> get props => [failure];
}

class TodoDetailsSuccess extends TodoDetailsState {
  final String success;
  TodoDetailsSuccess({
    required this.success,
  });
  @override
  List<Object?> get props => [success];
}
