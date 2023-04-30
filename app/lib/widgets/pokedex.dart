import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
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
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("ListView of pokemons"),
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
