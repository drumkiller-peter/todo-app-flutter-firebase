part of 'auth_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  const AuthenticationState._({
    required this.status,
  });

  const AuthenticationState.unknown()
      : this._(status: AuthenticationStatus.unknown);

  const AuthenticationState.onBoarding()
      : this._(status: AuthenticationStatus.onBoarding);

  const AuthenticationState.authenticated()
      : this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unAuthenticated()
      : this._(status: AuthenticationStatus.unAuthenticated);

  @override
  List<Object?> get props => [status];
}
