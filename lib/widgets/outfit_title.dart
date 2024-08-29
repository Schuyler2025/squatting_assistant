import 'package:flutter/material.dart';

class OutfitTitle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const OutfitTitle({super.key, required this.title, required this.textStyle});


  @override
  Widget build(BuildContext context) {
    return  Text(title, style: textStyle);
  }
}