// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_app_flutter/constants/db_keys.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  @JsonKey(name: DbKeys.uId)
  final String uId;

  @JsonKey(name: DbKeys.category)
  final TodoCategoriesModel todoCategoriesModel;

  @JsonKey(name: DbKeys.eventTitle)
  final String title;

  @JsonKey(name: DbKeys.eventDescription)
  final String description;

  @JsonKey(name: DbKeys.eventStartDate)
  final DateTime eventStartDate;

  @JsonKey(name: DbKeys.eventEndDate)
  final DateTime? eventEndDate;
  
  @JsonKey(name: DbKeys.eventStartTime)
  final DateTime eventStartTime;

  @JsonKey(name: DbKeys.eventEndTime)
  final DateTime? eventEndTime;

  @JsonKey(name: DbKeys.isEventCompleted)
  final bool isCompleted;

  const TodoModel({
    required this.uId,
    required this.todoCategoriesModel,
    required this.title,
    required this.description,
    required this.eventStartDate,
     this.eventEndDate,
    required this.eventStartTime,
     this.eventEndTime,
    required this.isCompleted,
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
