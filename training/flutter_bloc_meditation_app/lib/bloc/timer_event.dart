part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class StartTimerEvent extends TimerEvent {}

class StopTimerEvent extends TimerEvent {}

class AddToFavouriteEvent extends TimerEvent {
  final int index;

  AddToFavouriteEvent(this.index);
}

class DeleteFromFavouriteEvent extends TimerEvent {
  final int index;

  DeleteFromFavouriteEvent(this.index);
}

class GetTimerTextEvent extends TimerEvent {}
