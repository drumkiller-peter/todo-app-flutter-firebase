// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoCategoriesModel _$TodoCategoriesModelFromJson(Map<String, dynamic> json) =>
    TodoCategoriesModel(
      category: json['category'] as String,
      categoryId: json['category_id'] as int,
      categoryDescription: json['category_description'] as String,
    );

Map<String, dynamic> _$TodoCategoriesModelToJson(
        TodoCategoriesModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'category_id': instance.categoryId,
      'category_description': instance.categoryDescription,
    };
