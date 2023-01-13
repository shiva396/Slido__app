import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentstate = "FOCUS";

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentstate = "FOCUS";
    currentDuration = selectedTime = 0;
    goal = rounds = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentstate == "FOCUS" && rounds != 3) {
      currentstate == "BREAK";
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      goal++;
    } else if (currentstate == "BREAK") {
      currentstate = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentstate == "FOCUS" && rounds == 3) {
      currentstate = "LONGBREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goal++;
    } else if (currentstate == "LONGBREAK") {
      currentstate = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }

}
