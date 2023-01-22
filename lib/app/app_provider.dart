import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/app/app.dart';
import 'package:todo_app_flutter/bloc/authentication/auth_bloc.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => AuthenticationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              context.read<AuthenticationRepository>(),
            )..add(AuthenticateUser()),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
