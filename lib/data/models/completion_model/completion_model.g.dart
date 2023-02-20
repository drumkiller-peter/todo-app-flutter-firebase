// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionModel _$CompletionModelFromJson(Map<String, dynamic> json) =>
    CompletionModel(
      uuid: json['uuid'] as String,
      uId: json['uid'] as String,
      completedAt: DateTime.parse(json['completed_at'] as String),
      rateOfCompletion: (json['rate_of_completion'] as num).toDouble(),
    );

Map<String, dynamic> _$CompletionModelToJson(CompletionModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'uid': instance.uId,
      'completed_at': instance.completedAt.toIso8601String(),
      'rate_of_completion': instance.rateOfCompletion,
    };
