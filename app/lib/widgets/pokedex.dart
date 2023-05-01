import 'package:app/model/pokemon_details_model.dart';
import 'package:app/view_model/pokedex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  renderPokedexView(List<PokemonDetails> pokemon) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: pokemon.length,
        itemBuilder: (context, index) => Card(
                child: ListTile(
              leading: Image(image: AssetImage(pokemon[index].sprite)),
              title: Text(pokemon[index].name),
              subtitle: Text(pokemon[index].description),
              onTap: () => {print('todo: add pokemon details')},
            )));
  }

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();

    return DefaultTabController(
        initialIndex: 0,
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
              renderPokedexView(pokedexViewModel.getAllPokemon()),
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
