import 'package:flutter/material.dart';
import 'package:todo_app_flutter/app/app_provider.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dISetup();
  runApp(const AppProvider());
}
