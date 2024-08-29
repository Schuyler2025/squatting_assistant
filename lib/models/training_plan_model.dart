import 'package:flutter/material.dart';
import 'package:squatting_assistant/utils/mode_option.dart';

class TrainingPlanModel extends ChangeNotifier {
  double weight = 0;
  int minutes = 0;
  int goal = 0;
  int squats = 0;
  Mode mode = Mode.vague;
  List<double> accZ = [];
  List<double> gyroY = [];

  TrainingPlanModel({
    this.weight = 0,
    this.minutes = 0,
    this.goal = 0,
    this.squats = 0,
  });

  void addAccZValue(double value) {
    accZ.add(value);
    notifyListeners();
  }

  void addGyroYValue(double value) {
    gyroY.add(value);
    notifyListeners();
  }
}
