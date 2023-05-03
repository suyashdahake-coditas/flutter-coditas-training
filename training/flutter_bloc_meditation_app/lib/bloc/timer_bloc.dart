
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Stopwatch _stopwatch = Stopwatch();
  List stopwatchData = [];
  List favouritesData = [];


  bool timerStarted = false;

  void startTimer() {
    _stopwatch.start();
    timerStarted = !timerStarted;
  }

  void stopTimer() {
    _stopwatch.stop();
    timerStarted = !timerStarted;
    Duration duration = _stopwatch.elapsed;
    stopwatchData.add(
        '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}');
    print(stopwatchData);
    _stopwatch.reset();
  }

  void addToFavourite(int index) {
    print(stopwatchData);
    favouritesData.add(stopwatchData[index]);
    print(favouritesData);
  }

  void deleteFromFavourite(int index) {
    print(stopwatchData);
    favouritesData.removeAt(index);
    print(favouritesData);
  }

  String getTimerText() {
    Duration duration = _stopwatch.elapsed;
    return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  TimerBloc() : super(TimerInitial());

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is StartTimerEvent) {
      startTimer();
      yield TimerStartedState();
    } else if (event is StopTimerEvent) {
      stopTimer();
      yield TimerStoppedState();
    } else if (event is AddToFavouriteEvent) {
      addToFavourite(event.index);
      yield FavouriteAddedState();
    } else if (event is DeleteFromFavouriteEvent) {
      deleteFromFavourite(event.index);
      yield FavouriteDeletedState();
    } else if (event is GetTimerTextEvent) {
      yield TimerTextState(getTimerText());
    }
  }
}
