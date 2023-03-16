import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/bloc/home/home_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/features/create_todos/screen/create_todo_screen.dart';
import 'package:todo_app_flutter/ui/features/dashboard/screen/dashboard_screen.dart';
import 'package:todo_app_flutter/ui/features/dashboard/screen/new_dashboard_screen.dart';
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
                showSelectedLabels: false,
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
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
                    label: "",
                    icon: SvgPicture.asset(
                      Assets.images.svg.icHome,
                      height: 32,
                      color: state.selectedIndex == 0
                          ? AppColor.cyan
                          : AppColor.white,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: CircleAvatar(
                      backgroundColor: state.selectedIndex == 1
                          ? AppColor.cyan
                          : AppColor.white,
                      child: const Icon(
                        Icons.add,
                        size: 32,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.person,
                      size: 40,
                      color: state.selectedIndex == 2
                          ? AppColor.cyan
                          : AppColor.white,
                    ),
                  ),
                ],
              ),
              body: PageView.builder(
                controller: context.read<HomeBloc>().pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == AppBottomNavItemStatus.dashboard.index) {
                    // return const DashboardScreen();
                    return const NewDashboardScreen();
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
