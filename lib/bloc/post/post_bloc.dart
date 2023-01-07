import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/data/models/post_model/post_model.dart';
import 'package:todo_app_flutter/data/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  PostBloc(this._postRepository) : super(PostInitial()) {
    on<LoadPostEvents>(
      (event, emit) => fetchData(emit),
    );
  }

  fetchData(Emitter<PostState> emit) async {
    emit(PostLoadInProgress());
    final response = await _postRepository.fetchPosts();
    if (!isClosed) {
      response.fold(
        (l) => emit(
          PostLoadFailure(
            failureMessage: l,
          ),
        ),
        (r) => emit(
          PostLoaded(
            postModelList: r,
          ),
        ),
      );
    }
  }

  final PostRepository _postRepository;
}
