import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/configs/fcm_helper/firebase_notification_helper.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/data/api/dio_helper.dart';
import 'package:todo_app_flutter/data/preferences/app_preference.dart';

final getIt = GetIt.instance;

/// Dependency injection setup
void dISetup() {
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  getIt.registerSingletonWithDependencies<AppPreference>(
    () => AppPreference(
      sharedPreferences: getIt.get<SharedPreferences>(),
    ),
    dependsOn: [SharedPreferences],
  );
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerLazySingleton<Dio>(() => DioHelper().dio);
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => FirebaseNotificationHelper());
}
