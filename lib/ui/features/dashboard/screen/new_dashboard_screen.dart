import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/calendar_bloc/calendar_bloc.dart';
import 'package:todo_app_flutter/bloc/dashboard/dashboard_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/calendar_and_task_block.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/user_info_and_search_block.dart';

class NewDashboardScreen extends StatelessWidget {
  const NewDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return BlocProvider(
      create: (context) => DashboardBloc(
        context.read<TodoRepository>(),
        context.read<AuthenticationRepository>(),
      )..add(
          DashboardEventGetTodoRequested(
            dateTime: DateTime(now.year, now.month, now.day),
          ),
        ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.bgColor,
              AppColor.bgColorDarker,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  UserInfoAndSearchBlock(),
                  AppText("Check your plans for today:"),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: BlocProvider(
              create: (context) => AppCalendarBloc()
                ..add(
                  AppCalendarGenerateRequested(
                    tappedDate: DateTime.now(),
                  ),
                ),
              child: const CalendarAndTasksBlock(),
            )),
          ],
        ),
      ),
    );
  }
}
