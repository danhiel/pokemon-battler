import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokedex/captured_pokedex_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'all_pokedex_list.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
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
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              PokedexList(),
              CapturedPokedexList(),
            ],
          ),
        ));
  }
}
