import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/preferences/app_preference.dart';

class TodoRepository {
  final Dio _dio = getIt.get<Dio>();
  final AppPreference _appPreference = getIt.get<AppPreference>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  getTodo() {}
  getTodoById() {}
  updateTodo() {}
  deleteTodo() {}

  List<TodoCategoriesModel> getCategories() {
    return _appPreference.getCategories();
  }

  Future<void> setCategories(
      List<TodoCategoriesModel> todoCategoriesModelList) async {
    await _appPreference.setCategories(todoCategoriesModelList);
  }

  Future<Either<String, void>> createTodo(TodoModel createTodoModel) async {
    try {
      CollectionReference eventCollection =
          _firebaseFirestore.collection(DbKeys.event);

      await eventCollection.doc().set(
            createTodoModel.toMap(),
            SetOptions(merge: false),
          );

      return right(null);
    } on FirebaseException catch (e) {
      return left(
        e.message.toString(),
      );
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Stream<List<TodoModel>> fetchTodoForUser(String uId) {
    return _firebaseFirestore
        .collection(DbKeys.event)
        .where(DbKeys.uId, isEqualTo: uId)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => TodoModel.fromJson(e.data())).toList();
    });
    // final data = documents
    //     .map(
    //       (doc) => TodoModel.fromJson(doc.data() as Map<String, dynamic>),
    //     )
    //     .toList();
    // log(data.toString());
    // yield documents
    //     .map(
    //       (doc) => TodoModel.fromJson(doc.data() as Map<String, dynamic>),
    //     )
    //     .toList();
  }
}
