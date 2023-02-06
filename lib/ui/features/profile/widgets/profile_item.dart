import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/data/models/profile/profile_screen_item_model.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.appTileModel,
      required this.onTap,
      this.svgColor});
  final AppTileModel appTileModel;
  final GestureTapCallback onTap;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.bgColor.withOpacity(0.7),
          border: const Border(
            bottom: BorderSide(color: AppColor.greyText),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              appTileModel.svgPath,
              height: 20,
              width: 20,
              color: svgColor ?? AppColor.cyan,
            ),
            const SizedBox(
              width: 12,
            ),
            AppText(
              appTileModel.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.greyText,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
