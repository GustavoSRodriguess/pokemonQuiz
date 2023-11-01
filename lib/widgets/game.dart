import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_quiz/models/pokemon.dart';
import 'package:pokemon_quiz/screens/game_over_screen.dart';

class Game extends StatefulWidget {
  final List<Pokemon> pokemonList;

  Game({required this.pokemonList, Key? key}) : super(key: key);

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
      // Resposta correta, faça algo aqui
      print('Resposta correta!');
      acertos++;
    } else {
      // Resposta incorreta, faça algo aqui
      print('Resposta incorreta!');
    }
    tentativas++;
    if (tentativas < 4) {
      _gerarNovoPokemon();
    } else {
      // O jogo termina após 4 tentativas
      print('Fim do jogo. Acertos: $acertos');
      setState(() {
        jogoTerminou = true;
      });
    }
  }

  void _gerarNovoPokemon() {
    setState(() {
      if (tentativas < 4) {
        pokemonCerto = Random().nextInt(149);
        _gerarOpcoes();
      } else {
        // O jogo termina após 4 tentativas
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
                    verificarResposta(opcoes[0]);
                  },
                  child: Text(opcoes[0]),
                ),
                ElevatedButton(
                  onPressed: () {
                    verificarResposta(opcoes[1]);
                  },
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
                  child: Text(opcoes[2]),
                ),
                ElevatedButton(
                  onPressed: () {
                    verificarResposta(opcoes[3]);
                  },
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
              SizedBox(width: 20),
              Image.asset(
                'assets/correct.png', // Substitua 'assets' pelo caminho correto
                width: 32,
                height: 32,
              ),
              SizedBox(width: 20),
              Text('Erros: ${tentativas - acertos}'),
              SizedBox(width: 20),
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
