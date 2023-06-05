import 'package:app/models/pokemon_details_model.dart';
import 'package:app/widgets/pokemon_details/pokemon_detail_moves.dart';
import 'package:app/widgets/pokemon_details/pokemon_details_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/pokedex_view_model.dart';

class PokemonDetailInfoScreen extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonDetailInfoScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    var captured =
        pokedexViewModel.getPokemonByShortName(pokemon.shortName)!.captured;

    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PokemonDetailsHeader(pokemon: pokemon),
              const Divider(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/${pokemon.shortName}.jpg',
                ),
              ),
              const Divider(height: 12),
              ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(pokemon.description,
                      style: const TextStyle(fontSize: 16))),
              const Divider(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: pokedexViewModel.selectedPokemon!.shortName ==
                                  pokemon.shortName ||
                              !captured
                          ? null
                          : () async {
                              await pokedexViewModel.setSelectedPokemon(
                                  shortName: pokemon.shortName);
                            },
                      child: const Text('Select Pokemon')),
                  ElevatedButton(
                    onPressed: !captured
                        ? null
                        : () async {
                            await pokedexViewModel.setCapturedPokemon(
                                isCaptured: false,
                                shortName: pokemon.shortName);
                          },
                    child: const Text('Release Pokemon'),
                  ),
                ],
              ),
              const Divider(height: 12),
              ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: const Text(
                  'Weakesss',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                    '${pokemon.name} is weak to ${pokemon.weakness}!',
                    style: const TextStyle(fontSize: 16)),
                trailing: Image(
                    image: AssetImage(
                      pokemon.weaknessIcon,
                    ),
                    height: 32,
                    width: 32,
                    fit: BoxFit.contain),
              ),
              const Divider(height: 12),
              PokemonDetailMovesScreen(moves: pokemon.moves),
            ],
          ),
        ));
  }
}
