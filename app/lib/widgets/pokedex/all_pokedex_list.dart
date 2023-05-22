import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pokemon_details/pokemon_details.dart';

class PokedexList extends StatelessWidget {
  const PokedexList({super.key});

  handleSpriteClick(String name, BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailsScreen(name: name,))
      );
  }

  Widget renderSprite(Pokemon pkm, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => handleSpriteClick(pkm.shortName, context),
        child: pkm.captured
            ? renderSpriteImage(pkm.shortName)
            : renderUncapturedSpriteImage(pkm.shortName),
      ),
    );
  }

  renderSpriteImage(String shortName) {
    return Image.asset(
      'assets/sprites/$shortName.png',
      fit: BoxFit.cover,
    );
  }

  renderUncapturedSpriteImage(String shortName) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcIn,
      ),
      child: renderSpriteImage(shortName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final pokemons = pokedexViewModel.allPokemons;

    return GridView.count(
        crossAxisCount: 4,
        children: List.generate(
            pokemons.length, (index) => renderSprite(pokemons[index], context)));
  }
}
