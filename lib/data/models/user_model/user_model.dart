import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: DbKeys.fullName, defaultValue: "")
  final String fullName;
  final String uid;
  final String email;
  final DateTime? dob;
  final String accessToken;
  final bool isVerified;
  @JsonKey(name: DbKeys.profilePicture, defaultValue: "")
  final String? profilePicture;
  UserModel({
    required this.fullName,
    required this.uid,
    required this.email,
    this.dob,
    required this.accessToken,
    required this.isVerified,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.empty() => UserModel(
        fullName: '',
        uid: '',
        email: '',
        accessToken: '',
        isVerified: false,
        profilePicture: '',
      );
}
