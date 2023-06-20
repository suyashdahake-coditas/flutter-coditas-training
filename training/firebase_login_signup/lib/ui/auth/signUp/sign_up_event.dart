part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class RetrieveLostDataEvent extends SignUpEvent {}

class ValidateFieldsEvent extends SignUpEvent {
  GlobalKey<FormState> key;
  bool acceptTaS;

  ValidateFieldsEvent(this.key, {required this.acceptTaS});
}

class ToggleEulaCheckboxEvent extends SignUpEvent {
  bool tasAccepted;

  ToggleEulaCheckboxEvent({required this.tasAccepted});
}
