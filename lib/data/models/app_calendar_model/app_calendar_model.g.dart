// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoAppCalendarModelWithDayAndMonth
    _$TodoAppCalendarModelWithDayAndMonthFromJson(Map<String, dynamic> json) =>
        TodoAppCalendarModelWithDayAndMonth(
          day: json['day'] as String,
          month: json['month'] as String,
          monthId: json['monthId'] as int,
        );

Map<String, dynamic> _$TodoAppCalendarModelWithDayAndMonthToJson(
        TodoAppCalendarModelWithDayAndMonth instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'monthId': instance.monthId,
    };
