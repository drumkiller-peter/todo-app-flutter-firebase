import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/home/home_bloc.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class EmptyEventBlock extends StatelessWidget {
  const EmptyEventBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: AppText(
            "You have no tasks for today",
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ActionChip(
          label: const AppText("Add event"),
          backgroundColor: AppColor.primary,
          onPressed: () {
            context.read<HomeBloc>().add(
                  HomeBottomNavIconChangeRequested(tappedBottomNavItemIndex: 1),
                );
          },
        )
      ],
    );
  }
}
