import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app_flutter/bloc/login/login_bloc.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/enum/app_emum.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/configs/routes/routes.dart';
import 'package:todo_app_flutter/constants/app_color.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/constants/app_text_theme.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/gen/assets.gen.dart';
import 'package:todo_app_flutter/ui/common/app_button.dart';
import 'package:todo_app_flutter/ui/common/app_icon_button.dart';
import 'package:todo_app_flutter/ui/common/app_loading_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/common/app_text_field.dart';
import 'package:todo_app_flutter/ui/common/keyboad_dismissible_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthenticationRepository>()),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            current is LoginFailure ||
            current is LoginSuccess ||
            current is LoginLoadInProgress,
        listener: (context, state) {
          if (state is LoginFailure) {
            AppSnackBar.showSnackbar(
              context,
              state.error,
              MessageType.error,
            );
          }
          if (state is LoginSuccess) {
            AppSnackBar.showSnackbar(
              context,
              state.success,
              MessageType.success,
            );
            getIt.get<NavigatorService>().navigator.pushNamedAndRemoveUntil(
                  AppRoutes.home,
                  (route) => false,
                );
          }
          if (state is LoginLoadInProgress) {
            AppLoadingDialog.openLoadingDialog(context);
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.bgColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Builder(builder: (context) {
                return Form(
                  key: formKey,
                  child: KeyboardDismissibleView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: kToolbarHeight - 20,
                        ),
                        Center(
                            child: SvgPicture.asset(
                          Assets.images.svg.karyaLogo,
                          height: 50,
                        )),
                        const SizedBox(
                          height: 12,
                        ),
                        AppText(
                          AppString.signInHeading,
                          style: AppTextTheme.heading1.copyWith(
                            letterSpacing: -2,
                            fontSize: 32,
                          ),
                        ),
                        AppText(
                          AppString.signUpToComplete,
                          style: AppTextTheme.bodyText1.copyWith(
                            color: AppColor.primary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AppTextField(
                          suffixIcon: const Icon(
                            Icons.alternate_email,
                            color: AppColor.primary,
                            size: 20,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: context.read<LoginBloc>().email,
                          hint: AppString.email,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: AppString.required,
                              ),
                              FormBuilderValidators.email(
                                errorText: AppString.invalidEmail,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextField(
                          controller: context.read<LoginBloc>().password,
                          hint: AppString.password,
                          isPassword: true,
                          validator: FormBuilderValidators.required(
                            errorText: AppString.required,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppText(
                            AppString.forgotPassword,
                            style: AppTextTheme.captionSmall.copyWith(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: AppPrimaryButton(
                            width: 172,
                            title: AppString.login,
                            isEnabled: true,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginRequested(),
                                    );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Center(
                          child: AppText(
                            "OR",
                            style: textTheme.bodyText1!.copyWith(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w600),
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
                                AppSnackBar.showSnackbar(
                                  context,
                                  AppString.serviceNotAvailable,
                                  MessageType.warning,
                                );
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
                              text: "Didn't have an account? ",
                              style: textTheme.bodyText1!
                                  .copyWith(letterSpacing: 0.5),
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppString.signUp,
                                  style: textTheme.bodyText1!.copyWith(
                                    letterSpacing: 0.5,
                                    color: Colors.cyanAccent,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRoutes.signUp,
                                        (_) => false,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
