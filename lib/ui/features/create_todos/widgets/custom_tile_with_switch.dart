import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class CustomTileWithSwitch extends StatelessWidget {
  const CustomTileWithSwitch({
    Key? key,
    required this.title,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  final String title;
  final Function(bool)? onChanged;
  final bool value;

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
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.greyText),
              ),
            ),
            const Spacer(),
            Switch.adaptive(
              activeColor: AppColor.cyan,
              inactiveTrackColor: AppColor.primary.withOpacity(0.4),
              inactiveThumbColor: AppColor.primary,
              value: value,
              onChanged: onChanged,
            )
          ],
        ));
  }
}
