import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/data/models/user_model/user_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AuthenticateUser>(
      (event, emit) => _getAuthStatus(event, emit),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  _getAuthStatus(
      AuthenticateUser event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadInProgress());
    if (_authenticationRepository.getUserData()!.accessToken.isNotEmpty) {
      emit(AuthenticationSuccess());
    } else {
      emit(AuthenticationFailure());
    }
  }

  UserModel? getUser() {
    return _authenticationRepository.getUserData();
  }
}
