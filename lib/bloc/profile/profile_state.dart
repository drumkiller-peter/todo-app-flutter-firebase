// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadInProgress extends ProfileState {}

class ProfileFailure extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel userModel;
  ProfileSuccess({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}
