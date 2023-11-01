import 'package:pokemon_quiz/models/pokemon.dart';
import 'package:pokemon_quiz/services/api.dart';
import 'package:pokemon_quiz/utils/constants.dart';

class PokeApi {
  static Future<List<Pokemon>> getPokemonList({int? limit, int? offset}) async {
    limit ??= 150;
    offset ??= 0;

    final jsonData =
        await Api.getData('$pokeApiUrl?limit=$limit&offset=$offset');

    final List<Pokemon> pokemonList = [];

    for (var item in jsonData['results']) {
      final pokemon = Pokemon.fromJson(item);
      pokemonList.add(pokemon);
    }

    return pokemonList;
  }
}
