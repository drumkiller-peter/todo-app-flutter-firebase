import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? titleText;
  final String? hint;
  final String? initialValue;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final ValueChanged<String?>? onSaved;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final InputDecoration? inputDecoration;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? enabledInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Color? fillColor;
  final bool? filled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const AppTextField({
    Key? key,
    this.titleText,
    this.initialValue,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.isPassword = false,
    this.hint,
    this.prefixIcon,
    this.borderRadius,
    this.enabled,
    this.maxLines = 1,
    this.maxLength,
    this.maxLengthEnforcement,
    this.inputDecoration,
    this.label,
    this.contentPadding,
    this.suffixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.inputBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.labelStyle,
    this.hintStyle,
    this.fillColor,
    this.controller,
    this.enabledInputBorder,
    this.inputTextStyle,
    this.inputFormatter,
    this.textInputAction,
    this.onFieldSubmitted,
    this.filled,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  FormFieldValidator<String>? validator;

  void onPasswordVisibilityToggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...[
          AppText(
            widget.titleText!,
            style: textTheme.bodyText2?.copyWith(
              color: AppColor.black54,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          validator: widget.validator,
          obscureText: obscureText,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          initialValue: widget.initialValue,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          cursorColor: AppColor.white,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          style: widget.inputTextStyle ??
              textTheme.bodyText1?.copyWith(
                color: AppColor.white,
              ),
          decoration: widget.inputDecoration ??
              InputDecoration(
                errorStyle: textTheme.bodyText2?.copyWith(
                    color: AppColor.error.withOpacity(0.7),
                    fontStyle: FontStyle.italic),
                counterText: "",
                filled: widget.filled ?? true,
                fillColor: widget.fillColor ?? AppColor.formFillColor,
                label: widget.label != null
                    ? AppText(
                        widget.label ?? "",
                      )
                    : null,
                labelStyle: widget.labelStyle ??
                    textTheme.bodyText2?.copyWith(
                      color: AppColor.black,
                    ),
                hintText: widget.hint,
                hintStyle: widget.hintStyle ??
                    textTheme.bodyText2?.copyWith(
                      color: AppColor.secondaryTextColor,
                    ),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                enabledBorder: widget.enabledInputBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.black54,
                      ),
                    ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColor.black54,
                  ),
                ),
                border: widget.inputBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                focusedErrorBorder: widget.focusedErrorBorder ??
                    OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.error.withOpacity(0.5),
                      ),
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColor.error.withOpacity(0.5),
                  ),
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: onPasswordVisibilityToggle,
                        child: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColor.primary,
                          size: 20,
                        ),
                      )
                    : widget.suffixIcon,
              ),
          inputFormatters: widget.inputFormatter,
        ),
      ],
    );
  }
}
