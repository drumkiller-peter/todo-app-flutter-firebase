import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/configs/app_extension/date_time_extension.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/data/models/create_todo/todo_model.dart';
import 'package:todo_app_flutter/data/models/todo_categories/todo_categories_model.dart';
import 'package:todo_app_flutter/data/repository/authentication_repository.dart';
import 'package:todo_app_flutter/data/repository/todo_repository.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc(this._todoRepository, this._authenticationRepository)
      : super(CreateTodoInitial()) {
    //When category gets changed
    on<CreateTodoCategoryChangeRequested>((event, emit) {
      category.text = event.todoCategoriesModel.category;
      categoriesModel = event.todoCategoriesModel;
      emit(
        CreateTodoCategoryChanged(
            todoCategoriesModel: event.todoCategoriesModel),
      );
    });

    on<CreateTodoDateUpdateRequested>((event, emit) {
      if (event.selectedEventEndDate == null) {
        eventDate.text = event.selectedEventStartDate.getDefaultDateAsString();
      } else {
        eventDate.text =
            "${event.selectedEventStartDate.getDefaultDateAsString()} to ${event.selectedEventEndDate?.getDefaultDateAsString()}";
      }

      eventStartDateToSend = event.selectedEventStartDate;
      eventEndDateToSend = event.selectedEventEndDate;
      emit(
        CreateTodoDateChanged(
          selectedStartDate: event.selectedEventStartDate,
          selectedEndDate: eventEndDateToSend,
        ),
      );
    });
    on<CreateTodoTimeUpdateRequested>((event, emit) {
      if (event.selectedEventEndTime == null) {
        eventTime.text = event.selectedEventStartTime.getTimeOnly();
      } else {
        eventTime.text =
            "${event.selectedEventStartTime.getTimeOnly()} to ${event.selectedEventEndTime?.getTimeOnly()}";
      }

      eventStartTimeToSend = event.selectedEventStartTime;
      eventEndTimeToSend = event.selectedEventEndTime;
      emit(
        CreateTodoTimeChanged(
          selectedStartTime: event.selectedEventStartTime,
          selectedEndTime: event.selectedEventEndTime,
        ),
      );
    });

    on<CreateTodoRequested>(_createTodo);
  }

  final TodoRepository _todoRepository;
  final AuthenticationRepository _authenticationRepository;

  final TextEditingController category = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController eventDate = TextEditingController();
  final TextEditingController eventTime = TextEditingController();

  DateTime eventStartDateToSend = DateTime.now();
  DateTime? eventEndDateToSend;
  DateTime eventStartTimeToSend = DateTime.now();
  DateTime? eventEndTimeToSend;

  GlobalKey<FormState> createEventFormKey = GlobalKey<FormState>();
  TodoCategoriesModel categoriesModel = TodoCategoriesModel.empty();

  Future<void> _createTodo(
      CreateTodoRequested event, Emitter<CreateTodoState> emit) async {
    if (createEventFormKey.currentState!.validate()) {
      emit(CreateTodoLoadInProgress());
      TodoModel createTodoModel = TodoModel(
        uId: _authenticationRepository.getUserData()!.uid,
        todoCategoriesModel: categoriesModel,
        title: title.text.trim(),
        description: description.text.trim(),
        eventStartDate: eventStartDateToSend,
        eventEndDate: eventEndDateToSend,
        eventStartTime: eventStartTimeToSend,
        eventEndTime: eventEndTimeToSend,
        isCompleted: false,
      );
      final response = await _todoRepository.createTodo(
        createTodoModel,
      );
      if (!isClosed) {
        response.fold(
            (l) => emit(
                  CreateTodoFailure(error: l),
                ), (r) {
          emit(
            CreateTodoSuccess(
              success: AppString.createTodoSuccess,
            ),
          );
        });
      }
    }
  }
}
