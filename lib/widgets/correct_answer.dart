import 'package:flutter/material.dart';

class CorrectAswer extends StatefulWidget {
  const CorrectAswer({super.key});

  @override
  State<CorrectAswer> createState() => _CorrectAnswer();
}

class _CorrectAnswer extends State<CorrectAswer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/correct.png'),
    );
  }
}
