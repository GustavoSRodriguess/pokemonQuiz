import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/models/pokemon.dart';
import 'package:pokemon_quiz/screens/game_over_screen.dart';

class Game extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const Game({required this.pokemonList, Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int pokemonCerto = Random().nextInt(149);
  List<String> opcoes = [];
  int tentativas = 0;
  int acertos = 0;
  bool jogoTerminou = false;

  @override
  void initState() {
    super.initState();
    _gerarOpcoes();
  }

  void _gerarOpcoes() {
    opcoes.clear();
    opcoes.add(widget.pokemonList[pokemonCerto].name);
    while (opcoes.length < 4) {
      int randomIndex = Random().nextInt(149);
      String opcaoErrada = widget.pokemonList[randomIndex].name;
      if (!opcoes.contains(opcaoErrada)) {
        opcoes.add(opcaoErrada);
      }
    }
    opcoes.shuffle();
  }

  void verificarResposta(String opcaoEscolhida) {
    if (opcaoEscolhida == widget.pokemonList[pokemonCerto].name) {
      print('Resposta correta!');
      acertos++;
    } else {
      print('Resposta incorreta!');
    }
    tentativas++;
    if (tentativas < 10) {
      _gerarNovoPokemon();
    } else {
      print('Fim do jogo. Acertos: $acertos');
      setState(() {
        jogoTerminou = true;
      });
    }
  }

  void _gerarNovoPokemon() {
    setState(() {
      if (tentativas < 10) {
        pokemonCerto = Random().nextInt(149);
        _gerarOpcoes();
      } else {
        setState(() {
          jogoTerminou = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic imagem = widget.pokemonList[pokemonCerto].image;

    if (jogoTerminou) {
      return GameOverScreen(
        acertos: acertos,
        reiniciarJogo: () {
          setState(() {
            acertos = 0;
            tentativas = 0;
            jogoTerminou = false;
          });
          _gerarNovoPokemon();
        },
      );
    }
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.network(
                  imagem,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    verificarResposta((opcoes[0]));
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
                  child: Text(opcoes[0]),
                ),
                const SizedBox(height: 64),
                ElevatedButton(
                  onPressed: () {
                    verificarResposta(opcoes[1]);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
                  child: Text(opcoes[1]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    verificarResposta(opcoes[2]);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
                  child: Text(opcoes[2]),
                ),
                const SizedBox(height: 64),
                ElevatedButton(
                  onPressed: () {
                    verificarResposta(opcoes[3]);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
                  child: Text(opcoes[3]),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Acertos: $acertos'),
              const SizedBox(width: 20),
              Image.asset(
                'assets/correct.png', // Substitua 'assets' pelo caminho correto
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 20),
              Text('Erros: ${tentativas - acertos}'),
              const SizedBox(width: 20),
              Image.asset(
                'assets/wrong.png', // Substitua 'assets' pelo caminho correto
                width: 32,
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
