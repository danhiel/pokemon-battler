import 'package:app/widgets/start_up/start_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../database/pokemon_entity.dart';
import '../view_models/pokedex_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  onPressToStart(BuildContext context, Pokemon? selectedPokemon) {
    if (selectedPokemon != null) {
      context.go('/home');
    } else {
      context.go('/new');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();

    return StartUp(
        handlePressToStart: () =>
            onPressToStart(context, pokedexViewModel.selectedPokemon));
  }
}
