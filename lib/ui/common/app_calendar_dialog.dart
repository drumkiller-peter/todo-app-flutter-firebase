import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';

class AppCalendarDialog {
  AppCalendarDialog._();
  static Future<void> openCalenderDialog({
    required BuildContext ctx,
    dynamic Function(Object?)? onSubmit,
    DateTime? maxDate,
    bool isRange = false,
  }) {
    return showDialog(
      context: ctx,
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;
        return Dialog(
          child: Wrap(
            children: [
              SfDateRangePicker(
                selectionMode: isRange
                    ? DateRangePickerSelectionMode.range
                    : DateRangePickerSelectionMode.single,
                backgroundColor: AppColor.bgColor,
                todayHighlightColor: AppColor.primary,
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: textTheme.bodyText2,
                  todayTextStyle:
                      textTheme.bodyText2!.copyWith(color: AppColor.primary),
                ),
                yearCellStyle: DateRangePickerYearCellStyle(
                  textStyle: textTheme.bodyText2,
                  disabledDatesTextStyle: textTheme.bodyText2,
                  todayTextStyle:
                      textTheme.bodyText2!.copyWith(color: AppColor.primary),
                ),
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: textTheme.headline3!.copyWith(
                    color: AppColor.primary,
                  ),
                ),
                selectionColor: AppColor.primary,
                maxDate: maxDate,
                onSubmit: onSubmit,
                onCancel: () => Navigator.pop(context),
                showActionButtons: true,
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<DateTime?> openDatePicker(
      {required BuildContext ctx, bool isDatePicker = true}) async {
    return DatePicker.showDateTimePicker(
      ctx,
      showTitleActions: true,
      locale: LocaleType.en,
      minTime: DateTime.now().subtract(
        const Duration(days: 1),
      ),
      maxTime: DateTime.now().add(
        const Duration(days: 1),
      ),
      theme: DatePickerTheme(
        backgroundColor: AppColor.bgColor,
        itemStyle: AppTextTheme.bodyText2,
        cancelStyle: AppTextTheme.bodyText1,
        doneStyle: AppTextTheme.bodyText1.copyWith(
          color: AppColor.cyan,
        ),
      ),
    );
  }

  static Future<DateTime?> openDatePickerForBirthdays(
      {required BuildContext ctx, bool isDatePicker = true}) async {
    return DatePicker.showPicker(
      ctx,
      showTitleActions: true,
      locale: LocaleType.en,
      pickerModel: isDatePicker
          ? DatePickerModel(
              currentTime: DateTime.now(),
              maxTime: DateTime.now().add(
                const Duration(days: 365),
              ),
            )
          : Time12hPickerModel(
              currentTime: DateTime.now(),
              locale: LocaleType.en,
            ),
      theme: DatePickerTheme(
        backgroundColor: AppColor.bgColor,
        itemStyle: AppTextTheme.bodyText2,
        cancelStyle: AppTextTheme.bodyText1,
        doneStyle: AppTextTheme.bodyText1.copyWith(
          color: AppColor.cyan,
        ),
      ),
    );
  }
}
