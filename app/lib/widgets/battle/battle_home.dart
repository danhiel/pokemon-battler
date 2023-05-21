import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartBattle extends StatefulWidget {
  const StartBattle({super.key});

  @override
  State<StartBattle> createState() => _StartBattleState();
}

class _StartBattleState extends State<StartBattle> {
  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    var selectedPokemon = pokedexViewModel.selectedPokemon!;

    return Container(
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
                shortName: selectedPokemon.shortName,
                displayName: selectedPokemon.name)
          ],
        ));
  }
}
