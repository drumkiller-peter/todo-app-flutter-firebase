import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._todoRepository, this._authenticationRepository)
      : super(DashboardInitial()) {
    on<DashboardEventGetTodoRequested>(fetchTodoListFromStore);
  }

  final TodoRepository _todoRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription? todoListSubs;

  Future<void> fetchTodoListFromStore(DashboardEventGetTodoRequested event,
      Emitter<DashboardState> emit) async {
    emit(DashboardLoadInProgress());
    try {
      todoListSubs?.cancel();
      await emit.forEach(
        _todoRepository
            .fetchTodoForUser(_authenticationRepository.getUserData()!.uid),
        onData: (todos) => DashboardSuccess(todoModelList: todos),
        onError: (error, stackTrace) => DashboardFailure(
          error: error.toString(),
        ),
      );
    } catch (e) {
      emit(
        DashboardFailure(error: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    todoListSubs?.cancel();
    return super.close();
  }
}
