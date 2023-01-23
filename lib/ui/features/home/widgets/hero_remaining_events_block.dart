import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_icon_with_bg.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class HeroRemainingEventsBlock extends StatelessWidget {
  const HeroRemainingEventsBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: AppColor.bgColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      AppIconWithBg(
                        svgPath: Assets.images.svg.facebook,
                        radius: 20,
                        iconColor: AppColor.cyan,
                      ),
                      const Positioned(
                        left: 8,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColor.error,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppText(
                    "Personal tasks",
                    style:
                        textTheme.bodyText2?.copyWith(color: AppColor.warning),
                  ),
                  AppText(
                    "3 tasks remaining",
                    style:
                        textTheme.bodyText2?.copyWith(color: AppColor.greyText),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
