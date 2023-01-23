// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';

part 'todo_categories_model.g.dart';

@JsonSerializable()
class TodoCategoriesModel {
  final String category;
  @JsonKey(name: DbKeys.categoryId)
  final int categoryId;
  @JsonKey(name: DbKeys.categoryDescription)
  final String categoryDescription;

  const TodoCategoriesModel({
    required this.category,
    required this.categoryId,
    required this.categoryDescription,
  });

  factory TodoCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$TodoCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoCategoriesModelToJson(this);

  factory TodoCategoriesModel.empty() => const TodoCategoriesModel(
        category: "",
        categoryId: 0,
        categoryDescription: "",
      );
}
