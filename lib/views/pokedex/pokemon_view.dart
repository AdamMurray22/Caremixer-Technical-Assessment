import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon/pokemon.dart';
import '../../view_models/pokemon/pokemon_view_model.dart';

class PokemonView extends StatelessWidget {
  PokemonView({super.key, required Pokemon pokemon, required Function back}) {
    _pokemonViewModel = PokemonViewModel(pokemon, back);
  }

  late final PokemonViewModel _pokemonViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _pokemonViewModel,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _pokemonViewModel.pokemon.displayName,
              style: TextStyle(
                fontSize: 50,
                color: ColourPalette.mint.asColor(),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 5, 10, 5),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fitWidth,
                    placeholder: 'assets/gifs/loading.gif', // Before image load
                    image:
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${_pokemonViewModel.pokemon.pokedexEntry}.png', // After image load
                    imageErrorBuilder: (buildContext, object, stackTrace) {
                      return Text(
                        "Something went wrong. Please try again later.",
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _pokemonViewModel.back();
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
