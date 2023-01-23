import 'package:flutter/material.dart';
import 'package:todo_app_flutter/ui/features/authentication/login/login_screen.dart';
import 'package:todo_app_flutter/ui/features/authentication/sign_up/sign_up_screen.dart';
import 'package:todo_app_flutter/ui/features/create_todos/screen/create_todo_screen.dart';
import 'package:todo_app_flutter/ui/features/home/screen/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = 'home';
  static const String signUp = 'signUp';
  static const String login = 'login';
  static const String createTodo = 'createTodo';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return _getMaterialRoute(const HomeScreen());
      case login:
        return _getMaterialRoute(const LoginScreen());
      case signUp:
        return _getMaterialRoute(const SignUpScreen());
      case createTodo:
        return _getMaterialRoute(const CreateTodoScreen());
      default:
        return _getMaterialRoute(
          ErrorWidget(
            Exception("Route Not Found"),
          ),
        );
    }
  }

  static MaterialPageRoute _getMaterialRoute(Widget screen) =>
      MaterialPageRoute(builder: (_) => screen);
}
