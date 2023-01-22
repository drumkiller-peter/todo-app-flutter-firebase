// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/data/models/user_model/user_model.dart';

class AppPreference {
  final SharedPreferences sharedPreferences;
  AppPreference({
    required this.sharedPreferences,
  });

  static const String _user = 'user';
  static const String _token = 'token';

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
}
