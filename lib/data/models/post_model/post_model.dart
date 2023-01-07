import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModelList {
  final List<PostModel> postModelList;

  const PostModelList({required this.postModelList});

  factory PostModelList.fromJson(Map<String, dynamic> json) =>
      _$PostModelListFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelListToJson(this);
}

@JsonSerializable()
class PostModel {
  final int userId;

  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
