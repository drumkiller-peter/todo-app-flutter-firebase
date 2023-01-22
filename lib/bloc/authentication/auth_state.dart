part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadInProgress extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}
