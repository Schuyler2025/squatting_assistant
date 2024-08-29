import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squatting_assistant/models/training_plan_model.dart';
import 'package:squatting_assistant/utils/mode_option.dart';

class RadioDialog extends StatefulWidget {
  const RadioDialog({super.key});

  @override
  State<RadioDialog> createState() => _RadioDialogState();
}

class _RadioDialogState extends State<RadioDialog> {
  String _selectedOption = 'Option 1';


  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, model, child) {
      return AlertDialog(
        title: Text('Select Counter Mode'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              value: Mode.accurate.value,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  model.mode = Mode.accurate;

                });
              },
              title: Text('Accurate Mode(Cheat Mode)'),
            ),
            RadioListTile<String>(
              value: Mode.vague.value,

              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                  model.mode = Mode.vague;

                });
              },
              title: Text('Vague Mode'),
            )
          ],

        ),
        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('OK')),
        ],
      );}
    );
  }
}