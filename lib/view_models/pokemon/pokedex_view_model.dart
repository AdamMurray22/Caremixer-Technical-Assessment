import 'package:caremixer_technical_assesment/models/pokemon/fetch_pokemon.dart';
import 'package:caremixer_technical_assesment/models/pokemon/pokedex.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon/pokemon.dart';

class PokedexViewModel with ChangeNotifier
{
  late final Pokedex? _pokedex;
  bool _fetchComplete = false;
  Pokemon? _pokemonSelected;

  PokedexViewModel()
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
  Pokemon? get pokemonSelected => _pokemonSelected;

  set fetchComplete(complete) {
    _fetchComplete = complete;
    notifyListeners();
  }

  void pokemonPressed(Pokemon pokemon)
  {
    _pokemonSelected = pokemon;
    notifyListeners();
  }

  void returnToGrid()
  {
    _pokemonSelected = null;
    notifyListeners();
  }
}