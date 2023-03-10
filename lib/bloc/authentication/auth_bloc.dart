import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/configs/enum/app_enum.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepository)
      : super(const AuthenticationState.unknown()) {
    on<AuthenticateUser>(
      (event, emit) => _getAuthStatus(event, emit),
    );
    on<AuthenticationLogoutRequested>(
      (event, emit) => _handleLogout(event, emit),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  _getAuthStatus(
      AuthenticateUser event, Emitter<AuthenticationState> emit) async {
    //TODO: handle OnBoarding here
    if (!_authenticationRepository.getIsUserOnBoarded()) {
      _handleAuth(event, emit);
    } else {
      emit(const AuthenticationState.onBoarding());
    }
  }

  void _handleAuth(
      AuthenticateUser event, Emitter<AuthenticationState> emit) async {
    if (_authenticationRepository.getUserData().uid.isNotEmpty) {
      emit(const AuthenticationState.authenticated());
    } else {
      emit(const AuthenticationState.unAuthenticated());
    }
  }

  _handleLogout(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    await _authenticationRepository.logout();
    emit(const AuthenticationState.unAuthenticated());
  }
}
