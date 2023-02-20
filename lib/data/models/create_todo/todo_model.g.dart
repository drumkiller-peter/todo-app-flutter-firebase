// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      uuid: json['uuid'] as String,
      uId: json['uid'] as String,
      todoCategoriesModel: TodoCategoriesModel.fromJson(
          json['category'] as Map<String, dynamic>),
      title: json['event_title'] as String,
      description: json['event_description'] as String,
      eventStartDate: DateTime.parse(json['event_start_date'] as String),
      eventEndDate: DateTime.parse(json['event_end_date'] as String),
      isCompleted: json['is_event_completed'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      isSyncedWithGoogleCalendar:
          json['is_synced_with_google_calendar'] as bool,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'uid': instance.uId,
      'category': instance.todoCategoriesModel,
      'event_title': instance.title,
      'event_description': instance.description,
      'event_start_date': instance.eventStartDate.toIso8601String(),
      'event_end_date': instance.eventEndDate.toIso8601String(),
      'is_event_completed': instance.isCompleted,
      'created_at': instance.createdAt.toIso8601String(),
      'is_synced_with_google_calendar': instance.isSyncedWithGoogleCalendar,
    };
