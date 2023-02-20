import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class SyncWithCalendarBlock extends StatelessWidget {
  const SyncWithCalendarBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.bgColorLight,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: AppText(
                AppString.syncWithCalendar,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.greyText),
              ),
            ),
            const Spacer(),
            BlocBuilder<CreateTodoBloc, CreateTodoState>(
              buildWhen: (previous, current) =>
                  current is CreateTodoSyncCalendarChanged,
              builder: (context, state) {
                return Switch.adaptive(
                  activeColor: AppColor.cyan,
                  inactiveTrackColor: AppColor.primary.withOpacity(0.4),
                  inactiveThumbColor: AppColor.primary,
                  value: state is CreateTodoSyncCalendarChanged
                      ? state.isEnabled
                      : false,
                  onChanged: (value) {
                    context.read<CreateTodoBloc>().add(
                          CreateTodoSyncWithCalendarRequested(value),
                        );
                  },
                );
              },
            ),
          ],
        ));
  }
}
