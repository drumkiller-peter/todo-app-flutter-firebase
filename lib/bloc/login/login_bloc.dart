import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/auth_model/login_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(LoginInitial()) {
    on<LoginRequested>(_handleLogin);
  }

  final AuthenticationRepository _authenticationRepository;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _handleLogin(
      LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoadInProgress());
    LoginModel authModel = LoginModel(
      email: email.text,
      password: password.text,
    );
    final response = await _authenticationRepository.loginWithEmail(authModel);
    if (!isClosed) {
      response.fold(
          (l) => emit(
                LoginFailure(l),
              ), (r) {
        _authenticationRepository.setIsUserOnBoarded();
        emit(
          LoginSuccess(
            AppString.welcome,
          ),
        );
      });
    }
  }
}
