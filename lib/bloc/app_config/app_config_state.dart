part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppConfigInitial extends AppConfigState {}

class AppConfigLoadInProgress extends AppConfigState {}

class AppConfigSuccess extends AppConfigState {}

class AppConfigFailure extends AppConfigState {
  final String error;

  AppConfigFailure({required this.error});
  @override
  List<Object?> get props => [error];
}

class AppConfigCategoryFetched extends AppConfigState {
  final List<TodoCategoriesModel> todoCategoriesModelList;
  AppConfigCategoryFetched({
    required this.todoCategoriesModelList,
  });
  @override
  List<Object?> get props => [todoCategoriesModelList];
}
