import 'package:pokemon_quiz/utils/constants.dart';

class Pokemon {
  String name;
  String url;

  Pokemon({required this.name, required this.url});

  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  get image => '$pokemonImgUrl/$id.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    return Pokemon(name: jsonData['name'], url: jsonData['url']);
  }
}
