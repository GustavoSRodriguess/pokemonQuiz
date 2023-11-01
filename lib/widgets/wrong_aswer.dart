import 'package:flutter/material.dart';

class WrongAnswer extends StatefulWidget {
  const WrongAnswer({super.key});

  @override
  State<WrongAnswer> createState() => _WrongAnswer();
}

class _WrongAnswer extends State<WrongAnswer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/wrong.png'),
    );
  }
}
