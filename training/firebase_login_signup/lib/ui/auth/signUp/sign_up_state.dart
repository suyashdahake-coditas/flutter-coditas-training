part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}


class SignUpFailureState extends SignUpState {
  String errorMessage;

  SignUpFailureState({required this.errorMessage});
}

class ValidFields extends SignUpState {}

class EulaToggleState extends SignUpState {
  bool eulaAccepted;

  EulaToggleState(this.eulaAccepted);
}
