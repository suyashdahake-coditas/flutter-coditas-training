part of 'timer_bloc.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerStartedState extends TimerState {}

class TimerStoppedState extends TimerState {}

class FavouriteAddedState extends TimerState {}

class FavouriteDeletedState extends TimerState {}

class TimerTextState extends TimerState {
  final String timerText;

  TimerTextState(this.timerText);
}
