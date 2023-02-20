// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_details_bloc.dart';

@immutable
abstract class TodoDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoDeleteRequested extends TodoDetailsEvent {
  final String uuid;
  final bool isSyncedWithGoogleCalendar;
  TodoDeleteRequested({
    required this.uuid,
    required this.isSyncedWithGoogleCalendar,
  });
  @override
  List<Object?> get props => [uuid, isSyncedWithGoogleCalendar];
}

class TodoMarkAsCompleteRequested extends TodoDetailsEvent {
  final CompletionModel completionModel;
  TodoMarkAsCompleteRequested({
    required this.completionModel,
  });

  @override
  List<Object?> get props => [completionModel];
}
