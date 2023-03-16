import 'package:json_annotation/json_annotation.dart';

part 'app_calendar_model.g.dart';

@JsonSerializable()
class TodoAppCalendarModelWithDayAndMonth {
  final String day;
  final String month;
  final int monthId;
  TodoAppCalendarModelWithDayAndMonth({
    required this.day,
    required this.month,
    required this.monthId,
  });

  factory TodoAppCalendarModelWithDayAndMonth.fromJson(
          Map<String, dynamic> json) =>
      _$TodoAppCalendarModelWithDayAndMonthFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TodoAppCalendarModelWithDayAndMonthToJson(this);
}
