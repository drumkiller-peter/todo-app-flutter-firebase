import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';
import 'package:todo_app_flutter/data/models/completion_model/completion_model.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/preferences/app_preference.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

class TodoRepository {
  final Dio _dio = getIt.get<Dio>();
  final AppPreference _appPreference = getIt.get<AppPreference>();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  List<TodoCategoriesModel> getCategories() {
    return _appPreference.getCategories();
  }

  Future<void> setCategories(
      List<TodoCategoriesModel> todoCategoriesModelList) async {
    await _appPreference.setCategories(todoCategoriesModelList);
  }

  Future<Either<String, void>> createTodo(TodoModel createTodoModel) async {
    try {
      if (createTodoModel.isSyncedWithGoogleCalendar) {
        await handleSyncWithGoogleCalendar(createTodoModel);
      }
      CollectionReference eventCollection =
          _firebaseFirestore.collection(DbKeys.event);

      await eventCollection.doc(createTodoModel.uuid).set(
            createTodoModel.toMap(),
            SetOptions(merge: false),
          );

      return right(null);
    } on FirebaseException catch (e) {
      return left(
        e.message.toString(),
      );
    }
  }

  Future<bool> handleSyncWithGoogleCalendar(TodoModel todoModel) async {
    final calendarResponse =
        await _authenticationRepository.authenticateClient();

    var calendar = CalendarApi(calendarResponse!);

    String calendarId = "primary";
    Event setGoogleEvent = Event(
      // iCalUID: todoModel.uuid,
      id: todoModel.uuid,
      description: todoModel.description,
      summary: todoModel.title,
      colorId: "2",
      created: DateTime.now(),
      start: EventDateTime(
        dateTime: todoModel.eventStartDate,
      ),
      end: EventDateTime(
        dateTime: todoModel.eventEndDate,
      ),
    );
    final isAdded = await calendar.events.insert(setGoogleEvent, calendarId);

    //TODO: Later Send a Notification mentioning the event
    if (isAdded.status == "confirmed") {
      log("Added to Calendar");
      return true;
    } else {
      log("Unable to add event in google calendar");
      return false;
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
  }

  Future<Either<String, void>> editTodo(TodoModel todoModel) async {
    try {
      CollectionReference eventCollection =
          _firebaseFirestore.collection(DbKeys.event);
      await eventCollection.doc(todoModel.uuid).update(todoModel.toMap());
      return right(null);
    } on FirebaseException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, String>> deleteTodo(
      {required String uuid, bool isSyncedWithCalendar = false}) async {
    try {
      if (isSyncedWithCalendar) {
        final calendarResponse =
            await _authenticationRepository.authenticateClient();

        var calendar = CalendarApi(calendarResponse!);
        await calendar.events.delete("primary", uuid, sendNotifications: true);
      }
      CollectionReference eventCollection =
          _firebaseFirestore.collection(DbKeys.event);
      await eventCollection.doc(uuid).delete();
      return right(AppString.deleteTodoSuccess);
    } on FirebaseException catch (e) {
      return left(e.message!);
    }
  }

  Future<Either<String, String>> markAsComplete(
      CompletionModel completionModel) async {
    try {
      CollectionReference completionCollection =
          _firebaseFirestore.collection(DbKeys.completedEvents);
      CollectionReference eventCollection =
          _firebaseFirestore.collection(DbKeys.event);

      await completionCollection
          .doc(completionModel.uuid)
          .set(completionModel.toJson());

      eventCollection.doc(completionModel.uuid).update(
        {
          DbKeys.isEventCompleted: true,
        },
      );
      return right(AppString.markedAsCompletedSuccess);
    } on FirebaseException catch (e) {
      return left(e.message!);
    }
  }
}
