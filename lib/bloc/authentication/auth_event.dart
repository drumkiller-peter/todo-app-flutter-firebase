part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticateUser extends AuthenticationEvent {}

class UserInfoRequested extends AuthenticationEvent {}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
