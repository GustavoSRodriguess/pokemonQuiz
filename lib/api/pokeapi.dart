import 'package:pokemon_quiz/models/pokemon.dart';
import 'package:pokemon_quiz/services/api.dart';
import 'package:pokemon_quiz/utils/constants.dart';

class PokeApi {
  static Future<List<Pokemon>> getPokemonList({int? limit, int? offset}) async {
    /*
    da pra ao inves de separa depois fazer ele pegar 4 pokemons aleatórios aqui, ai vai de vc se achar q é mais fácil (talvez se ja)
    ai ficaria tipo:
    final int idAleatorio = Rndom().nextInt(150);
    final jsondata = await Api.getData('$pokeApiUrl/$idAleatorio')

    ai seta a lista tu seta pra ter no máximo 4 tlgd
    */
    limit ??= 150;
    offset ??= 0;

    final jsonData = await Api.getData('$pokeApiUrl?limit&offset=$offset');

    final List<Pokemon> pokemonList = [];

    for (var item in jsonData['results']) {
      final pokemon = Pokemon.fromJson(item);
      pokemonList.add(pokemon);
    }

    return pokemonList;
  }
}
