// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/routes/app_routes.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/ui/common/app_custom_app_bar.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/events_list_item.dart';

class AllTasksForTodayScreen extends StatelessWidget {
  const AllTasksForTodayScreen({
    Key? key,
    required this.allTodosForToday,
  }) : super(key: key);

  final List<TodoModel> allTodosForToday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "All tasks for today"),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    getIt
                        .get<NavigatorService>()
                        .navigatorKey
                        .currentState!
                        .pushNamed(
                          AppRoutes.todoDetails,
                          arguments: allTodosForToday[index],
                        );
                  },
                  child: EventsItem(
                    todoModel: allTodosForToday[index],
                  ),
                );
              },
              childCount: allTodosForToday.length,
            ),
          ),
        ],
      ),
    );
  }
}
