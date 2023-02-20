import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.dashboard()) {
    on<HomeBottomNavIconChangeRequested>(
      (event, emit) {
        _pageController.jumpToPage(event.tappedBottomNavItemIndex);
        if (event.tappedBottomNavItemIndex ==
            AppBottomNavItemStatus.dashboard.index) {
          emit(HomeState.dashboard());
        }
        if (event.tappedBottomNavItemIndex ==
            AppBottomNavItemStatus.createTodo.index) {
          emit(HomeState.createTodo());
        }
        if (event.tappedBottomNavItemIndex ==
            AppBottomNavItemStatus.profile.index) {
          emit(HomeState.profile());
        }
      },
    );
  }

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
}
