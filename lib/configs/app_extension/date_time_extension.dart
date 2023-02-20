import 'package:intl/intl.dart';
import 'package:todo_app_flutter/constants/app_constants.dart';

extension DateTimeExtension on DateTime {
  String getDefaultDateAsString() {
    return DateFormat(AppConstants.defaultDateFormat).format(this);
  }

  String getDayMonthYearWithTime() {
    return DateFormat(AppConstants.getDayMonthYearWithTime).format(this);
  }

  String getFullDateWithTime() {
    return DateFormat(AppConstants.getFullDateWithTime).format(this);
  }

  /// returns in 'hh:mm' format
  String getTimeOnly() {
    return DateFormat(AppConstants.defaultTimeFormat).format(this);
  }

  String getEventRemainingTime() {
    String message = "";
    final timeDifference = difference(DateTime.now());
    if (timeDifference.inDays > 0) {
      message = '${timeDifference.inDays} day remaining';
    } else if (timeDifference.inMinutes > 0) {
      message = '${timeDifference.inMinutes} min remaining';
    } else if (timeDifference.inSeconds > 0) {
      message = '${timeDifference.inSeconds} sec remaining';
    } else {
      message = "Time's up";
    }
    return message;
  }
}
