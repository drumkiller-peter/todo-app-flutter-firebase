import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/ui/features/authentication/login/login_screen.dart';
import 'package:todo_app_flutter/ui/features/authentication/sign_up/sign_up_screen.dart';
import 'package:todo_app_flutter/ui/features/create_todos/screen/create_todo_screen.dart';
import 'package:todo_app_flutter/ui/features/dashboard/screen/dashboard_screen.dart';
import 'package:todo_app_flutter/ui/features/home/screens/home_screen.dart';
import 'package:todo_app_flutter/ui/features/profile/screen/profile_screen.dart';
import 'package:todo_app_flutter/ui/features/splash_screen/splash_screen.dart';
import 'package:todo_app_flutter/ui/features/todo_detail/screens/todo_details.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = 'home';
  static const String dashboard = 'dashboard';
  static const String signUp = 'signUp';
  static const String login = 'login';
  static const String createTodo = 'createTodo';
  static const String profile = 'profile';
  static const String splashScreen = 'splashScreen';
  static const String todoDetails = 'todoDetails';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return _getMaterialRoute(const HomeScreen());
      case dashboard:
        return _getMaterialRoute(const DashboardScreen());
      case login:
        return _getMaterialRoute(const LoginScreen());
      case signUp:
        return _getMaterialRoute(const SignUpScreen());
      case createTodo:
        return _getMaterialRoute(const CreateTodoScreen());
      case profile:
        return _getMaterialRoute(const ProfileScreen());
      case splashScreen:
        return _getMaterialRoute(const SplashScreen());
      case todoDetails:
        return _getMaterialRoute( TodoDetailsScreen(
          todoModel: routeSettings.arguments as TodoModel,
        ));
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
