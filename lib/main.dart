import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/app/app_provider.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/data/preferences/app_preference.dart';
import 'package:todo_app_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dISetup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getIt.isReady<AppPreference>();
  runApp(const AppProvider());
}
