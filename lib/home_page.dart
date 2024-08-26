import 'package:flutter/material.dart';
import 'package:squatting_assistant/counter_card.dart';
import 'package:squatting_assistant/outfit_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

      return  Container(
        // width: double.infinity,
        // height: double.infinity,

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            Padding(
              padding: const EdgeInsets.only(top:100,left: 30),
              child: OutfitTitle(title: 'Overview',textStyle:Theme.of(context).textTheme.titleLarge!),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:35, right:35),
              child: CounterCard(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:30),
              child: OutfitTitle(title: 'Setting', textStyle: Theme.of(context).textTheme.titleMedium!),
            ),

          ],
        ),
      );


  }
}
