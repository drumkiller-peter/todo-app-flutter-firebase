import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.bgColor.withOpacity(0.7),
        border: const Border(
          bottom: BorderSide(color: AppColor.greyText),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColor.cyan,
          ),
          const SizedBox(
            width: 12,
          ),
          AppText(
            "Rate us",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
