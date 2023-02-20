import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/data/models/completion_model/completion_model.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

part 'todo_details_event.dart';
part 'todo_details_state.dart';

class TodoDetailsBloc extends Bloc<TodoDetailsEvent, TodoDetailsState> {
  TodoDetailsBloc(this._todoRepository) : super(TodoDetailsInitial()) {
    on<TodoDeleteRequested>((event, emit) async {
      emit(TodoDetailsLoadInProgress());
      final response = await _todoRepository.deleteTodo(uuid: event.uuid);

      if (!isClosed) {
        response.fold(
          (l) => emit(TodoDetailsFailure(failure: l)),
          (r) => emit(TodoDetailsSuccess(success: r)),
        );
      }
    });

    on<TodoMarkAsCompleteRequested>((event, emit) async {
      emit(TodoDetailsLoadInProgress());
      final response =
          await _todoRepository.markAsComplete(event.completionModel);

      if (!isClosed) {
        response.fold(
          (l) => emit(TodoDetailsFailure(failure: l)),
          (r) => emit(TodoDetailsSuccess(success: r)),
        );
      }
    });
  }

  final TodoRepository _todoRepository;
}
