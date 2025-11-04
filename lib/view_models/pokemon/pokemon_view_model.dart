import 'package:flutter/material.dart';

import '../../models/pokemon/pokemon.dart';

class PokemonViewModel with ChangeNotifier
{
  final Pokemon pokemon;
  final Function back;

  PokemonViewModel(this.pokemon, this.back);
}