import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squatting_assistant/widgets/circle_widget.dart';
import 'package:squatting_assistant/models/training_plan_model.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 157, 189, 255),
      child: Row(children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                title: Text(
                  'Squats',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subtitle: Text.rich(
                    const TextSpan(
                        text:
                            'One cannot always be a hero, but one can always be a man.'),
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleWidget(
            child: Text(
              '${Provider.of<TrainingPlanModel>(context).squats}',

              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ]),
    );
  }
}
