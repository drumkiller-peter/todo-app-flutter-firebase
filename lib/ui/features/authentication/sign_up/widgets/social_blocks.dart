import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/signup/sign_up_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/configs/routes/app_routes.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_icon_button.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class SocialBlocks extends StatelessWidget {
  const SocialBlocks({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: AppText(
            "OR",
            style: textTheme.bodyText1!
                .copyWith(color: AppColor.primary, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIconButton(
              onTap: () {
                context.read<SignUpBloc>().add(SignUpWithGoogleRequested());
              },
              svgPath: Assets.images.svg.google,
            ),
            AppIconButton(
              onTap: () {
                AppSnackBar.showSnackbar(
                  context,
                  AppString.serviceNotAvailable,
                  MessageType.warning,
                );
              },
              svgPath: Assets.images.svg.facebook,
            ),
            AppIconButton(
              onTap: () {
                AppSnackBar.showSnackbar(
                  context,
                  AppString.serviceNotAvailable,
                  MessageType.warning,
                );
              },
              svgPath: Assets.images.svg.linkedIn,
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(letterSpacing: 0.5),
              children: <TextSpan>[
                TextSpan(
                  text: AppString.login,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        color: Colors.cyanAccent,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.login,
                        (_) => false,
                      );
                    },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
