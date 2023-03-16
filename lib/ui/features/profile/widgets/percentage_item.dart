import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class PercentageItem extends StatelessWidget {
  const PercentageItem(
      {super.key,
      required this.title,
      required this.percent,
      required this.value,
      this.radius,
      this.percentValueStyle});

  final String title;
  final double percent;
  final String value;
  final double? radius;
  final TextStyle? percentValueStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CircularPercentIndicator(
          radius: radius ?? 40.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 5.0,
          percent: percent,
          center: Text(
            value,
            style: percentValueStyle ??
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: AppColor.bgColorLight,
          progressColor: AppColor.cyan,
        ),
        const SizedBox(
          height: 8,
        ),
        AppText(
          title,
          style: textTheme.bodySmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
