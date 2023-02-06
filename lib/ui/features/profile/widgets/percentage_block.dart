import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/ui/features/profile/widgets/percentage_item.dart';

class PercentageBlock extends StatelessWidget {
  const PercentageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Expanded(
            child: PercentageItem(
              percent: 0.75,
              value: "75%",
              title: AppString.taskCompletionRate,
            ),
          ),
          Expanded(
            child: PercentageItem(
              percent: 0.5,
              value: "50%",
              title: AppString.taskCompletionRate,
            ),
          ),
          Expanded(
            child: PercentageItem(
              percent: 0.25,
              value: "25%",
              title: AppString.taskCompletionRate,
            ),
          ),
        ],
      ),
    );
  }
}
