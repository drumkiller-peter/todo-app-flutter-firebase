import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/time_of_day_extension.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:todo_app_flutter/ui/common/app_bottom_sheet.dart';
import 'package:todo_app_flutter/ui/common/app_button.dart';
import 'package:todo_app_flutter/ui/common/app_calendar_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/common/app_text_field.dart';
import 'package:todo_app_flutter/ui/common/app_time_picker_dialog.dart';
import 'package:todo_app_flutter/ui/features/create_todos/widgets/categories_bottom_sheet.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      lazy: false,
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
              getIt.get<NavigatorService>().navigator.pop();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.white,
                  size: 20,
                ),
              ),
              backgroundColor: AppColor.bgColorLight,
              title: AppText(
                AppString.createTodoOrEvent,
                style: textTheme.headline5,
              ),
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
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();

                          AppCalendarDialog.openCalenderDialog(
                            ctx: context,
                            isRange: true,
                            onSubmit: (p0) {
                              if (p0 != null) {
                                final dateRange = p0 as PickerDateRange;
                                context.read<CreateTodoBloc>().add(
                                      CreateTodoDateUpdateRequested(
                                        selectedEventStartDate:
                                            dateRange.startDate!,
                                        selectedEventEndDate: dateRange.endDate,
                                      ),
                                    );
                              }
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
                          buildWhen: (previous, current) =>
                              current is CreateTodoDateChanged,
                          builder: (context, state) {
                            return AppTextField(
                              validator: FormBuilderValidators.required(
                                errorText: AppString.required,
                              ),
                              titleText: AppString.eventDate,
                              hint: AppString.eventDateHint,
                              suffixIcon: const Icon(
                                Icons.calendar_month_outlined,
                                color: AppColor.cyan,
                              ),
                              controller:
                                  context.read<CreateTodoBloc>().eventDate,
                              enabled: false,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          TimeOfDay? startTime;
                          TimeOfDay? endTime;

                          if (mounted) {
                            startTime =
                                await AppTimePickerDialog.openTimePickerDialog(
                              context,
                              helpText: AppString.selectStartTime,
                            );
                            if (mounted) {
                              endTime = await AppTimePickerDialog
                                  .openTimePickerDialog(context,
                                      helpText: AppString.selectEndTime);
                              if (startTime != null &&
                                  endTime != null &&
                                  mounted) {
                                context.read<CreateTodoBloc>().add(
                                      CreateTodoTimeUpdateRequested(
                                        selectedEventStartTime:
                                            startTime.getTimeInDateTimeFormat(),
                                        selectedEventEndTime:
                                            endTime.getTimeInDateTimeFormat(),
                                      ),
                                    );
                              }
                            }
                          }
                        },
                        child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
                          buildWhen: (previous, current) =>
                              current is CreateTodoTimeChanged,
                          builder: (context, state) {
                            return AppTextField(
                              validator: FormBuilderValidators.required(
                                errorText: AppString.required,
                              ),
                              titleText: AppString.eventTime,
                              hint: AppString.eventTimeHint,
                              suffixIcon: const Icon(
                                Icons.timer_outlined,
                                color: AppColor.cyan,
                              ),
                              controller:
                                  context.read<CreateTodoBloc>().eventTime,
                              enabled: false,
                            );
                          },
                        ),
                      ),
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
}
