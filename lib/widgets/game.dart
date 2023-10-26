import 'package:flutter/material.dart';
import 'package:pokemon_quiz/models/pokemon.dart';

class Game extends StatefulWidget {
  const Game({required this.pokemonList, super.key});
  final List<Pokemon> pokemonList;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {}
