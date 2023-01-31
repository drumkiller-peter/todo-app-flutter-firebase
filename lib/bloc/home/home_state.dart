part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final AppBottomNavItemStatus appBottomNavItemStatus;
  const HomeState._({
    required this.selectedIndex,
    required this.appBottomNavItemStatus,
  });

  @override
  List<Object> get props => [selectedIndex, appBottomNavItemStatus];

  HomeState.dashboard()
      : this._(
          selectedIndex: AppBottomNavItemStatus.dashboard.index,
          appBottomNavItemStatus: AppBottomNavItemStatus.dashboard,
        );
  HomeState.profile()
      : this._(
          selectedIndex: AppBottomNavItemStatus.profile.index,
          appBottomNavItemStatus: AppBottomNavItemStatus.profile,
        );
  HomeState.createTodo()
      : this._(
          selectedIndex: AppBottomNavItemStatus.createTodo.index,
          appBottomNavItemStatus: AppBottomNavItemStatus.createTodo,
        );
}
