import 'package:todo_app_flutter/gen/assets.gen.dart';

class AppConstants {
  AppConstants._();
  static const String defaultDateFormat = 'dd/MM/yyyy';
  static const String getDayMonthYearWithTime = 'dd MMM, yyyy hh:mm a';
  static const String defaultTimeFormat = 'hh:mm a';
  
  //All Category Icons.
  static List categoryIcon = [
    Assets.images.svg.categories.personalTask,
    Assets.images.svg.categories.appointmentsTask,
    Assets.images.svg.categories.healthRelatedTask,
    Assets.images.svg.categories.studyTask,
    Assets.images.svg.categories.workTask,
    Assets.images.svg.categories.relationshipTask,
    Assets.images.svg.categories.travelPlanningTask,
  ];
}
