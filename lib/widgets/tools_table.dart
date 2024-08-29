import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scidart/numdart.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:squatting_assistant/widgets/radio_dialog.dart';
import 'package:squatting_assistant/pages/schedule_page.dart';
import 'package:squatting_assistant/models/training_plan_model.dart';
import 'package:squatting_assistant/utils/calorie.dart';
import 'package:squatting_assistant/utils/counter_mode.dart';
import 'package:squatting_assistant/utils/mode_option.dart';

class ToolsTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToolsTableState();
  }
}

class _ToolsTableState extends State<ToolsTable> {
  StreamSubscription<AccelerometerEvent>? _subscription;
  StreamSubscription<GyroscopeEvent>? _subscriptionGyroscope;

  bool isSubscribed = false;

  void _subscribeToAccelerometerEvents() {
    // _subscription = accelerometerEventStream().listen((event) {});
    _subscription = null;
    _subscriptionGyroscope = null;
  }

  @override
  void initState() {
    _subscribeToAccelerometerEvents();
    super.initState();
  }

  @override
  void dispose() {
    _subscriptionGyroscope?.cancel();
    _subscription?.cancel();
    super.dispose();
  }

  void checkDataLengthAndProcess() {}

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 20),
            child: Container(
                height: 120,
                child: FloatingActionButton(
                    tooltip: 'Schedule',
                    heroTag: 'schedule',
                    backgroundColor: Color.fromARGB(255, 255, 215, 196),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SchedulePage()),
                      );
                    },
                    child: const Icon(Icons.analytics_outlined, size: 60))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 20),
            child: Container(
                height: 120,
                child: FloatingActionButton(
                    tooltip: 'Energy Comsumption',
                    heroTag: 'energy',
                    backgroundColor: Color.fromARGB(255, 240, 90, 126),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Consumer<TrainingPlanModel>(
                                builder: (context, model, child) {
                              return AlertDialog(
                                title: const Text('Energy Consumption'),
                                content: Text(
                                    'Expected Energy Consumption: ${Calorie.calculateCaloriesBurned(model.weight, model.goal, model.minutes).toStringAsFixed(2)} kcal\nActual Energy Consumption: ${model.squats == 0 ? 0 : Calorie.calculateCaloriesBurned(model.weight, model.squats, model.minutes).toStringAsFixed(2)} kcal\nCounter Mode: ${Mode.getValue(model.mode.number)}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    child: const Icon(Icons.energy_savings_leaf_outlined,
                        size: 60))),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 20, top: 30),
            child: Container(
                height: 120,
                child: FloatingActionButton(
                    tooltip: 'Squats Counter Mode',
                    heroTag: 'counter',
                    backgroundColor: Color.fromARGB(255, 232, 197, 229),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return RadioDialog();
                          });
                    },
                    child: const Icon(Icons.timer_outlined, size: 60))),
          ),
          Consumer<TrainingPlanModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 40, left: 20, top: 30),
              child: Container(
                  height: 120,
                  child: FloatingActionButton(
                      tooltip: 'Play/Pause',
                      heroTag: 'play',
                      onPressed: () {
                        if (model.mode == Mode.vague) {
                          if (_subscription == null) {
                            isSubscribed = true;
                            _subscription =
                                accelerometerEventStream().listen((event) {
                              if (model.accZ.length < 25) {
                                model.addAccZValue(event.z);
                              } else {
                                if (model.accZ.isNotEmpty) {
                                  var data = Array.empty();
                                  for (var i = 0; i < model.accZ.length; i++) {
                                    data.add(model.accZ[i]);
                                  }

                                  model.squats += SquatCounter(zAccData: data)
                                      .countSquats();

                                  model.accZ.clear();
                                  model.accZ.add(event.z);
                                  data.clear();

                                  setState(() {});
                                }
                              }
                            });
                          } else {
                            _subscription!.cancel();
                            _subscription = null;
                            isSubscribed = false;
                            setState(() {});
                          }
                        } else {
                          if (_subscriptionGyroscope == null &&
                              _subscription == null) {
                            isSubscribed = true;
                            _subscriptionGyroscope =
                                gyroscopeEventStream().listen((event) {
                              if (model.gyroY.length < 25) {
                                model.addGyroYValue(event.y);
                              } else {
                                if (model.accZ.isNotEmpty &&
                                    model.gyroY.isNotEmpty &&
                                    model.accZ.length == model.gyroY.length) {

                                  model.squats += SquatAccurateCounter(
                                          accelZ: model.accZ,
                                          gyroYaw: model.gyroY)
                                      .countSquats();

                                  model.gyroY.clear();
                                  model.gyroY.add(event.y);
                                  model.accZ.clear();
                                  model.accZ.add(event.z);
                                  
                                  setState(() {});
                                }
                              }
                            });
                            _subscription =
                                accelerometerEventStream().listen((event) {
                              if (model.accZ.length < 25) {
                                model.addAccZValue(event.z);
                              } else {}
                            });
                          } else {
                            _subscription!.cancel();
                            _subscriptionGyroscope!.cancel();
                            _subscription = null;
                            _subscriptionGyroscope = null;
                            isSubscribed = false;
                            setState(() {});
                          }
                        }
                      },
                      child: Icon(
                        isSubscribed
                            ? Icons.pause_circle_outline_outlined
                            : Icons.play_circle_outline_outlined,
                        size: 60,
                      ))),
            );
          }),
        ]),
      ],
    );
  }
}
