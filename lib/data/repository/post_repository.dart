import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/data/api/api.dart';
import 'package:todo_app_flutter/data/models/post_model/post_model.dart';

class PostRepository {
  final Dio _dio = getIt.get<Dio>();

  Future<Either<String, List<PostModel>>> fetchPosts() async {
    try {
      Response response = await _dio.get(Api.getPost);
      List<dynamic> json = response.data;
      return right(
          json.map((dynamic item) => PostModel.fromJson(item)).toList());
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return left(error.toString());
    }
  }
}
