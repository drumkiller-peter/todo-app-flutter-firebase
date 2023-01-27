// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      uId: json['uid'] as String,
      todoCategoriesModel: TodoCategoriesModel.fromJson(
          json['category'] as Map<String, dynamic>),
      title: json['event_title'] as String,
      description: json['event_description'] as String,
      eventStartDate: DateTime.parse(json['event_start_date'] as String),
      eventEndDate: json['event_end_date'] == null
          ? null
          : DateTime.parse(json['event_end_date'] as String),
      eventStartTime: DateTime.parse(json['event_start_time'] as String),
      eventEndTime: json['event_end_time'] == null
          ? null
          : DateTime.parse(json['event_end_time'] as String),
      isCompleted: json['is_event_completed'] as bool,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'uid': instance.uId,
      'category': instance.todoCategoriesModel,
      'event_title': instance.title,
      'event_description': instance.description,
      'event_start_date': instance.eventStartDate.toIso8601String(),
      'event_end_date': instance.eventEndDate?.toIso8601String(),
      'event_start_time': instance.eventStartTime.toIso8601String(),
      'event_end_time': instance.eventEndTime?.toIso8601String(),
      'is_event_completed': instance.isCompleted,
    };
