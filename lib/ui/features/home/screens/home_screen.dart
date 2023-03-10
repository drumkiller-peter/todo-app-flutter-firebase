import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/home/home_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/features/create_todos/screen/create_todo_screen.dart';
import 'package:todo_app_flutter/ui/features/dashboard/screen/dashboard_screen.dart';
import 'package:todo_app_flutter/ui/features/profile/screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColor.bgColorDarker,
                currentIndex: state.selectedIndex,
                selectedItemColor: AppColor.primary,
                unselectedItemColor: AppColor.greyText,
                onTap: (value) {
                  context.read<HomeBloc>().add(
                        HomeBottomNavIconChangeRequested(
                          tappedBottomNavItemIndex: value,
                        ),
                      );
                },
                items: [
                  BottomNavigationBarItem(
                    label: AppBottomNavItemStatus.dashboard.name,
                    icon: const Icon(
                      Icons.bar_chart,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: AppBottomNavItemStatus.createTodo.name,
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: AppBottomNavItemStatus.profile.name,
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                ],
              ),
              body:
                  // state.selectedIndex == AppBottomNavItemStatus.dashboard.index
                  //     ? const DashboardScreen()
                  //     : state.selectedIndex ==
                  //             AppBottomNavItemStatus.createTodo.index
                  //         ? const CreateTodoScreen()
                  //         : const ProfileScreen(),
                  PageView.builder(
                controller: context.read<HomeBloc>().pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == AppBottomNavItemStatus.dashboard.index) {
                    return const DashboardScreen();
                  }
                  if (index == AppBottomNavItemStatus.createTodo.index) {
                    return const CreateTodoScreen();
                  }
                  if (index == AppBottomNavItemStatus.profile.index) {
                    return const ProfileScreen();
                  }
                  return const DashboardScreen();
                },
              ),
            );
          },
        );
      }),
    );
  }
}
