import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/features/dashboard/widgets/hero_remaining_events_block.dart';

class HeroBlock extends StatelessWidget {
  const HeroBlock({
    Key? key,
    required this.showTitle,
  }) : super(key: key);

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.bgColorLight,
      expandedHeight: 300,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedOpacity(
          opacity: showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: AppText(
            "You have 10 task for today",
            style: textTheme.bodyText1,
          ),
        ),
        centerTitle: false,
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.svg.karyaLogo,
                    height: 50,
                    width: 50,
                  ),
                  const Spacer(),
                  AppText(
                    DateTime.now().getDayMonthYearWithTime(),
                    style: textTheme.caption?.copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "You have ",
                  style: textTheme.headline5?.copyWith(color: AppColor.white),
                  children: [
                    TextSpan(
                      text: "10 tasks ",
                      style: textTheme.headline1!
                          .copyWith(color: AppColor.primary),
                    ),
                    TextSpan(
                      text: "for Today!",
                      style:
                          textTheme.headline5?.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppText(
                "Also 33 Pending tasks",
                style: textTheme.caption
                    ?.copyWith(fontSize: 11, color: AppColor.cyan),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const HeroRemainingEventsBlock(),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
