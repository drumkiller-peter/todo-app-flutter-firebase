import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_icon_with_bg.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.bgColor.withOpacity(0.7),
            border: const Border(
              bottom: BorderSide(color: AppColor.greyText),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconWithBg(
                svgPath: Assets.images.svg.google,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Appointment with Dr. Kushal Acharya, and goto Lab for Report generation. Also Consult DR. Ram for further info on my health.",
                      style: textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                    AppText(
                      "Health and Fitness",
                      style: textTheme.bodyText2!.copyWith(
                        color: AppColor.warning,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "7:00 pm",
                    style: textTheme.caption?.copyWith(color: AppColor.blue),
                  ),
                  AppText(
                    "8:00 pm",
                    style: textTheme.caption?.copyWith(color: AppColor.blue),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
