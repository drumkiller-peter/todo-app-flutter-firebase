import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/data/models/user_model/user_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._authenticationRepository, this._profileRepository)
      : super(ProfileInitial()) {
    on<ProfileDataRequested>((event, emit) {
      emit(ProfileLoadInProgress());
      final userModel = _authenticationRepository.getUserData();
      if (!isClosed) {
        emit(ProfileSuccess(userModel: userModel));
      }
    });
  }

  final AuthenticationRepository _authenticationRepository;
  final ProfileRepository _profileRepository;
}
