import 'package:flutter/material.dart';
import 'package:pokemon_quiz/api/pokeapi.dart';
import 'package:pokemon_quiz/widgets/game.dart';

class QuizPokemon extends StatefulWidget {
  const QuizPokemon({super.key});

  @override
  State<QuizPokemon> createState() => _QuizPokemon();
}

class _QuizPokemon extends State<QuizPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Pokemon')),
      body: FutureBuilder(
        future: PokeApi.getPokemonList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Game(pokemonList: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
