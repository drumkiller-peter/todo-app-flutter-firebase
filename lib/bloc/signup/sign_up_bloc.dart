import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/auth_model/sign_up_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._authenticationRepository) : super(SignUpInitial()) {
    on<SignUpRequested>(_handleSignUp);
    on<SignUpUpdateDateRequested>(onChangeDate);
  }

  final AuthenticationRepository _authenticationRepository;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController fullName = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _handleSignUp(
      SignUpRequested event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadInProgress());
    SignUpModel signUpModel = SignUpModel(
      email: email.text.trim(),
      password: password.text.trim(),
      dob: selectedDate,
      fullName: fullName.text.trim(),
    );
    final response = await _authenticationRepository.signUp(signUpModel);
    if (!isClosed) {
      response.fold(
        (l) => emit(
          SignUpFailure(l),
        ),
        (r) => emit(
          SignUpSuccess(
            "${AppString.welcome} ${_authenticationRepository.getUserData()!.fullName.toString()}",
          ),
        ),
      );
    }
  }

  void onChangeDate(
      SignUpUpdateDateRequested event, Emitter<SignUpState> emit) {
    selectedDate = event.date;
    dob.text = selectedDate.getDateAsString();
    emit(
      SignUpCalendarUpdated(date: selectedDate),
    );
  }
}
