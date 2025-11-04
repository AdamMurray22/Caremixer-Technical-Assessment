import 'package:caremixer_technical_assesment/view_models/pokemon/pokedex_view_model.dart';
import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:caremixer_technical_assesment/views/pokedex/pokemon_view.dart';
import 'package:flutter/material.dart';

import '../../models/pokemon/pokemon.dart';

class PokedexView extends StatelessWidget {
  PokedexView({super.key});

  final PokedexViewModel _pokedexViewModel = PokedexViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _pokedexViewModel,
      builder: (BuildContext context, Widget? child) {
        return _view();
      },
    );
  }

  Widget _view() {
    if (_pokedexViewModel.pokemonSelected == null) {
      return _getGridView();
    }
    return PokemonView(
      pokemon: _pokedexViewModel.pokemonSelected!,
      back: _pokedexViewModel.returnToGrid,
    );
  }

  Widget _getGridView() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon",
          style: TextStyle(fontSize: 50, color: ColourPalette.mint.asColor()),
        ),
      ),
      body: _getGrid(),
    );
  }

  Widget _getGrid() {
    if (_pokedexViewModel.fetchComplete) {
      if (_pokedexViewModel.pokedex == null) {
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
        children: List.generate(_pokedexViewModel.pokedex!.length, (index) {
          Pokemon pokemon = _pokedexViewModel.pokedex![index];
          return Padding(
            padding: EdgeInsetsGeometry.fromLTRB(10, 5, 10, 5),
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.topStart,
              children: [
                IconButton(
                  onPressed: () {
                    _pokedexViewModel.pokemonPressed(pokemon);
                  },
                  icon: FadeInImage.assetNetwork(
                    alignment: Alignment.center,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      _pokedexViewModel.pokemonPressed(pokemon);
                    },
                    child: Text(
                      pokemon.displayName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
