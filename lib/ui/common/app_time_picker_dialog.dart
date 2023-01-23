import 'package:flutter/material.dart';

class AppTimePickerDialog {
  AppTimePickerDialog._();
  static Future<TimeOfDay?> openTimePickerDialog(BuildContext context,
      {required String helpText}) {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.inputOnly,
      helpText: helpText,
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
