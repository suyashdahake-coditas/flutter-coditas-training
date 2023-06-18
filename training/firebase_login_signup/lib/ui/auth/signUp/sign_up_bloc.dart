import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<ValidateFieldsEvent>((event, emit) async {
      if (event.key.currentState?.validate() ?? false) {
        if (event.acceptEula) {
          event.key.currentState!.save();
          emit(ValidFields());
        } else {
          emit(SignUpFailureState(
              errorMessage: 'Please accept our terms of use.'));
        }
      } else {
        emit(SignUpFailureState(errorMessage: 'Please fill required fields.'));
      }
    });

    on<ToggleEulaCheckboxEvent>(
            (event, emit) => emit(EulaToggleState(event.eulaAccepted)));
  }
}
