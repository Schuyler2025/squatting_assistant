import 'package:flutter/material.dart';
import 'package:squatting_assistant/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 54, 186, 152),
            brightness: Brightness.light,
            primary: const Color.fromARGB(255, 233, 196, 106)),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: 'Outfit-Bold',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              ),
          titleMedium: TextStyle(
            fontFamily: 'Outfit-Bold',
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Outfit-Bold',
            fontSize: 18,
          ),
          bodyMedium: TextStyle(fontFamily: 'Lato-Regular', fontSize: 14),
        ),
      ),
      title: 'Squatting Assistant',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255,233, 196, 106),
          elevation: 0,
        ),
        body: const SafeArea(child:  HomePage()),
      ),
    );
  }
}
