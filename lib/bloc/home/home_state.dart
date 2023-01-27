part of 'home_bloc.dart';

@immutable
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
