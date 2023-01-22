import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/loading_indicator.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  final GestureTapCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? textColor;
  final Color? color;
  final BoxBorder? border;

  const AppPrimaryButton({
    Key? key,
    required this.title,
    this.padding,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = false,
    this.borderRadius,
    this.textColor,
    this.color,
    this.border,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingIndicator()
        : InkWell(
            onTap: isEnabled ? onPressed : null,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            /* 
              Changing Ink To Container because it was causing problem 
              when wrapping with containers 
            */
            child: Container(
              width: width,
              height: height,
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 32,
                  ),
              decoration: BoxDecoration(
                border: border,
                color: isEnabled
                    ? color ?? AppColor.primary.withOpacity(0.9)
                    : AppColor.disabledButtonColor,
                borderRadius: BorderRadius.circular(borderRadius ?? 32),
              ),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isEnabled
                            ? textColor ?? AppColor.white
                            : textColor ?? AppColor.black54,
                      ),
                ),
              ),
            ),
          );
  }
}
