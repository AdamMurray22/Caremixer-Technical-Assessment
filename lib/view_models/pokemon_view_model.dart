import 'package:caremixer_technical_assesment/models/pokemon/fetch_pokemon.dart';
import 'package:caremixer_technical_assesment/models/pokemon/pokedex.dart';
import 'package:flutter/cupertino.dart';

import '../models/pokemon/pokemon.dart';

class PokemonViewModel with ChangeNotifier
{
  late final Pokedex? _pokedex;
  bool _fetchComplete = false;

  PokemonViewModel()
  {
    _fetchPokedex();
  }

  Future<void> _fetchPokedex()
  async {
    _pokedex = await FetchPokemon().get(queryParameters: {"limit" : "10000"});
    fetchComplete = true;
  }

  List<Pokemon>? get pokedex => _fetchComplete ? _pokedex?.pokedex : null;
  bool get fetchComplete => _fetchComplete;

  set fetchComplete(complete) {
    _fetchComplete = complete;
    notifyListeners();
  }
}