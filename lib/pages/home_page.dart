import 'package:flutter/material.dart';
import 'package:squatting_assistant/widgets/counter_card.dart';
import 'package:squatting_assistant/widgets/outfit_title.dart';
import 'package:squatting_assistant/widgets/tools_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 30),
            child: OutfitTitle(
                title: 'Overview',
                textStyle: Theme.of(context).textTheme.titleLarge!),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: CounterCard(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: OutfitTitle(
                title: 'Tools',
                textStyle: Theme.of(context).textTheme.titleMedium!),
          ),
          const SizedBox(height: 20),
           ToolsTable(),
        ],
      ),
    );
  }
}
