import 'package:dio/dio.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';

class TodoRepository {
  final Dio _dio = getIt.get<Dio>();

  createTodo() {}
  getTodo() {}
  getTodoById() {}
  updateTodo() {}
  deleteTodo() {}
}
