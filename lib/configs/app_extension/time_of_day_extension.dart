import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  /// returns time in DateTime Format
  DateTime getTimeInDateTimeFormat() {
    return DateTime(0, 0, 0, hour, minute, 0);
  }
}
