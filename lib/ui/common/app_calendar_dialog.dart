import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class AppCalendarDialog {
  AppCalendarDialog._();
  static Future<void> openCalenderDialog({
    required BuildContext ctx,
    dynamic Function(Object?)? onSubmit,
  }) {
    return showDialog(
      context: ctx,
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;
        return Dialog(
          child: Wrap(
            children: [
              SfDateRangePicker(
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
                maxDate: DateTime.now().subtract(
                  const Duration(
                    days: 365 * 16,
                  ),
                ),
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
}
