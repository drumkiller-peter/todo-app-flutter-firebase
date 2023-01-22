import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/configs/routes/routes.dart';
import 'package:todo_app_flutter/constants/app_theme.dart';
import 'package:todo_app_flutter/ui/features/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          current is AuthenticationSuccess || current is AuthenticationFailure,
      listener: (ctx, state) {
        if (state is AuthenticationSuccess) {
          getIt.get<NavigatorService>().navigator.pushNamed(AppRoutes.login);
        } else {
          getIt.get<NavigatorService>().navigator.pushNamed(AppRoutes.signUp);
        }
      },
      child: MaterialApp(
        navigatorKey: getIt.get<NavigatorService>().navigatorKey,
        theme: AppTheme.defaultTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
