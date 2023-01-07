part of 'post_bloc.dart';

@immutable
abstract class PostEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPostEvents extends PostEvents {}
