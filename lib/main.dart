import 'package:flutter/material.dart';
import 'package:pokemon_quiz/screens/quizPokemon.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Quiz',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {'/': (context) => const QuizPokemon()},
      initialRoute: '/',
    );
  }
}
