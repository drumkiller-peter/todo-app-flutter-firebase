import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/app/app.dart';
import 'package:todo_app_flutter/bloc/app_config/app_config_bloc.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/profile_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (BuildContext context) => TodoRepository(),
        ),
        RepositoryProvider(
          create: (BuildContext context) => ProfileRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              context.read<AuthenticationRepository>(),
            )..add(AuthenticateUser()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => AppConfigBloc(
              context.read<TodoRepository>(),
            )..add(AppConfigGetCategoryRequested()),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
