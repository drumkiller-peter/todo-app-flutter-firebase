import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._todoRepository, this._authenticationRepository)
      : super(HomeInitial()) {
    on<HomeEventGetTodoRequested>(fetchTodoListFromStore);
  }

  final TodoRepository _todoRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription? todoListSubs;

  Future<void> fetchTodoListFromStore(
      HomeEventGetTodoRequested event, Emitter<HomeState> emit) async {
    emit(HomeLoadInProgress());
    try {
      todoListSubs?.cancel();
      await emit.forEach(
        _todoRepository
            .fetchTodoForUser(_authenticationRepository.getUserData()!.uid),
        onData: (todos) => HomeSuccess(todoModelList: todos),
        onError: (error, stackTrace) => HomeFailure(
          error: error.toString(),
        ),
      );
    } catch (e) {
      emit(
        HomeFailure(error: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    todoListSubs?.cancel();
    return super.close();
  }
}
