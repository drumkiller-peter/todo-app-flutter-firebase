part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> postModelList;

  PostLoaded({required this.postModelList});
  @override
  List<Object?> get props => [postModelList];
}

class PostLoadFailure extends PostState {
  final String failureMessage;

  PostLoadFailure({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}
