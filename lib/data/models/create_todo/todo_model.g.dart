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
      eventStartDate: const TimeStampConverter()
          .fromJson(json['event_start_date'] as Timestamp),
      eventEndDate: const TimeStampConverter()
          .fromJson(json['event_end_date'] as Timestamp),
      isCompleted: json['is_event_completed'] as bool,
      createdAt:
          const TimeStampConverter().fromJson(json['created_at'] as Timestamp),
      isSyncedWithGoogleCalendar:
          json['is_synced_with_google_calendar'] as bool,
      mediaUrl: json['media_url'] as String?,
      isImage: json['is_image'] as bool?,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'uid': instance.uId,
      'category': instance.todoCategoriesModel,
      'event_title': instance.title,
      'event_description': instance.description,
      'event_start_date':
          const TimeStampConverter().toJson(instance.eventStartDate),
      'event_end_date':
          const TimeStampConverter().toJson(instance.eventEndDate),
      'is_event_completed': instance.isCompleted,
      'created_at': const TimeStampConverter().toJson(instance.createdAt),
      'is_synced_with_google_calendar': instance.isSyncedWithGoogleCalendar,
      'media_url': instance.mediaUrl,
      'is_image': instance.isImage,
    };
