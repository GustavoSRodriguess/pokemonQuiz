import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final int acertos;
  final VoidCallback reiniciarJogo;

  const GameOverScreen(
      {required this.acertos, required this.reiniciarJogo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Fim do jogo!'),
          Text('Acertos: $acertos'),
          ElevatedButton(
            onPressed: reiniciarJogo,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
}
