import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();

}
class _SchedulePageState extends State<SchedulePage> {


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    weightController.dispose();
    minutesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
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
          padding: const EdgeInsets.only(right:16),
          child: ElevatedButton(
            onPressed: () async{
              double weight = double.tryParse(weightController.text)?? 0;
              int minutes = int.tryParse(minutesController.text)?? 0;
              await showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Saved Successfully'),
                  content: Text('Your current training plan is: $weight kg for $minutes minutes '),
                  actions: [
                    ElevatedButton(onPressed: () {
                       Navigator.of(context).pop();
                      FocusScope.of(context).unfocus();
                    }, child: Text('OK'))
                  ],

                );
              });
            },

           child:Text('Save'), ),
        ),

      ],
    );
  }
}
