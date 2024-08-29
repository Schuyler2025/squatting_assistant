import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squatting_assistant/widgets/app.dart';

import 'package:squatting_assistant/models/training_plan_model.dart';



void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => TrainingPlanModel(), child: App()));
}
