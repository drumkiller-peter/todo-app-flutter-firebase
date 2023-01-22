import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app_flutter/bloc/signup/sign_up_bloc.dart';
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
import 'package:todo_app_flutter/ui/common/app_calendar_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_loading_dialog.dart';
import 'package:todo_app_flutter/ui/common/app_snackbar.dart';
import 'package:todo_app_flutter/ui/common/app_text.dart';
import 'package:todo_app_flutter/ui/common/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignUpBloc(
        context.read<AuthenticationRepository>(),
      ),
      child: BlocListener<SignUpBloc, SignUpState>(
        listenWhen: (previous, current) =>
            current is SignUpFailure ||
            current is SignUpSuccess ||
            current is SignUpLoadInProgress,
        listener: (context, state) {
          if (state is SignUpFailure) {
            Navigator.pop(context);
            AppSnackBar.showSnackbar(
              context,
              state.error,
              MessageType.error,
            );
          }
          if (state is SignUpSuccess) {
            Navigator.pop(context);
            AppSnackBar.showSnackbar(
              context,
              AppString.signUpSuccess,
              MessageType.success,
            );
            getIt.get<NavigatorService>().navigator.pushNamedAndRemoveUntil(
                  AppRoutes.login,
                  (route) => false,
                );
          }
          if (state is SignUpLoadInProgress) {
            AppLoadingDialog.openLoadingDialog(context);
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Builder(builder: (ctx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kToolbarHeight - 20,
                      ),
                      Center(
                          child: SvgPicture.asset(
                        Assets.images.svg.karyaLogo,
                        height: 40,
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText(
                        AppString.signUpHeading,
                        style: AppTextTheme.heading1.copyWith(
                          letterSpacing: -2,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
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
                        controller: ctx.read<SignUpBloc>().email,
                        hint: AppString.email,
                        suffixIcon: const Icon(
                          Icons.alternate_email_outlined,
                          color: AppColor.primary,
                          size: 20,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: AppString.required,
                          ),
                          FormBuilderValidators.email(
                            errorText: AppString.invalidEmail,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        controller: ctx.read<SignUpBloc>().fullName,
                        suffixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColor.primary,
                          size: 20,
                        ),
                        hint: AppString.fullName,
                        isPassword: false,
                        validator: FormBuilderValidators.required(
                          errorText: AppString.required,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        controller: ctx.read<SignUpBloc>().password,
                        hint: AppString.password,
                        isPassword: true,
                        validator: FormBuilderValidators.required(
                          errorText: AppString.required,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => AppCalendarDialog.openCalenderDialog(
                            ctx: context,
                            onSubmit: (datePickerRange) {
                              if (datePickerRange != null) {
                                ctx.read<SignUpBloc>().add(
                                      SignUpUpdateDateRequested(
                                        date: datePickerRange as DateTime,
                                      ),
                                    );
                              }
                              Navigator.pop(ctx);
                            }),
                        child: BlocBuilder<SignUpBloc, SignUpState>(
                          buildWhen: (previous, current) =>
                              current is SignUpCalendarUpdated,
                          builder: (context, state) {
                            return AppTextField(
                              controller: context.read<SignUpBloc>().dob,
                              hint: AppString.dateOfBirth,
                              enabled: false,
                              validator: FormBuilderValidators.required(
                                errorText: AppString.required,
                              ),
                              suffixIcon: const Icon(
                                Icons.calendar_month_outlined,
                                color: AppColor.primary,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Center(
                        child: AppPrimaryButton(
                          width: 172,
                          title: AppString.signUp,
                          isEnabled: true,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ctx.read<SignUpBloc>().add(
                                    SignUpRequested(),
                                  );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account? ",
                            style: Theme.of(ctx)
                                .textTheme
                                .bodyText1!
                                .copyWith(letterSpacing: 0.5),
                            children: <TextSpan>[
                              TextSpan(
                                text: AppString.login,
                                style:
                                    Theme.of(ctx).textTheme.bodyText1!.copyWith(
                                          letterSpacing: 0.5,
                                          color: Colors.cyanAccent,
                                        ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      ctx,
                                      AppRoutes.login,
                                      (_) => false,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
