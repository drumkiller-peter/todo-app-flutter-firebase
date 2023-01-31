// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeBottomNavIconChangeRequested extends HomeEvent {
  final int tappedBottomNavItemIndex;
  HomeBottomNavIconChangeRequested({
    required this.tappedBottomNavItemIndex,
  });
  @override
  List<Object?> get props => [tappedBottomNavItemIndex];
}
