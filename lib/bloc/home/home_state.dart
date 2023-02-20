part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;

  const HomeState._({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [selectedIndex];

  HomeState.dashboard()
      : this._(
          selectedIndex: AppBottomNavItemStatus.dashboard.index,
        );
  HomeState.profile()
      : this._(
          selectedIndex: AppBottomNavItemStatus.profile.index,
        );
  HomeState.createTodo()
      : this._(
          selectedIndex: AppBottomNavItemStatus.createTodo.index,
        );
}
