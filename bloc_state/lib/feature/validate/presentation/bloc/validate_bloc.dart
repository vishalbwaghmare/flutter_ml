import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'validate_event.dart';
part 'validate_state.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidateState> {
  ValidateBloc() : super(ValidateState.initial()) {
    on<InitEvent>(_initEvent);
    on<CheckForValidationEvent>(_checkForValidationEvent);
  }

  void _initEvent(InitEvent event, Emitter<ValidateState> emit) {}

  void _checkForValidationEvent(
    CheckForValidationEvent event,
    Emitter<ValidateState> emit,
  ) {
    if (event.email.contains("@")) {
      emit(
        state.copyWith(
          isValid: true,
          validateMessage: "Entered eamil address is correct",
          iconColor: Colors.green,
        ),
      );
    } else if (event.email.isEmpty) {
      emit(state.copyWith(validateMessage: "* Required filed", isButtonEnabled: false));
    } else {
      emit(
        state.copyWith(
          isValid: false,
          validateMessage: "Please enter valid email address",
          iconColor: Colors.red,
        ),
      );
    }
  }
}
