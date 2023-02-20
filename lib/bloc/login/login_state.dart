part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadInProgress extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class LoginSuccess extends LoginState {
  final String success;

  LoginSuccess(this.success);

  @override
  List<Object?> get props => [success];
}
class LoginWithGoogleSuccess extends LoginState {
  final String success;

  LoginWithGoogleSuccess(this.success);

  @override
  List<Object?> get props => [success];
}
