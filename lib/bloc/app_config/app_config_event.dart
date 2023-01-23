part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigEvent extends Equatable {
@override
  List<Object?> get props => [];
}

class AppConfigGetCategoryRequested extends AppConfigEvent {}
