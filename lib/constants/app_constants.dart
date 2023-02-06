import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/profile/profile_screen_item_model.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';

class AppConstants {
  AppConstants._();

  // App DateTime Formats
  static const String defaultDateFormat = 'dd/MM/yyyy';
  static const String getDayMonthYearWithTime = 'dd MMM, yyyy hh:mm a';
  static const String defaultTimeFormat = 'hh:mm a';

  // Dummy Data
  static const String dummyImage =
      'https://cdn.pixabay.com/photo/2018/03/12/12/32/woman-3219507_960_720.jpg';

  //All Category Icons.
  static final List categoryIcon = [
    Assets.images.svg.categories.personalTask,
    Assets.images.svg.categories.appointmentsTask,
    Assets.images.svg.categories.healthRelatedTask,
    Assets.images.svg.categories.studyTask,
    Assets.images.svg.categories.workTask,
    Assets.images.svg.categories.relationshipTask,
    Assets.images.svg.categories.travelPlanningTask,
  ];

  static final List<AppTileModel> profileItems = [
    AppTileModel(
      svgPath: Assets.images.svg.password,
      title: AppString.changePassword,
    ),
    AppTileModel(
      svgPath: Assets.images.svg.history,
      title: AppString.taskCompletionHistory,
    ),
    AppTileModel(
      svgPath: Assets.images.svg.calendar,
      title: AppString.syncWithCalendar,
    ),
    AppTileModel(
      svgPath: Assets.images.svg.collab,
      title: AppString.taskCollaborationWithOtherUsers,
    ),
    AppTileModel(
      svgPath: Assets.images.svg.logout,
      title: AppString.signOut,
    ),
  ];
}
