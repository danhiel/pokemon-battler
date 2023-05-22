import 'package:app/view_models/battle_view_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/battle/battle_screen.dart';
import 'package:app/widgets/common/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final selectedPokemon = pokedexViewModel.selectedPokemon;
    final battleViewModel = BattleViewModel();

    return SafeArea(
        child: ChangeNotifierProvider(
            create: (context) => battleViewModel,
            child: FutureBuilder(
                future: battleViewModel.startBattle(selectedPokemon!.shortName),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const BattleScreen();
                  } else {
                    return const LoadingScreen();
                  }
                })));
  }
}
