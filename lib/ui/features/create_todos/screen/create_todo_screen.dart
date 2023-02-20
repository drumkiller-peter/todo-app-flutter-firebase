import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:todo_app_flutter/ui/common/app_bottom_sheet.dart';
import 'package:todo_app_flutter/ui/common/app_button.dart';
import 'package:todo_app_flutter/ui/common/app_custom_app_bar.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text_field.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/categories_bottom_sheet.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/event_date_picker_block.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/sync_with_calendar_block.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTodoBloc(
        context.read<TodoRepository>(),
        context.read<AuthenticationRepository>(),
      ),
      child: Builder(builder: (context) {
        return BlocListener<CreateTodoBloc, CreateTodoState>(
          listenWhen: (previous, current) =>
              current is CreateTodoFailure || current is CreateTodoSuccess,
          listener: (context, state) {
            if (state is CreateTodoFailure) {
              AppSnackBar.showSnackbar(
                context,
                state.error,
                MessageType.error,
              );
            }
            if (state is CreateTodoSuccess) {
              AppSnackBar.showSnackbar(
                context,
                state.success,
                MessageType.success,
              );
            }
          },
          child: Scaffold(
            appBar: const CustomAppBar(
              title: AppString.createTodoOrEvent,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Form(
                  key: context.read<CreateTodoBloc>().createEventFormKey,
                  child: Column(
                    children: [
                      AppTextField(
                        validator: FormBuilderValidators.required(
                          errorText: AppString.required,
                        ),
                        hint: AppString.todoTitleHint,
                        titleText: AppString.todoTitle,
                        controller: context.read<CreateTodoBloc>().title,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextField(
                        validator: FormBuilderValidators.required(
                          errorText: AppString.required,
                        ),
                        hint: AppString.todoDescriptionHint,
                        titleText: AppString.todoDescription,
                        controller: context.read<CreateTodoBloc>().description,
                        maxLines: 4,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          AppBottomSheet.openBottomSheet(
                            context,
                            CategoriesBottomSheet(
                              ctx: context,
                            ),
                          );
                        },
                        child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
                          buildWhen: (previous, current) =>
                              current is CreateTodoCategoryChanged,
                          builder: (context, state) {
                            return AppTextField(
                              validator: FormBuilderValidators.required(
                                errorText: AppString.required,
                              ),
                              titleText: AppString.categories,
                              hint: AppString.selectCategories,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: AppColor.cyan,
                              ),
                              controller:
                                  context.read<CreateTodoBloc>().category,
                              enabled: false,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const EventDatePickerBlock(),
                      const SizedBox(
                        height: 16,
                      ),
                      const SyncWithCalendarBlock(),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocBuilder<CreateTodoBloc, CreateTodoState>(
                        buildWhen: (previous, current) =>
                            current is CreateTodoLoadInProgress ||
                            current is CreateTodoSuccess,
                        builder: (context, state) {
                          return AppPrimaryButton(
                            width: 210,
                            title: state is CreateTodoLoadInProgress
                                ? AppString.savingTask
                                : AppString.createTodo,
                            isEnabled: true,
                            onPressed: () {
                              context
                                  .read<CreateTodoBloc>()
                                  .add(CreateTodoRequested());
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
