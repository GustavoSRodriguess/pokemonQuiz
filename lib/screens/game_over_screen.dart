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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Acertos: $acertos'),
                SizedBox(width: 20),
                Image.asset(
                  'assets/correct.png', // Substitua 'assets' pelo caminho correto
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
          //Text('Acertos: $acertos'),
          ElevatedButton(
            onPressed: reiniciarJogo,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
}
