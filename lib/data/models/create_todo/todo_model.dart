// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/configs/app_converter/timestamp_converter.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  @JsonKey(name: DbKeys.uuid)
  final String uuid;

  @JsonKey(name: DbKeys.uId)
  final String uId;

  @JsonKey(name: DbKeys.category)
  final TodoCategoriesModel todoCategoriesModel;

  @JsonKey(name: DbKeys.eventTitle)
  final String title;

  @JsonKey(name: DbKeys.eventDescription)
  final String description;

  @TimeStampConverter()
  @JsonKey(name: DbKeys.eventStartDate)
  final DateTime eventStartDate;

  @TimeStampConverter()
  @JsonKey(name: DbKeys.eventEndDate)
  final DateTime eventEndDate;

  @JsonKey(name: DbKeys.isEventCompleted)
  final bool isCompleted;

  @TimeStampConverter()
  @JsonKey(name: DbKeys.createdAt)
  final DateTime createdAt;

  @JsonKey(name: DbKeys.isSyncedWithGoogleCalendar)
  final bool isSyncedWithGoogleCalendar;

  @JsonKey(name: DbKeys.mediaUrl)
  final String? mediaUrl;

  @JsonKey(name: DbKeys.isImage)
  final bool? isImage;

  const TodoModel({
    required this.uuid,
    required this.uId,
    required this.todoCategoriesModel,
    required this.title,
    required this.description,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.isCompleted,
    required this.createdAt,
    required this.isSyncedWithGoogleCalendar,
    this.mediaUrl,
    this.isImage,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  Map<String, dynamic> toMap() {
    var json = toJson();
    json[DbKeys.category] = todoCategoriesModel.toJson();
    return json;
  }
}
