import 'package:flutter/material.dart';

class ToolsGridview extends StatelessWidget {
  const ToolsGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:32, right: 32, top: 10, bottom:10),
            child: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add)),
          );
        }),
    );
  }
}
