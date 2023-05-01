import 'package:app/view_model/pokedex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pokemon_model.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

renderPokedexView(List<Pokemon> pokemon) {
  return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: pokemon.length,
          itemBuilder: (context, index) => Card(
                  child: ListTile(
                title: Text(pokemon[index].name),
                subtitle: Text(pokemon[index].description),
                onTap: () => {print('todo: add pokemon details')},
              ))));
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    final gameEventViewModel = context.watch<PokedexViewModel>();

    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pokedex'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("All"),
                ),
                Tab(
                  child: Text("Captured"),
                ),
                Tab(
                  child: Text("Wild"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: renderPokedexView(gameEventViewModel.getAllPokemon()),
              ),
              Center(
                child: Text("ListView of uncaptured Pokemons"),
              ),
              Center(
                child: Text("ListView of captured"),
              ),
            ],
          ),
        ));
  }
}
