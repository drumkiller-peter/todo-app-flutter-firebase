import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/configs/app_extension/string_extension.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

const uuid = Uuid();

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc(this._todoRepository, this._authenticationRepository)
      : super(CreateTodoInitial()) {
    //When category gets changed
    on<CreateTodoCategoryChangeRequested>(
      (event, emit) {
        category.text = event.todoCategoriesModel.category;
        categoriesModel = event.todoCategoriesModel;
        createEventFormKey.currentState!.validate();
        emit(
          CreateTodoCategoryChanged(
              todoCategoriesModel: event.todoCategoriesModel),
        );
      },
    );

    on<CreateTodoDateUpdateRequested>(
      (event, emit) {
        if (event.selectedEventStartDate != null) {
          eventStartDateTimeToSend = event.selectedEventStartDate;
          eventStartDate.text =
              "${event.selectedEventStartDate!.getDefaultDateAsString()}, ${event.selectedEventStartDate!.getTimeOnly()}";
        }
        if (event.selectedEventEndDate != null) {
          eventEndDateTimeToSend = event.selectedEventEndDate;
          eventEndDate.text =
              "${event.selectedEventEndDate!.getDefaultDateAsString()}, ${event.selectedEventEndDate!.getTimeOnly()}";
        }
        createEventFormKey.currentState!.validate();
        emit(
          CreateTodoDateChanged(
            selectedStartDate: event.selectedEventStartDate,
            selectedEndDate: event.selectedEventEndDate,
          ),
        );
      },
    );

    on<CreateTodoSyncWithCalendarRequested>(
      (event, emit) {
        enableSyncWithGoogleCalendar = event.isEnabled;
        emit(
          CreateTodoSyncCalendarChanged(isEnabled: event.isEnabled),
        );
      },
    );

    on<CreateTodoRequested>(_createTodo);
  }

  final TodoRepository _todoRepository;
  final AuthenticationRepository _authenticationRepository;

  final TextEditingController category = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController eventStartDate = TextEditingController();
  final TextEditingController eventEndDate = TextEditingController();

  DateTime? eventStartDateTimeToSend;
  DateTime? eventEndDateTimeToSend;

  GlobalKey<FormState> createEventFormKey = GlobalKey<FormState>();
  TodoCategoriesModel categoriesModel = TodoCategoriesModel.empty();
  bool enableSyncWithGoogleCalendar = false;
  bool hasSyncedWithCalendarSuccess = false;
  String eventDateTimeError = "";

  Future<void> _createTodo(
      CreateTodoRequested event, Emitter<CreateTodoState> emit) async {
    try {
      emit(CreateTodoInitial());
      if (createEventFormKey.currentState!.validate() &&
          _checkEventDateTimeForValidation()) {
        emit(CreateTodoLoadInProgress());
        final randomId = uuid.v4();
        final eventUuid = randomId.removeHyphens();

        TodoModel createTodoModel = TodoModel(
          uuid: eventUuid,
          uId: _authenticationRepository.getUserData().uid,
          todoCategoriesModel: categoriesModel,
          title: title.text.trim(),
          description: description.text.trim(),
          eventStartDate: eventStartDateTimeToSend!,
          eventEndDate: eventEndDateTimeToSend!,
          isCompleted: false,
          createdAt: DateTime.now(),
          isSyncedWithGoogleCalendar: enableSyncWithGoogleCalendar,
        );

        final response = await _todoRepository.createTodo(createTodoModel);
        if (!isClosed) {
          response.fold(
            (l) => emit(
              CreateTodoFailure(error: l),
            ),
            (r) {
              emit(
                CreateTodoSuccess(success: AppString.createTodoSuccess),
              );
            },
          );
        }
      } else {
        emit(CreateTodoFailure(error: eventDateTimeError));
      }
    } on SocketException {
      emit(
        CreateTodoFailure(error: AppString.noInternet),
      );
    } on Exception {
      emit(
        CreateTodoFailure(error: AppString.couldNotProcess),
      );
    }
  }

  bool _checkEventDateTimeForValidation() {
    if (eventStartDateTimeToSend!.getDayMonthYearWithTime() ==
        eventEndDateTimeToSend!.getDayMonthYearWithTime()) {
      eventDateTimeError = AppString.eventSameDateTimeValidationMessage;
      return false;
    }
    if (eventStartDateTimeToSend!.isAfter(eventEndDateTimeToSend!)) {
      eventDateTimeError = AppString.eventInvalidDateTimeValidationMessage;
      return false;
    }
    return true;
  }
}
