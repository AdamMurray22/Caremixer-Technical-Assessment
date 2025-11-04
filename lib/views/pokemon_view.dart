import 'package:caremixer_technical_assesment/view_models/pokemon_view_model.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:flutter/material.dart';

import '../models/pokemon/pokemon.dart';

class PokemonView extends StatelessWidget {
  PokemonView({super.key});

  final PokemonViewModel _pokemonViewModel = PokemonViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon",
          style: TextStyle(fontSize: 50, color: ColourPalette.mint.asColor()),
        ),
      ),
      body: ListenableBuilder(
        listenable: _pokemonViewModel,
        builder: (BuildContext context, Widget? child) {
          return _getGrid();
        },
      ),
    );
  }

  Widget _getGrid() {
    if (_pokemonViewModel.fetchComplete) {
      if (_pokemonViewModel.pokedex == null) {
        return Center(
          child: Column(
            children: [
              Text("Could Not Connect to Server."),
              Text("Please Try Again Later."),
            ],
          ),
        );
      }
      Widget pokemonGrid = GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: List.generate(_pokemonViewModel.pokedex!.length, (index) {
          Pokemon pokemon = _pokemonViewModel.pokedex![index];
          return Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 5, 10, 5),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fitWidth,
                    placeholder: 'assets/gifs/loading.gif', // Before image load
                    image:
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.pokedexEntry}.png', // After image load
                    imageErrorBuilder: (buildContext, object, stackTrace) {
                      return Text(
                        "Something went wrong. Please try again later.",
                      );
                    },
                  ),
                ),
                Text(
                  pokemon.displayName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }),
      );
      return pokemonGrid;
    }
    return Text("Loading...");
  }
}
