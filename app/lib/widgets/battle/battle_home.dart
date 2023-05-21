import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/common/loading_screen.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    return FutureBuilder(
        future: pokedexViewModel.selectedPokemon,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: const AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    PokemonCard(
                        shortName: snapshot.data.shortName,
                        displayName: snapshot.data.name)
                  ],
                ));
          }
          return const LoadingScreen();
        });
  }
}
