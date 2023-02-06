import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class PercentageItem extends StatelessWidget {
  const PercentageItem(
      {super.key,
      required this.title,
      required this.percent,
      required this.value});

  final String title;
  final double percent;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 5.0,
          percent: percent,
          center: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: AppColor.bgColorLight,
          progressColor: AppColor.cyan,
        ),
        const SizedBox(
          height: 8,
        ),
        AppText(
          AppString.taskCompletionRate,
          style: textTheme.caption,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
