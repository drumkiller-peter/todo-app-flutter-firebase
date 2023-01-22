part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends SignUpEvent {}

class SignUpUpdateDateRequested extends SignUpEvent {
  final DateTime date;
  SignUpUpdateDateRequested({
    required this.date,
  });
  @override
  List<Object?> get props => [date];
}
