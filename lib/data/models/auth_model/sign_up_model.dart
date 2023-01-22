import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String email;
  final String password;
  final String fullName;
  @JsonKey(name: 'date_of_birth')
  final DateTime dob;
  SignUpModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.dob,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  factory SignUpModel.empty() => SignUpModel(
        email: '',
        password: '',
        fullName: '',
        dob: DateTime.now(),
      );
}
