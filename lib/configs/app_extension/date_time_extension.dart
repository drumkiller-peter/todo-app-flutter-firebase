import 'package:intl/intl.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';

extension DateTimeExtension on DateTime {
  String getDateAsString() {
    return DateFormat(AppConstants.defaultDateFormat).format(this);
  }
}
