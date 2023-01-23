import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc(this._todoRepository) : super(AppConfigInitial()) {
    on<AppConfigGetCategoryRequested>((event, emit) async {
      final jsonData =
          await rootBundle.loadString('assets/json/app_category_json.json');

      final List<dynamic> decodedData = jsonDecode(jsonData);
      allCategories = decodedData
          .map((dynamic e) => TodoCategoriesModel.fromJson(e))
          .toList();
      _todoRepository.setCategories(allCategories);
    });
  }
  final TodoRepository _todoRepository;
   List<TodoCategoriesModel> allCategories = [];
}
