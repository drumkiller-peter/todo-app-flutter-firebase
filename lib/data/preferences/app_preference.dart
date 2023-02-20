// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/models/user_model/user_model.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  AppPreference({
    required this.sharedPreferences,
  });

  static const String _user = 'user';
  static const String _token = 'token';
  static const String _isOnBoarded = 'is-on-boarded';
  static const String _categoryList = 'category-list';

  Future<void> saveUserData(UserModel user) async {
    await sharedPreferences.setString(
      _user,
      jsonEncode(
        user.toJson(),
      ),
    );
  }

  UserModel? getUser() {
    final userData = sharedPreferences.getString(_user);
    if (userData != null) {
      return UserModel.fromJson(
        jsonDecode(userData),
      );
    } else {
      return UserModel.empty();
    }
  }

  Future<void> setUserOnBoardedStatus() async {
    await sharedPreferences.setBool(_isOnBoarded, true);
  }

  bool getUserOnBoardedStatus() {
    return sharedPreferences.getBool(_isOnBoarded) ?? false;
  }

  Future<void> setCategories(List<TodoCategoriesModel> categoryList) async {
    await sharedPreferences.setString(
      _categoryList,
      jsonEncode(categoryList),
    );
  }

  List<TodoCategoriesModel> getCategories() {
    final allCategories = sharedPreferences.getString(
          _categoryList,
        ) ??
        "";
    final List<dynamic> temp = jsonDecode(allCategories);
    return temp.map((e) => TodoCategoriesModel.fromJson(e)).toList();
  }

  Future<void> clearAllData() async {
    await sharedPreferences.clear();
  }
}
