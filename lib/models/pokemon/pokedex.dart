import 'package:caremixer_technical_assesment/models/pokemon/pokemon.dart';

class Pokedex {
  final List<Pokemon> _pokedex = [];

  Pokedex(Map json) {
    for (Map<dynamic, dynamic> pokemon in json["results"]) {
      String url = pokemon["url"].toString();
      _pokedex.add(
        Pokemon(
          pokemon["name"],
            url,
          int.parse(url.split("/")[url.split("/").length - 2])
        ),
      );
    }
  }

  List<Pokemon> get pokedex => _pokedex;
}
