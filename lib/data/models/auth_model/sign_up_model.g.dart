// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      dob: DateTime.parse(json['date_of_birth'] as String),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'date_of_birth': instance.dob.toIso8601String(),
    };
