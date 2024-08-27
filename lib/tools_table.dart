import 'package:flutter/material.dart';
import 'package:squatting_assistant/schedule_page.dart';

class ToolsTable extends StatelessWidget {
  const ToolsTable({super.key});

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

                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('Energy Consumption'),
                          content: const Text('Energy Consumption: '),
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
                    onPressed: () {},
                    child: const Icon(Icons.timer_outlined, size: 60))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 20, top: 30),
            child: Container(
                height: 120,
                child: FloatingActionButton(
                    tooltip: 'Play/Pause',
                    heroTag: 'paly',
                    onPressed: () {},
                    child: const Icon(Icons.play_circle_outlined, size: 60))),
          ),
        ]),
      ],
    );
  }
}
