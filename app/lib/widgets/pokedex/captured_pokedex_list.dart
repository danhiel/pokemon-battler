import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../view_models/pokedex_view_model.dart';

class CapturedPokedexList extends StatelessWidget {
  const CapturedPokedexList({super.key});

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final pokemons = pokedexViewModel.allCapturedPokemons;

    if (pokemons.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: pokemons.length,
          itemBuilder: (context, index) => Card(
                  child: ListTile(
                leading: Text(
                  pokemons[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                trailing: Image(
                    image: AssetImage(
                        'assets/sprites/${pokemons[index].shortName}.png')),
                onTap: () => {
                  context.pushNamed('pokemonDetails', queryParameters: {'name': pokemons[index].shortName})
                },
              )));
    } else {
      return const Center(child: Text('No captured pokemons'));
    }
  }
}
