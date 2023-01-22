// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String,
      uid: json['uid'] as String,
      email: json['email'] as String,
      dob: DateTime.parse(json['dob'] as String),
      accessToken: json['accessToken'] as String,
      isVerified: json['isVerified'] as bool,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'uid': instance.uid,
      'email': instance.email,
      'dob': instance.dob.toIso8601String(),
      'accessToken': instance.accessToken,
      'isVerified': instance.isVerified,
    };
