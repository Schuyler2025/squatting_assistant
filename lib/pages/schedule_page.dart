import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:squatting_assistant/models/training_plan_model.dart';

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();

// }
class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 196, 106),
        title: Text('Trainning Plan',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white)),
      ),
      body: SafeArea(
        child: TrainingForm(),
      ),
    );
  }
}

class TrainingForm extends StatefulWidget {
  @override
  State<TrainingForm> createState() => _TrainingFormState();
}

class _TrainingFormState extends State<TrainingForm> {
  TextEditingController weightController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    weightController.dispose();
    minutesController.dispose();
    goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TrainingPlanModel>(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: weightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Weight',
              hintText: 'Enter your weight in kg',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: minutesController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Minutes',
              hintText: 'Enter your training time in minutes',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: goalController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Goal',
              hintText: 'Enter your expected squats',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
        ),
        Consumer<TrainingPlanModel>(
          builder: (context, model, child){
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            onPressed: () async {
              model.weight = double.tryParse(weightController.text) ?? 0;
              model.minutes = int.tryParse(minutesController.text) ?? 0;
              model.goal = int.tryParse(goalController.text)?? 0;


              await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Saved Successfully'),
                      content: Text(
                          'Your current training plan is: ${model.weight} kg for ${model.minutes} minutes. You expect to do ${model.goal} squats. '),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              FocusScope.of(context).unfocus();
                            },
                            child: Text('OK'))
                      ],
                    );
                  });
            },
            child: Text('Save'),
          ),
        );}),
      ],
    );
  }
}
