import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/ui/common/app_calendar_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_text_field.dart';

class EventDatePickerBlock extends StatefulWidget {
  const EventDatePickerBlock({super.key});

  @override
  State<EventDatePickerBlock> createState() => _EventDatePickerBlockState();
}

class _EventDatePickerBlockState extends State<EventDatePickerBlock> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTodoBloc, CreateTodoState>(
      buildWhen: (previous, current) => current is CreateTodoDateChanged,
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                final datePicked =
                    await AppCalendarDialog.openDatePicker(ctx: context);
                if (datePicked != null && mounted) {
                  context.read<CreateTodoBloc>().add(
                        CreateTodoDateUpdateRequested(
                          selectedEventStartDate: datePicked,
                        ),
                      );
                }
              },
              child: AppTextField(
                validator: FormBuilderValidators.required(
                  errorText: AppString.required,
                ),
                titleText: AppString.startDate,
                hint: AppString.eventDateHint,
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColor.cyan,
                  size: 16,
                ),
                controller: context.read<CreateTodoBloc>().eventStartDate,
                enabled: false,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                final datePicked =
                    await AppCalendarDialog.openDatePicker(ctx: context);
                if (datePicked != null && mounted) {
                  context.read<CreateTodoBloc>().add(
                        CreateTodoDateUpdateRequested(
                          selectedEventEndDate: datePicked,
                        ),
                      );
                }
              },
              child: AppTextField(
                titleText: AppString.endDate,
                hint: AppString.eventDateHint,
                validator: FormBuilderValidators.required(
                  errorText: AppString.required,
                ),
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColor.cyan,
                  size: 16,
                ),
                autovalidateMode: state is CreateTodoDateChanged &&
                        state.selectedEndDate != null
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.disabled,
                controller: context.read<CreateTodoBloc>().eventEndDate,
                enabled: false,
              ),
            ),
          ],
        );
      },
    );
  }
}
