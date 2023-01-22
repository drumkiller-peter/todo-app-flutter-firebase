import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String fullName;
  final String uid;
  final String email;
  final DateTime dob;
  final String accessToken;
  final bool isVerified;
  UserModel({
    required this.fullName,
    required this.uid,
    required this.email,
    required this.dob,
    required this.accessToken,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.empty() => UserModel(
        fullName: '',
        uid: '',
        email: '',
        dob: DateTime.now(),
        accessToken: '',
        isVerified: false,
      );
}
