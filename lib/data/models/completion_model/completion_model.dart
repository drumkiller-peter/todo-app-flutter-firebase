import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';

part 'completion_model.g.dart';

@JsonSerializable()
class CompletionModel {
  @JsonKey(name: DbKeys.uuid)
  final String uuid;

  @JsonKey(name: DbKeys.uId)
  final String uId;

  @JsonKey(name: DbKeys.completedAt)
  final DateTime completedAt;

  @JsonKey(name: DbKeys.rateOfCompletion)
  final double rateOfCompletion;

  CompletionModel({
    required this.uuid,
    required this.uId,
    required this.completedAt,
    required this.rateOfCompletion,
  });

  factory CompletionModel.fromJson(Map<String, dynamic> json) =>
      _$CompletionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompletionModelToJson(this);
}
