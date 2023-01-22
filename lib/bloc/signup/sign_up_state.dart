// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoadInProgress extends SignUpState {}

class SignUpCalendarUpdated extends SignUpState {
  final DateTime date;
  SignUpCalendarUpdated({
    required this.date,
  });
  @override
  List<Object?> get props => [date];
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class SignUpSuccess extends SignUpState {
  final String success;

  SignUpSuccess(this.success);

  @override
  List<Object?> get props => [success];
}
