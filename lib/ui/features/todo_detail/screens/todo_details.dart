import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/todo_details/todo_details_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/completion_model/completion_model.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:todo_app_flutter/ui/common/app_button.dart';
import 'package:todo_app_flutter/ui/common/app_custom_app_bar.dart';
import 'package:todo_app_flutter/ui/common/app_loading_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/todo_detail/widgets/todo_detail_title.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({Key? key, required this.todoModel})
      : super(key: key);

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => TodoDetailsBloc(context.read<TodoRepository>()),
      child: Builder(builder: (context) {
        return BlocListener<TodoDetailsBloc, TodoDetailsState>(
          listenWhen: (previous, current) =>
              current is TodoDetailsLoadInProgress ||
              current is TodoDetailsFailure ||
              current is TodoDetailsSuccess,
          listener: (context, state) {
            if (state is TodoDetailsLoadInProgress) {
              AppLoadingDialog.openLoadingDialog(context);
            } else if (state is TodoDetailsSuccess) {
              Navigator.pop(context);
              Navigator.pop(context);
              AppSnackBar.showSnackbar(
                  context, state.success, MessageType.success);
            } else if (state is TodoDetailsFailure) {
              Navigator.pop(context);
              AppSnackBar.showSnackbar(
                  context, state.failure, MessageType.error);
            }
          },
          child: Scaffold(
            appBar: const CustomAppBar(
              title: "Todo Detail",
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TodoDetailTitle(
                      title: AppString.todoTitle,
                    ),
                    AppText(
                      todoModel.title,
                      style: textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TodoDetailTitle(
                      title: AppString.todoDescription,
                    ),
                    AppText(
                      todoModel.description,
                      style: textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TodoDetailTitle(
                      title: AppString.category,
                    ),
                    AppText(todoModel.todoCategoriesModel.category),
                    const SizedBox(
                      height: 8,
                    ),
                    const TodoDetailTitle(
                      title: AppString.eventDate,
                    ),
                    AppText(
                        "${todoModel.eventStartDate.getFullDateWithTime()} - ${todoModel.eventEndDate.getFullDateWithTime()}"),
                    const SizedBox(
                      height: 8,
                    ),
                    const TodoDetailTitle(
                      title: AppString.createdAt,
                    ),
                    AppText(todoModel.createdAt.getFullDateWithTime()),
                    const SizedBox(
                      height: 8,
                    ),
                    const TodoDetailTitle(
                      title: AppString.status,
                    ),
                    AppText(todoModel.eventEndDate.getEventRemainingTime()),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppPrimaryButton(
                          width: 160,
                          isEnabled: true,
                          title: "Edit",
                        ),
                        AppPrimaryButton(
                          width: 160,
                          isEnabled: true,
                          onPressed: () async {
                            context.read<TodoDetailsBloc>().add(
                                  TodoDeleteRequested(
                                    uuid: todoModel.uuid,
                                    isSyncedWithGoogleCalendar:
                                        todoModel.isSyncedWithGoogleCalendar,
                                  ),
                                );
                          },
                          color: AppColor.error,
                          title: "Delete",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppPrimaryButton(
                      isEnabled: true,
                      onPressed: () async {
                        final eventPeriodInMilliSeconds = todoModel.eventEndDate
                            .difference(todoModel.eventStartDate)
                            .inMilliseconds;

                        final timeTakenInMilliSeconds = DateTime.now()
                            .difference(todoModel.eventStartDate)
                            .inMilliseconds;

                        double rate = (eventPeriodInMilliSeconds /
                                timeTakenInMilliSeconds) *
                            100;

                        context.read<TodoDetailsBloc>().add(
                              TodoMarkAsCompleteRequested(
                                completionModel: CompletionModel(
                                  uuid: todoModel.uuid,
                                  uId: todoModel.uId,
                                  completedAt: DateTime.now(),
                                  rateOfCompletion: rate,
                                ),
                              ),
                            );
                      },
                      color: AppColor.warning,
                      title: "Mark as complete",
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
