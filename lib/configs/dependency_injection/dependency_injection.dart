import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/data/api/dio_helper.dart';

final getIt = GetIt.instance;

/// Dependency injection setup
void dISetup() {
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<Dio>(() => DioHelper().dio);
}
