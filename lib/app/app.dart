import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/configs/routes/navigator_service.dart';
import 'package:todo_app_flutter/configs/routes/routes.dart';
import 'package:todo_app_flutter/constants/app_theme.dart';
import 'package:todo_app_flutter/ui/features/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (ctx, state) {
        if (state.status == AuthenticationStatus.onBoarding) {
          getIt.get<NavigatorService>().navigator.pushNamed(AppRoutes.login);
        } else if (state.status == AuthenticationStatus.authenticated) {
          getIt.get<NavigatorService>().navigator.pushNamed(AppRoutes.home);
        } else if (state.status == AuthenticationStatus.unAuthenticated) {
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
