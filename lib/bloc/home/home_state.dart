// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeFailure extends HomeState {
 final String error;
  HomeFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class HomeSuccess extends HomeState {
  final List<TodoModel> todoModelList;
  HomeSuccess({
    required this.todoModelList,
  });

  @override
  List<Object?> get props => [todoModelList];
}
