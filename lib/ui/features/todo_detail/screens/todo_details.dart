import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/ui/common/app_custom_app_bar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/todo_detail/widgets/todo_detail_title.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({Key? key, required this.todoModel})
      : super(key: key);

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Todo Detail",
      ),
      body: Column(children: const [
        TodoDetailTitle(
          title: AppString.todoTitle,
        ),
        AppText("Some title here"),
        TodoDetailTitle(
          title: AppString.todoDescription,
        ),
        AppText(
            "Aspernatur aliquid nobis quod sunt autem omnis. Fuga rerum quos quos. Aperiam natus in quas nemo et nisi omnis voluptatem. Voluptatibus error quo ad nobis. Molestiae natus atque ipsa distinctio id quibusdam. Quam saepe commodi."),
        TodoDetailTitle(
          title: AppString.category,
        ),
        AppText("Personnal"),
        TodoDetailTitle(
          title: AppString.startTime,
        ),
        AppText("2022/02/32, sunday"),
        AppText("End date"),
        AppText("2022/02/32, sunday"),
        TodoDetailTitle(
          title: AppString.createdAt,
        ),
        AppText("2022/02/32, sunday"),
        TodoDetailTitle(
          title: AppString.status,
        ),
      ]),
    );
  }
}
