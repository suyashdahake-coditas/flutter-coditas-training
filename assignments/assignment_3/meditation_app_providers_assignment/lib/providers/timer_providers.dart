import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  List stopwatchData = [];
  List favouritesData = [];

  // int index=0;

  bool timerStarted = false;

  void startTimer() {
    _stopwatch.start();
    timerStarted = !timerStarted;
    notifyListeners();
  }

  void stopTimer() {
    _stopwatch.stop();
    timerStarted = !timerStarted;
    Duration duration = _stopwatch.elapsed;
    stopwatchData.add(
        '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}');
    print(stopwatchData);
    _stopwatch.reset();
    notifyListeners();
  }

  void addToFavourite(int index) {
    print(stopwatchData);
    favouritesData.add(stopwatchData[index]);
    print(favouritesData);
    notifyListeners();
  }

  void deleteFromFavourite(int index) {
    print(stopwatchData);
    favouritesData.removeAt(index);
    print(favouritesData);
    notifyListeners();
  }

  String getTimerText() {
    Duration duration = _stopwatch.elapsed;
    return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
