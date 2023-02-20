import 'package:intl/intl.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';

extension DateTimeExtension on DateTime {
  String getDefaultDateAsString() {
    return DateFormat(AppConstants.defaultDateFormat).format(this);
  }

  String getDayMonthYearWithTime() {
    return DateFormat(AppConstants.getDayMonthYearWithTime).format(this);
  }

  /// returns in 'hh:mm' format
  String getTimeOnly() {
    return DateFormat(AppConstants.defaultTimeFormat).format(this);
  }
}
