import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        },
        child: Navigator.canPop(context)
            ? const Icon(
                Icons.arrow_back_ios,
                color: AppColor.white,
                size: 20,
              )
            : null,
      ),
      backgroundColor: AppColor.bgColorLight,
      title: AppText(
        title,
        style: textTheme.headline5,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
